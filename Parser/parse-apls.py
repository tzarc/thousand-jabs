#!/usr/bin/env python3

import sys, re, json
from itertools import product
from ExpressionTranslator import ExpressionTranslator
from ActionContainer import ActionContainer

###### Simple logic validation
testCondition = ExpressionTranslator().parse('(a|b&c|d&e|f)|g')
def pbool(b):
    return "1" if b else "0"
def test(a, b, c, d, e, f, g):
    r1 = True if eval(testCondition) else False
    r2 = True if ((a or (b and c) or (d and e) or f) or g) else False
    if r1 != r2:
        print("a=%s | b=%s & c=%s | d=%s & e=%s | f=%s | g=%s = r1=%s/r2=%s" % (pbool(a), pbool(b), pbool(c), pbool(d), pbool(e), pbool(f), pbool(g), pbool(r1), pbool(r2)))
        raise Exception("Logic did not match!")
for args in product([True, False], repeat=7):
    test(*args)

usedKeywords = []

###### Expression converter
def KeywordModifier(keyword, thisSpell):
    # Casting checks
    if keyword == "debuff.casting.up":
        keyword = "target.is_casting"
    if keyword == "debuff.casting.down":
        keyword = "(not target.is_casting)"
    if keyword == "target.debuff.casting.up":
        keyword = "target.is_casting"
    if keyword == "target.debuff.casting.down":
        keyword = "(not target.is_casting)"
    if keyword == "buff.casting.up":
        keyword = "player.is_casting"
    if keyword == "buff.casting.down":
        keyword = "(not player.is_casting)"

    # Single-word conversions
    if keyword == "cooldown":
        keyword = "cooldown.THIS_SPELL.remains"
    if keyword == "duration":
        keyword = "spell.THIS_SPELL.duration"
    if keyword == "ticking":
        keyword = "spell.THIS_SPELL.ticking"
    if keyword == "delay":
        keyword = "spell.THIS_SPELL.delay"
    if keyword == "remains":
        keyword = "spell.THIS_SPELL.remains"
    if keyword == "cast_time":
        keyword = "spell.THIS_SPELL.cast_time"
    if keyword == "tick_time":
        keyword = "spell.THIS_SPELL.tick_time"
    if keyword == "charges":
        keyword = "spell.THIS_SPELL.charges"
    if keyword == "charges_fractional":
        keyword = "spell.THIS_SPELL.charges_fractional"
    if keyword == "max_charges":
        keyword = "spell.THIS_SPELL.max_charges"
    if keyword == "recharge_time":
        keyword = "spell.THIS_SPELL.recharge_time"

    # Convert spell_targets.????? to just spell_targets
    if re.match("^spell_targets\.[a-zA-Z0-9_]+$", keyword):
        keyword = "spell_targets"

    # Convert (action.blah.zzz) => (spell.blah.zzz)
    keyword = re.sub("""^action\.""", "spell.", keyword)

    # Aura conversion (buff.blah.up) => (spell.blah.up)
    r = re.match("""^(((?P<unit>player|target|pet)\.)?(aura|buff|debuff|dot))\.(?P<spell>[^\.]+)\.(?P<tail>[^\.]+)$""", keyword)
    if r != None:
        keyword = "spell.%s.%s" % (r.group('spell'), r.group('tail'))

    # Aura conversion (buff.blah.up) => (spell.blah.up)
    r = re.match("""^incoming_damage_(?P<secs>[0-9]+)s$""", keyword)
    if r != None:
        keyword = "incoming_damage_over_%d" % (int(r.group('secs')) * 1000)
    r = re.match("""^incoming_damage_(?P<msecs>[0-9]+)ms$""", keyword)
    if r != None:
        keyword = "incoming_damage_over_%d" % (int(r.group('msecs')))

    # Triplet conversion (spell.blah.up) => (blah.spell_up)
    r = re.match("""^(?P<head>aura|artifact|talent|spell|cooldown|pet|player|target)\.(?P<spell>[^\.]+)\.(?P<tail>[^\.]+)$""", keyword)
    if r != None:
        keyword = "%s.%s_%s" % (r.group('spell'), r.group('head'), r.group('tail'))

    # Convert (_selected) => (_enabled)
    keyword = re.sub("_selected$", "_enabled", keyword)

    # Convert boolean checks:
    # -- (blah.spell_up) => (blah.spell_remains > 0)
    keyword = re.sub("""^(?P<name>[a-zA-Z0-9_\.]+)(?P<tail>_up|_react)$""", "(\g<name>_remains > 0)", keyword)
    # -- (blah.spell_down) => (blah.spell_remains == 0)
    keyword = re.sub("""^(?P<name>[a-zA-Z0-9_\.]+)(?P<tail>_down)$""", "(\g<name>_remains == 0)", keyword)
    # -- (not (blah.spell_remains)) => (blah.spell_remains == 0)
    keyword = re.sub("""^\(not \((?P<name>[a-zA-Z0-9_\.]+)(?P<tail>remains)\)\)$""", "(\g<name>\g<tail> == 0)", keyword)
    # -- (not (blah.spell_enabled)) => (blah.spell_selected)
    keyword = re.sub("""^\(not \((?P<name>[a-zA-Z0-9_\.]+)(?P<tail>enabled)\)\)$""", "(not \g<name>enabled)", keyword)
    # -- (not (blah.spell_ticking)) => (blah.spell_remains == 0)
    keyword = re.sub("""^\(not \((?P<name>[a-zA-Z0-9_\.]+)(?P<tail>ticking)\)\)$""", "(\g<name>remains == 0)", keyword)

    # Resources conversion (power) => (power.curr)
    r = re.match("^(?P<keyword>energy|chi|rage|pain|soul_fragments|fury|rune|runic_power|soul_shard|focus|insanity)$", keyword)
    if r != None:
        keyword = "%s.curr" % r.group('keyword')

    # Normalise percent (???_pct) => (???_percent)
    if keyword[-4:] == "_pct":
        keyword = "%s_percent" % keyword[:-4]
    if keyword[-4:] == ".pct":
        keyword = "%s.percent" % keyword[:-4]

    # Trailing number conversion (blah.00000) => (blah[00000])
    keyword = re.sub("""^(?P<head>[a-zA-Z].*)\.(?P<tail>[\d]+)$""", '\g<head>[\g<tail>]', keyword)

    # THIS_SPELL conversion to current action
    keyword = re.sub('THIS_SPELL', thisSpell, keyword)

    # Conditional/arithmetic expressions, where we're dealing with numbers
    keyword = re.sub("""(?P<lhs>[a-z][^\)\s]+) (?P<op>\>=|\>|\<=|\<|\+|\-|\*|\/)""", "\g<lhs>_as_number \g<op>", keyword)
    keyword = re.sub("""\((?P<lhs>[a-z][^\)\s]+)\) (?P<op>\>=|\>|\<=|\<|\+|\-|\*|\/)""", "(\g<lhs>_as_number) \g<op>", keyword)
    keyword = re.sub("""(?P<op>\>=|\>|\<=|\<|\+|\-|\*|\/) (?P<rhs>[a-z][^\)\s]+)""", "\g<op> \g<rhs>_as_number", keyword)
    keyword = re.sub("""(?P<op>\>=|\>|\<=|\<|\+|\-|\*|\/) \((?P<rhs>[a-z][^\)\s]+)\)""", "\g<op> (\g<rhs>_as_number)", keyword)
    while re.search("_as_number_as_number", keyword):
        keyword = re.sub("_as_number_as_number", "_as_number", keyword)

    # Collapse multiple enclosing brackets (if no inner brackets)
    while re.search("""^\(\(([^\(\)]+)\)\)$""", keyword):
        keyword = re.sub("""^\(\((?P<inner>[^\(\)]+)\)\)$""", "(\g<inner>)", keyword)

    # Copy out all the keywords we found, so they can be referenced later
    r = re.findall('([a-zA-Z][a-zA-Z0-9\._]*)', keyword)
    for kw in r:
        kw = re.sub('_as_number$', '', kw)
        usedKeywords.append(kw)

    return keyword

