import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

// challenge 1: Binary tree or binary search tree
// write a function that checks if a binary tree is a binary search tree.

// T extends Comparable<dynamic> is a constraint which ensure that T types are subType of Comparable. Making its possible
// for a node value to be compared to another node value, since the node value type will have the comparableTo method.

// in Simple words: for this function to be able to determine if a binary tree is a binary search tree, the binary nodes'
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

// challenge 2: Equality
// Given two binary trees, how would you test if they are equal or not?

// if the binaryNode value T type its not a primitive type, am assuming that the == operator of that T type has been overridden to check for equality
// based on the field values of that type.

// in simple long words: when node1.value and node2.value get checked for equality, and both the node value Types
// are the same(but not primitive types eg int, float, double String*), the == operator on that T type should
// be overridden to be able compare the node values based on there field values.

// binary trees are considered equal when both binary trees have the same structure and there nodes have the same value.
bool isBinaryTreesEqual<T>(BinaryNode<T>? node1, BinaryNode<T>? node2) {
  if (node1 == null && node2 == null) return true;

  if (node1?.value != node2?.value) {
    return false;
  } else {
    // break out of the recursion and return false if the expression evaluated to false, meaning
    // both node1 leftChild's value and node2 leftChild's value were not equal.
    if (!(isBinaryTreesEqual(node1?.leftChild, node2?.leftChild))) {
      return false;
    }
    // break out of the recursion and return false if the expression evaluated to false, meaning
    // both node1 rightChild's value and node2 rightChild's value were not equal.
    if (!(isBinaryTreesEqual(node1?.rightChild, node2?.rightChild))) {
      return false;
    }
  }
  return true;
}
