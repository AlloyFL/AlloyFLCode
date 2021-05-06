module unknown
open util/integer [] as integer
abstract sig Color {}
one sig Red extends Color {}
one sig Blue extends Color {}
sig Node {
neighbors: (set Node),
color: (one Color)
}
pred run_1[] {

}

fact undirected {
(neighbors = (~neighbors))
}
fact graphIsConnected {
(all n1: (one Node) {
(all n2: (one (Node - n1)) {
(n1 in (n2.(^neighbors)))
})
})
}
fact treeAcyclic {
(all n1,n2: (one Node) {
((n1 in (n2.neighbors)) => (n1 !in (n2.(^(neighbors - (~(n2->n1)))))))
})
}

run run_1 for 3 Node

pred testtest9{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
color = Node0->Red0
}}}}
}
}
run testtest9 for 3 expect 1

pred testtest6{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1
neighbors = Node0->Node1 + Node1->Node0
color = Node0->Blue0 + Node1->Red0
}}}}
}
}
run testtest6 for 3 expect 1

pred testtest15{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1
no neighbors
color = Node0->Blue0 + Node1->Red0
}}}}
}
}
run testtest15 for 3 expect 0

pred testtest22{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node1 + Node1->Node0 + Node1->Node2 + Node2->Node1
color = Node0->Blue0 + Node1->Blue0 + Node2->Red0
}}}}
}
}
run testtest22 for 3 expect 1

pred testtest2{
{
some disj Blue0: Blue {some disj Blue0: Color {some disj Node0, Node1: Node {
no Red
Blue = Blue0
Color = Blue0
Node = Node0 + Node1
neighbors = Node0->Node1 + Node1->Node0
color = Node0->Blue0 + Node1->Blue0
}}}
}
}
run testtest2 for 3 expect 0

pred testtest4{
{
some disj Red0: Red {some disj Red0: Color {some disj Node0, Node1: Node {
Red = Red0
no Blue
Color = Red0
Node = Node0 + Node1
neighbors = Node0->Node1 + Node1->Node0
color = Node0->Red0 + Node1->Red0
}}}
}
}
run testtest4 for 3 expect 0

pred testtest17{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node1 + Node0->Node2 + Node1->Node0 + Node2->Node0
color = Node0->Blue0 + Node1->Red0 + Node2->Red0
}}}}
}
}
run testtest17 for 3 expect 1

pred testtest18{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node1 + Node0->Node2 + Node1->Node0 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Blue0 + Node1->Red0 + Node2->Red0
}}}}
}
}
run testtest18 for 3 expect 0

pred testtest5{
{
some disj Red0: Red {some disj Blue0, Blue1: Blue {some disj Red0, Blue0, Blue1: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0 + Blue1
Color = Red0 + Blue0 + Blue1
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Blue1 + Node1->Blue0 + Node2->Blue0
}}}}
}
}
run testtest5 for 3 expect 0

pred testtest14{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
neighbors = Node0->Node0
color = Node0->Red0
}}}}
}
}
run testtest14 for 3 expect 0

pred testtest20{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node1 + Node0->Node2 + Node1->Node0 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Blue0 + Node1->Blue0 + Node2->Red0
}}}}
}
}
run testtest20 for 3 expect 0

pred testtest3{
{
some disj Red0, Red1: Red {some disj Blue0: Blue {some disj Blue0, Red0, Red1: Color {some disj Node0, Node1, Node2: Node {
Red = Red0 + Red1
Blue = Blue0
Color = Blue0 + Red0 + Red1
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Red1 + Node1->Red0 + Node2->Red0
}}}}
}
}
run testtest3 for 3 expect 0

pred testtest7{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
no Node
no neighbors
no color
}}}
}
}
run testtest7 for 3 expect 1

pred testtest21{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Blue0 + Node1->Blue0 + Node2->Red0
}}}}
}
}
run testtest21 for 3 expect 1

pred testtest16{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1
no neighbors
color = Node0->Red0 + Node1->Red0
}}}}
}
}
run testtest16 for 3 expect 0

pred testtest19{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Red0 + Node1->Red0 + Node2->Red0
}}}}
}
}
run testtest19 for 3 expect 1

pred testtest11{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
no color
}}}}
}
}
run testtest11 for 3 expect 0

pred testtest8{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node2 + Node2->Node0 + Node2->Node1
color = Node0->Blue0 + Node1->Red0 + Node2->Blue0
}}}}
}
}
run testtest8 for 3 expect 1

pred testtest13{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0, Node1, Node2: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0 + Node1 + Node2
neighbors = Node0->Node2 + Node1->Node0 + Node2->Node1
color = Node0->Blue0 + Node1->Red0 + Node2->Red0
}}}}
}
}
run testtest13 for 3 expect 0

pred testtest10{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
color = Node0->Red0 + Node0->Blue0
}}}}
}
}
run testtest10 for 3 expect 0

pred testtest1{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
no neighbors
color = Node0->Blue0
}}}}
}
}
run testtest1 for 3 expect 1

pred testtest12{
{
some disj Red0: Red {some disj Blue0: Blue {some disj Red0, Blue0: Color {some disj Node0: Node {
Red = Red0
Blue = Blue0
Color = Red0 + Blue0
Node = Node0
neighbors = Node0->Node0
color = Node0->Blue0
}}}}
}
}
run testtest12 for 3 expect 0

