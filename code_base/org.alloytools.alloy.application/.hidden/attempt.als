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
((n1 in (n2.neighbors)) => (n1 !in (n2.(^(neighbors - (^(n2->n1)))))))
})
}

run run_1 for 3 Node
