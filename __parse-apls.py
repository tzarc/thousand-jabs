#!/usr/bin/env python3

import traceback
from parsimonious.grammar import Grammar, NodeVisitor

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
        print(node)
        print(children)

    def visit_fail(self, node, children):
        self.dump(node, children)
        raise NotImplementedError("Did not handle multiple arguments for %s (len=%d), children=%s." % (node.expr_name, len(children), children))

    def visit_(self, node, children):
        if len(children) > 0:
            return ''.join(children)
        return node.text

    def visit_Variable(self, node, children):
        return node.text

    def visit_Primary(self, node, children):
        return ''.join(children)

    def visit_Factor(self, node, children):
        return ''.join(children)

    def visit_Term(self, node, children):
        return ''.join(children)

    def visit_RelationalExpression(self, node, children):
        if len(children) == 2 and children[1] == '':
            return '(%s)' % children[0]
        elif len(children) == 2:
            return '(%s) %s' % (children[0], children[1])
        self.visit_fail(node, children)

    def visit_RelationalTail(self, node, children):
        if len(children) == 2:
            if children[0] == '=':
                children[0] = '=='
            return '%s (%s)' % (children[0], children[1])
        self.visit_fail(node, children)

    def visit_LogicalAndExpression(self, node, children):
        if len(children) == 2 and children[1] == '':
            return '(%s)' % children[0]
        elif len(children) == 2:
            return '((%s)%s)' % (children[0], children[1])
        self.visit_fail(node, children)

    def visit_LogicalAndTail(self, node, children):
        if len(children) == 2 and children[0] == 'and':
            return ' and (%s)' % children[1]
        self.visit_fail(node, children)

    def visit_AndOp(self, node, children):
        return 'and'

    def visit_LogicalOrExpression(self, node, children):
        if len(children) == 2 and children[1] == '':
            return '(%s)' % children[0]
        elif len(children) == 2:
            return '((%s)%s)' % (children[0], children[1])
        self.visit_fail(node, children)

    def visit_LogicalOrTail(self, node, children):
        if len(children) == 2 and children[0] == 'or':
            return ' or (%s)' % children[1]
        self.visit_fail(node, children)

    def visit_OrOp(self, node, children):
        return 'or'

    def visit_Parens(self, node, children):
        if len(children) == 3 and children[0] == '(' and children[2] == ')':
            return '(%s)' % children[1]
        self.visit_fail(node, children)

    def visit_RelationalOp(self, node, children):
        if len(children) == 1:
            return '%s' % children[0]
        self.visit_fail(node, children)

    def visit_FloorOp(self, node, children):
        if len(children) == 3 and children[0] == 'floor(' and children[2] == ')':
            return '(math.floor(%s))' % children[1]
        self.visit_fail(node, children)

    def visit_Add(self, node, children):
        if len(children) == 2 and children[0] == '+':
            return " + (%s)" % children[1]
        self.visit_fail(node, children)

    def visit_Sub(self, node, children):
        if len(children) == 2 and children[0] == '-':
            return " - (%s)" % children[1]
        self.visit_fail(node, children)

    def visit_Mul(self, node, children):
        if len(children) == 2 and children[0] == '*':
            return " * (%s)" % children[1]
        self.visit_fail(node, children)

    def visit_Div(self, node, children):
        if len(children) == 2 and children[0] == '%':
            return " / (%s)" % children[1]
        self.visit_fail(node, children)

    def visit_Not(self, node, children):
        if len(children) == 2 and children[0] == 'not':
            return "(not (%s))" % children[1]
        self.visit_fail(node, children)

    def visit_NotOp(self, node, children):
        if len(children) == 0:
            return 'not'
        self.visit_fail(node, children)


res = LuaFormatter().parse('!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&(!artifact.fiery_demise.enabled|(max_charges-charges_fractional)*recharge_time<cooldown.fiery_brand.remains+5)&(cooldown.sigil_of_flame.remains>7|charges=2)')
print(res)

# (((((not (sigil_placed)))) and (((((not (in_flight)))) and ((((remains - (travel_time) - (delay)) < ((0.3 * (duration)))) and ((((((((((not (artifact.fiery_demise.enabled))))) or ((((((((max_charges - (charges_fractional))))) * (recharge_time)) < ((cooldown.fiery_brand.remains + (5)))))))))) and ((((((((cooldown.sigil_of_flame.remains) > ((7)))) or ((((charges) == ((2))))))))))))))))))
