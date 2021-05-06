package parser.ast.nodes;


import edu.mit.csail.sdg.ast.ExprBinary;

public abstract class BinaryExprOrFormula extends ExprOrFormula {

    private static final long serialVersionUID = 7207124501163108858L;
    protected ExprOrFormula   left;
    protected ExprOrFormula   right;
    ExprBinary                expr;

    public BinaryExprOrFormula(Node parent, ExprBinary expr) {
        super(parent, expr.type());
        addToNodeMap(expr, this);
        this.left = buildExpression(this, expr.left);
        this.right = buildExpression(this, expr.right);
        this.expr = expr;
        // Add children.
        children.add(left);
        children.add(right);
    }

    public BinaryExprOrFormula(Node parent) {
        super(parent);
    }

    public ExprBinary getExpr() {
        return expr;
    }

    public ExprOrFormula getLeft() {
        return left;
    }

    public void setLeft(ExprOrFormula left) {
        this.left = left;
    }

    public ExprOrFormula getRight() {
        return right;
    }

    public void setRight(ExprOrFormula right) {
        this.right = right;
    }
}