def ConvertExpression(expr, thisSpell):
    return ExpressionTranslator(modifier = lambda x: KeywordModifier(x, thisSpell)).parse(expr)

actionMatcher = re.compile("""actions((\.(?P<list>[a-zA-Z0-9]+))?)([\+]?=[\/]?)(?P<action>[^,]+),(?P<params>.*)""")
paramMatcher = re.compile("""(?P<name>[^=]+)=(?P<value>.*)""")


# sys.argv[0] == parse-apls.py
# sys.argv[1] == class (monk)
# sys.argv[2] == spec-identifier (legion-dev::monk::brewmaster)
# sys.argv[3] == monk_brewmaster.simc
className = sys.argv[1]
specId = sys.argv[2]
simcFile = sys.argv[3]

actionContainer = ActionContainer(className = className, specId = specId)

def GetConvertedAndKeywords(expr, thisSpell):
    try:
        converted = ConvertExpression(expr, action)
        r = re.findall('([a-zA-Z][a-zA-Z0-9\._]*)', converted)
        convertedKeywords = []
        for kw in r:
            kw = re.sub('_as_number$', '', kw)
            convertedKeywords.append(kw)
        return (expr, converted, convertedKeywords)
    except Exception as e:
        print("\n\n]] ]] ]] ]] ]] @@@ ERROR! @@@ [[ [[ [[ [[ [[\n\n"+str(e)+"\n\n")
        sys.stderr.write("\n\nERROR!\n\n"+str(e)+"\n\n")
        return (expr, '', [])


