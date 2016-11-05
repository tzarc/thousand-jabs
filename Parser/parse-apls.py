#!/usr/bin/env python3

import sys, re
from itertools import product
from ExpressionTranslator import ExpressionTranslator

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

    keyword = re.sub("""^action\.""", "spell.", keyword)

    # Convert boolean checks
    keyword = re.sub("""^\(not \((?P<name>[a-zA-Z0-9_\.]+)(?P<tail>cooldown_remains|spell_remains)\)\)$""", "(\g<name>\g<tail> == 0)", keyword)

    # Aura conversion
    r = re.match("""^(((player|target|pet)\.)?aura|buff|debuff|dot)\.(?P<spell>[^\.]+)\.(?P<tail>[^\.]+)$""", keyword)
    if r != None:
        keyword = "spell.%s.%s" % (r.group('spell'), r.group('tail'))

    # Triplet conversion
    r = re.match("""^(?P<head>aura|artifact|talent|spell|cooldown)\.(?P<spell>[^\.]+)\.(?P<tail>[^\.]+)$""", keyword)
    if r != None:
        keyword = "%s.%s_%s" % (r.group('spell'), r.group('head'), r.group('tail'))

    # Convert resources into resource.curr
    r = re.match("^(?P<keyword>energy|chi|rage|pain|soul_fragments|fury|rune|runic_power|soul_shard|focus)$", keyword)
    if r != None:
        keyword = "%s.curr" % r.group('keyword')

    # Normalise percent
    if keyword[-4:] == "_pct":
        keyword = "%s_percent" % keyword[:-4]
    if keyword[-4:] == ".pct":
        keyword = "%s.percent" % keyword[:-4]

    # Convert blah.00000 to blah[00000]
    keyword = re.sub("""^(?P<head>[a-zA-Z].*)\.(?P<tail>[\d]+)$""", '\g<head>[\g<tail>]', keyword)

    # Convert THIS_SPELL to the action we're converting for
    keyword = re.sub('THIS_SPELL', thisSpell, keyword)

    # Collapse multiple brackets (if no inner brackets)
    while re.search("""^\(\(([^\(\)]+)\)\)$""", keyword):
        print("Old: '%s'" % keyword)
        keyword = re.sub("""^\(\((?P<inner>[^\(\)]+)\)\)$""", "(\g<inner>)", keyword)
        print("New: '%s'" % keyword)

    return keyword

def ConvertExpression(expr, thisSpell):
    return ExpressionTranslator(modifier = lambda x: KeywordModifier(x, thisSpell), printer = print).parse(expr)

actionMatcher = re.compile("""actions((\.(?P<list>[a-zA-Z0-9]+))?)([\+]?=[\/]?)(?P<action>[^,]+),(?P<params>.*)""")
paramMatcher = re.compile("""(?P<name>[^=]+)=(?P<value>.*)""")

for arg in sys.argv:
    if arg[-5:] == ".simc":
        f = open(arg, 'r')
        for line in f:
            if line[:6] == "action":
                line = line.rstrip()
                result = actionMatcher.match(line)
                if result != None:
                    print("----")
                    print("Line: %s" % line)
                    action = result.group('action')
                    print("Action: %s" % action)
                    actionList = result.group('list')
                    if actionList == None:
                        actionList = 'default'
                    print("List: %s" % actionList)
                    params = result.group('params').split(",")
                    if len(params) > 0:
                        print("Params:")
                        for param in params:
                            paramresult = paramMatcher.match(param)
                            if paramresult != None:
                                name = paramresult.group('name')
                                value = paramresult.group('value')
                                print("  %s: %s" % (name, value))
                                if name == "if":
                                    print("  %s: %s" % (name, ConvertExpression(value, action)))
