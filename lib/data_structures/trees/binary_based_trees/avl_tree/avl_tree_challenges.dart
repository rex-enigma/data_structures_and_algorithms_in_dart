import 'dart:math' as math;

// challenge 1: number of leaves
// How many leaf nodes are there in a "perfectly balanced tree" of height n?

// for a perfect balanced tree, the leaf node number doubles when the Perfectly balanced tree height increases by one
// eg height 1 -> 2 leaf nodes  i.e 2¹
//    height 2 -> 4 leaf nodes  i.e 2²
//    height 3 -> 8 leaf nodes  i.e 2³

// there for, to get the number of leaf node of a perfectly balanced tree, we can
// apply the following formula:  2ⁿ where n is the height of the perfectly balanced tree.

/// number of leaf nodes of a perfectly balanced AVL tree
int avlTreeLeafNodes(int perfectlyBalancedAVLTreeRootHeight) {
  int rootHeight = perfectlyBalancedAVLTreeRootHeight;
  return math.pow(2, rootHeight).toInt();
}

// book's solution for challenge 1
// int leafNodes(int height) {
// return math.pow(2, height).toInt();
// }

// challenge 2: number of nodes
// How many nodes are there in a "perfectly balanced tree" of height n?

// there is a arithmetic sequence pattern that can allow as to calculate the number of nodes in a perfectly balanced tree.
// height 1 -> 3 nodes
// height 2 -> 7 nodes
// height 3 -> 15 nodes
// height 4 -> 31 nodes

// 7-3 = 4, 15-7 = 8, 31-15 = 16 : 4,8,16

// to be able to get the number of nodes in a perfectly balanced tree we apply this
// formula: (2ⁿ+¹) - 1 , where n is the height of the perfectly balanced tree.
// eg Height 1: (2¹+¹) - 1 = 3 nodes
//    Height 2: (2²+¹) - 1 = 7 nodes
//    Height 3: (2³+¹) - 1 = 15 nodes

/// number of nodes of a perfectly balances AVL nodes.
int avlTreeNodes(int perfectlyBalancedAVLTreeRootHeight) {
  int rootHeight = perfectlyBalancedAVLTreeRootHeight;
  return math.pow(2, rootHeight + 1).toInt() - 1;
}

// book's solution for challenge 2
// int nodes(int height) {
//   return math.pow(2, height + 1).toInt() - 1;
// }
