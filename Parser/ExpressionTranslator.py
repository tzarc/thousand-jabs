from parsimonious.grammar import Grammar, NodeVisitor

class ExpressionTranslator(NodeVisitor):
    def __init__(self, **kwargs):
        if 'printer' in kwargs:
            self.printer = kwargs['printer']
        else:
            self.printer = lambda x: ()

        if 'modifier' in kwargs:
            self.modifier = kwargs['modifier']
        else:
            self.modifier = lambda x: x

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

    def modify(self, str):
        str = self.modifier(str)
        self.printer("===> '%s'" % str)
        return str

    def dump(self, node, children):
        self.printer(node)
        self.printer(children)

    def visit_fail(self, node, children):
        self.dump(node, children)
        raise NotImplementedError("Did not handle multiple arguments for %s (len=%d), children=%s." % (node.expr_name, len(children), children))

    def visit_(self, node, children):
        if len(children) > 0:
            return ''.join(children)
        return node.text

    def visit_Variable(self, node, children):
        return self.modifier(node.text)

    def visit_Primary(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            return self.modify("%s" % children[0])
        return self.modify("(%s)" % (''.join(children)))

    def visit_Factor(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            return self.modify("%s" % children[0])
        return self.modify("(%s)" % (''.join(children)))

    def visit_Term(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            return self.modify("%s" % children[0])
        return self.modify("(%s)" % (''.join(children)))

    def visit_RelationalExpression(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            return self.modify("%s" % children[0])
        elif len(children) == 2:
            return self.modify('((%s)%s)' % (children[0], children[1]))
        self.visit_fail(node, children)

    def visit_RelationalTail(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2:
            if children[0] == '=':
                children[0] = '=='
            return self.modify(' %s (%s)' % (children[0], children[1]))
        self.visit_fail(node, children)

    def visit_LogicalAndExpression(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            return self.modify("%s" % children[0])
        elif len(children) == 2:
            return self.modify('((%s)%s)' % (children[0], children[1]))
        self.visit_fail(node, children)

    def visit_LogicalAndTail(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == 'and':
            return self.modify(' and (%s)' % children[1])
        self.visit_fail(node, children)

    def visit_AndOp(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        return self.modify('and')

    def visit_LogicalOrExpression(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1 or (len(children) == 2 and children[1] == ''):
            return self.modify("%s" % children[0])
        elif len(children) == 2:
            return self.modify('((%s)%s)' % (children[0], children[1]))
        self.visit_fail(node, children)

    def visit_LogicalOrTail(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == 'or':
            return self.modify(' or (%s)' % children[1])
        self.visit_fail(node, children)

    def visit_OrOp(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        return self.modify('or')

    def visit_Parens(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 3 and children[0] == '(' and children[2] == ')':
            return self.modify("(%s)" % children[1])
        self.visit_fail(node, children)

    def visit_RelationalOp(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 1:
            return self.modify(children[0])
        self.visit_fail(node, children)

    def visit_FloorOp(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 3 and children[0] == 'floor(' and children[2] == ')':
            return self.modify('(math.floor(%s))' % children[1])
        self.visit_fail(node, children)

    def visit_CeilOp(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 3 and children[0] == 'ceil(' and children[2] == ')':
            return self.modify('(math.ceil(%s))' % children[1])
        self.visit_fail(node, children)

    def visit_Add(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '+':
            return self.modify(" + %s" % children[1])
        self.visit_fail(node, children)

    def visit_Sub(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '-':
            return self.modify(" - %s" % children[1])
        self.visit_fail(node, children)

    def visit_Mul(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '*':
            return self.modify(" * %s" % children[1])
        self.visit_fail(node, children)

    def visit_Div(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == '%':
            return self.modify(" / %s" % children[1])
        self.visit_fail(node, children)

    def visit_Not(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 2 and children[0] == 'not':
            return self.modify("(not (%s))" % children[1])
        self.visit_fail(node, children)

    def visit_NotOp(self, node, children):
        self.printer("%s (len=%d), children=%s." % (node.expr_name, len(children), children))
        if len(children) == 0:
            return self.modify('not')
        self.visit_fail(node, children)
