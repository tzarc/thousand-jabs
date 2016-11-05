#!/usr/bin/env python3

import traceback
from parsimonious.grammar import Grammar, NodeVisitor

def xprint(x):
    if not True:
        print(x)

keywords = []
def KeywordModifier(keyword):
    keywords.append(keyword)
    return keyword

class LuaFormatter(NodeVisitor):
    grammar = Grammar("""
        Input = Expression

        Term = Factor (Add / Sub)*
        Add = "+" Factor
        Sub = "-" Factor
        Factor = Primary (Mul / Div)*
        Mul = "*" Primary
        Div = "%" Primary
        Primary = FloorOp / CeilOp / Parens / Not / Variable
        Not = NotOp Variable
        NotOp = "!"
        Variable = ~"[a-zA-Z0-9\._]+"

        Expression = LogicalOrExpression
        RelationalExpression = Term RelationalTail*
        RelationalTail = RelationalOp RelationalExpression
        LogicalAndExpression = RelationalExpression LogicalAndTail*
        LogicalAndTail = AndOp LogicalAndExpression
        LogicalOrExpression = LogicalAndExpression LogicalOrTail*
        LogicalOrTail = OrOp LogicalOrExpression

        Parens = "(" Expression ")"
        FloorOp = "floor(" Expression ")"
        CeilOp = "ceil(" Expression ")"

        RelationalOp = "<=" / "<" / ">=" / ">" / "==" / "="
        AndOp = "&" / "&&"
        OrOp = "|" / "||"
    """)

    def dump(self, node, children):
        xprint(node)
        xprint(children)

    def visit_fail(self, node, children):
        self.dump(node, children)
        raise NotImplementedError("Did not handle multiple arguments for %s (len=%d), children=%s." % (node.expr_name, len(children), children))

    def visit_(self, node, children):
        if len(children) > 0:
            return ''.join(children)
        return node.text

    def visit_Variable(self, node, children):
        return KeywordModifier(node.text)

    def visit_Primary(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            ret = "%s" % children[0]
            xprint("===> '%s'" % ret)
            return ret
        ret = "(%s)" % (''.join(children))
        xprint("===> '%s'" % ret)
        return ret

    def visit_Factor(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            ret = "%s" % children[0]
            xprint("===> '%s'" % ret)
            return ret
        ret = "(%s)" % (''.join(children))
        xprint("===> '%s'" % ret)
        return ret

    def visit_Term(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            ret = "%s" % children[0]
            xprint("===> '%s'" % ret)
            return ret
        ret = "(%s)" % (''.join(children))
        xprint("===> '%s'" % ret)
        return ret

    def visit_RelationalExpression(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            ret = "%s" % children[0]
            xprint("===> '%s'" % ret)
            return ret
        elif len(children) == 2:
            ret = '((%s)%s)' % (children[0], children[1])
            xprint("===> '%s'" % ret)
            return ret
        self.visit_fail(node, children)

    def visit_RelationalTail(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2:
            if children[0] == '=':
                children[0] = '=='
            return ' %s (%s)' % (children[0], children[1])
        self.visit_fail(node, children)

    def visit_LogicalAndExpression(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            ret = "%s" % children[0]
            xprint("===> '%s'" % ret)
            return ret
        elif len(children) == 2:
            ret = '((%s)%s)' % (children[0], children[1])
            xprint("===> '%s'" % ret)
            return ret
        self.visit_fail(node, children)

    def visit_LogicalAndTail(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == 'and':
            return ' and (%s)' % children[1]
        self.visit_fail(node, children)

    def visit_AndOp(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        return 'and'

    def visit_LogicalOrExpression(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            ret = "%s" % children[0]
            xprint("===> '%s'" % ret)
            return ret
        elif len(children) == 2:
            ret = '((%s)%s)' % (children[0], children[1])
            xprint("===> '%s'" % ret)
            return ret
        self.visit_fail(node, children)

    def visit_LogicalOrTail(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == 'or':
            return ' or (%s)' % children[1]
        self.visit_fail(node, children)

    def visit_OrOp(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        return 'or'

    def visit_Parens(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 3 and children[0] == '(' and children[2] == ')':
            return "(%s)" % children[1]
        self.visit_fail(node, children)

    def visit_RelationalOp(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1:
            return children[0]
        self.visit_fail(node, children)

    def visit_FloorOp(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 3 and children[0] == 'floor(' and children[2] == ')':
            return '(math.floor(%s))' % children[1]
        self.visit_fail(node, children)

    def visit_CeilOp(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 3 and children[0] == 'ceil(' and children[2] == ')':
            return '(math.ceil(%s))' % children[1]
        self.visit_fail(node, children)

    def visit_Add(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '+':
            return " + %s" % children[1]
        self.visit_fail(node, children)

    def visit_Sub(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '-':
            return " - %s" % children[1]
        self.visit_fail(node, children)

    def visit_Mul(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '*':
            return " * %s" % children[1]
        self.visit_fail(node, children)

    def visit_Div(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '%':
            return " / %s" % children[1]
        self.visit_fail(node, children)

    def visit_Not(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == 'not':
            return "(not (%s))" % children[1]
        self.visit_fail(node, children)

    def visit_NotOp(self, node, children):
        xprint("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 0:
            return 'not'
        self.visit_fail(node, children)


res = LuaFormatter().parse('(!ticking|(remains<8&target.health.pct>25&!talent.sabertooth.enabled)|persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die-remains>tick_time*4&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))')
print(res)

for kw in sorted(keywords):
    xprint(kw)

print(LuaFormatter().parse('0.5'))
print(LuaFormatter().parse('a|b&c|d&e|f'))

def test(a, b, c, d, e, f):
    r = False
    if ((a) or (((((b) and (c))) or (((((d) and (e))) or (f)))))):
        r = True
    print("%s | %s & %s | %s & %s | %s = %s" % ("1" if a else "0", "1" if b else "0", "1" if c else "0", "1" if d else "0", "1" if e else "0", "1" if f else "0", "1" if r else "0"))

for a in range(0,2):
    for b in range(0,2):
        for c in range(0,2):
            for d in range(0,2):
                for e in range(0,2):
                    for f in range(0,2):
                        test(True if a == 0 else False, True if b == 0 else False, True if c == 0 else False, True if d == 0 else False, True if e == 0 else False, True if f == 0 else False)