if simcFile[-5:] == ".simc":
    f = open(simcFile, 'r')
    for line in f:
        if line[:6] == "action":
            line = line.rstrip()
            result = actionMatcher.match(line)
            if result != None:
                action = result.group('action')
                actionList = result.group('list')
                if actionList == None:
                    actionList = 'default'

                actionDict = {
                    'simc_line': line,
                    'action': action,
                }

                params = result.group('params').split(",")
                if len(params) > 0:
                    for param in params:
                        paramresult = paramMatcher.match(param)
                        if paramresult != None:
                            name = paramresult.group('name')
                            value = paramresult.group('value')
                            if name == "if":
                                name = "condition"
                            actionDict[name] = value

                            if name == "condition":
                                try:
                                    (expr, converted, convertedKeywords) = GetConvertedAndKeywords(value, action)
                                    actionDict["%s_converted" % name] = converted
                                    actionDict['%s_keywords' % name] = convertedKeywords
                                except Exception as e:
                                    print("\n\n]] ]] ]] ]] ]] @@@ ERROR! @@@ [[ [[ [[ [[ [[\n\n"+str(e)+"\n\n")
                                    sys.stderr.write("\n\nERROR!\n\n"+str(e)+"\n\n")

                if actionDict['action'] == 'variable':
                    (expr, converted, convertedKeywords) = GetConvertedAndKeywords(actionDict['value'], action)
                    actionDict["value_converted"] = converted
                    actionDict['value_keywords'] = convertedKeywords


                actionContainer.AddEntry(actionList, actionDict)

    skippedKeywords = set(['&', '&&', 'and', '|', '||', 'or', 'not', '(', ')', '=', '==', '<', '<=', '>', '>=', '+', '-', '*', '/', '%'])
    for kw in sorted(set(usedKeywords)):
        if not kw in skippedKeywords:
            actionContainer.AddKeyword(kw)

print(actionContainer.Render())
