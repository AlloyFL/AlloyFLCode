sig List {  header : lone Node }

sig Node {  link: lone Node }

pred Acyclic (l: List) {
all n : Node | n in l.header.*link => n !in n.*link
}

val ValidListSizeTwo {
some disj List0: List {some disj Node0, Node1: Node {
List = List0 
header = List0->Node0
Node = Node0 + Node1
link = Node0->Node1
@cmd: {Acyclic[List0]}
}}
}
@Test Test0: run ValidListSizeTwo for 3 expect 1

val test9 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1
}}
}
@Test Test9: run test9 for 3 expect 1

val test6 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
@Test Test6: run test6 for 3 expect 1

val test15 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
@cmd:{Acyclic[List0]}
}}
}
@Test Test15: run test15 for 3 expect 0

val test22 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1 + Node2->Node0
@cmd:{Acyclic[List0]}
}}
}
@Test Test22: run test22 for 3 expect 1

val test2 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List1->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
@Test Test2: run test2 for 3 expect 1

val test4 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node0 + List0->Node1 + List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
}}
}
@Test Test4: run test4 for 3 expect 0

val test17 {
some disj List0, List1, List2: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1 + List2
header = List0->Node2 + List1->Node1 + List2->Node0
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node2->Node1
@cmd:{Acyclic[List2]}
}}
}
@Test Test17: run test17 for 3 expect 1

val test18 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node1 + Node2->Node0
@cmd:{Acyclic[List0]}
}}
}
@Test Test18: run test18 for 3 expect 0

val test5 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
no header
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
}}
}
@Test Test5: run test5 for 3 expect 1

val test14 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node1->Node0 + Node2->Node2
@cmd:{Acyclic[List1]}
}}
}
@Test Test14: run test14 for 3 expect 1

val test20 {
some disj List0, List1, List2: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1 + List2
header = List0->Node2 + List1->Node2 + List2->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0
@cmd:{Acyclic[List2]}
}}
}
@Test Test20: run test20 for 3 expect 1

val test3 {
some disj Node0: Node {
no List
no header
Node = Node0
no link
}
}
@Test Test3: run test3 for 3 expect 1

val test7 {

no List
no header
no Node
no link

}
@Test Test7: run test7 for 3 expect 1

val test21 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node1->Node1 + Node2->Node0
@cmd:{Acyclic[List0]}
}}
}
@Test Test21: run test21 for 3 expect 0

val test16 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List1->Node2
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
@cmd:{Acyclic[List1]}
}}
}
@Test Test16: run test16 for 3 expect 0

val test19 {
some disj List0: List {some disj Node0, Node1, Node2: Node {
List = List0
header = List0->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1
@cmd:{Acyclic[List0]}
}}
}
@Test Test19: run test19 for 3 expect 1

val test8 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node1 + List1->Node0
Node = Node0 + Node1 + Node2
link = Node2->Node0 + Node2->Node1 + Node2->Node2
}}
}
@Test Test8: run test8 for 3 expect 0

val test13 {
some disj List0, List1, List2: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1 + List2
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node2 + Node1->Node0 + Node2->Node2
@cmd:{Acyclic[List2]}
}}
}
@Test Test13: run test13 for 3 expect 1

val test10 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List0->Node2 + List1->Node1
Node = Node0 + Node1 + Node2
link = Node0->Node1 + Node0->Node2 + Node1->Node1 + Node2->Node0
}}
}
@Test Test10: run test10 for 3 expect 0

val test1 {
some disj List0, List1: List {some disj Node0: Node {
List = List0 + List1
header = List1->Node0
Node = Node0
link = Node0->Node0
}}
}
@Test Test1: run test1 for 3 expect 1

val test12 {
some disj List0, List1: List {some disj Node0, Node1, Node2: Node {
List = List0 + List1
header = List1->Node2
Node = Node0 + Node1 + Node2
link = Node1->Node1 + Node2->Node0
@cmd:{Acyclic[List1]}
}}
}
@Test Test12: run test12 for 3 expect 1
