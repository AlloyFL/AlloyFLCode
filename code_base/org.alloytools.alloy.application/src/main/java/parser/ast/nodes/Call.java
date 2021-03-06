package parser.ast.nodes;

import java.util.List;
import java.util.stream.Collectors;

import edu.mit.csail.sdg.ast.ExprCall;
import parser.util.StringUtil;

public abstract class Call extends ExprOrFormula {

    private static final long     serialVersionUID = -7312920024265883085L;
    protected String              name;
    protected List<ExprOrFormula> arguments;
    protected ExprCall            expr;

    public Call(Node parent, ExprCall expr) {
        super(parent, expr.type());
        addToNodeMap(expr, this);
        this.name = StringUtil.ignoreLeadingThis(expr.fun.label);
        this.arguments = createArgs(expr);
        this.expr = expr;

        // Add children.
        children.addAll(arguments);
    }

    public Call(Node parent) {
        super(parent);
    }

    public ExprCall getExpr() {
        return expr;
    }

    private List<ExprOrFormula> createArgs(ExprCall expr) {
        return expr.args.stream().map(arg -> buildExpression(this, arg)).collect(Collectors.toList());
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<ExprOrFormula> getArguments() {
        return arguments;
    }

    public void setArguments(List<ExprOrFormula> arguments) {
        this.arguments = arguments;
    }
}
