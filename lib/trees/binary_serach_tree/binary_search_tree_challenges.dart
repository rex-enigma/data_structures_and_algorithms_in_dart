import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

// challenge 1: Binary tree or binary search tree
// write a function that checks if a binary tree is a binary search tree.

// T extends Comparable<dynamic> is a constraint which ensure that T types are subType of Comparable. Making its possible
// for a node value to be compared to another node value, since the node value type will have the comparableTo method.

// in Simple language: for this function to be able to determine if a binary tree is a binary search tree, the binary nodes'
// values need to be of a Type that is a subType of Comparable Type and hence the nodes' values can be compared, since they will have
// the compareTo method.
bool isBinarySearchTree<T extends Comparable<dynamic>>(BinaryNode<T>? node) {
  // first check node.leftChild is not null,
  if (node?.leftChild != null) {
    // if so, comparing node.leftChild.value to node.value and return false if node.leftChild.value is not less than node.value.
    if (!(node!.leftChild!.value.compareTo(node.value) < 0)) return false;
    // branch left
    isBinarySearchTree(node.leftChild);
  }

  //first check node.rightChild is not null,
  if (node?.rightChild != null) {
    // if so, compare node.rightChild.value to node.value and return false if node.rightChild.value is not greater that node.value.
    if (!(node!.rightChild!.value.compareTo(node.value) > 0)) return false;
    // branch right
    isBinarySearchTree(node.rightChild);
  }

  return true;
}

//book's solution for challenge 1
// extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
//   bool isBinarySearchTree() {
//     return _isBST(this, min: null, max: null);
//   }

//   bool _isBST(BinaryNode<E>? tree, {E? min, E? max}) {
//     // 1
//     if (tree == null) return true;
//     // 2
//     if (min != null && tree.value.compareTo(min) < 0) {
//       return false;
//     } else if (max != null && tree.value.compareTo(max) >= 0) {
//       return false;
//     }
//     // 3
//     return _isBST(tree.leftChild, min: min, max: tree.value) && _isBST(tree.rightChild, min: tree.value, max: max);
//   }
// }
