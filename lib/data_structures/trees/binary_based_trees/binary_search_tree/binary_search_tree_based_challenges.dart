import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_tree/binary_tree.dart';

// challenge 1: Binary tree or binary search tree
// write a function that checks if a binary tree is a binary search tree.

// T extends Comparable<dynamic> is a constraint which ensure that T types are subType of Comparable. Making its possible
// for a node key to be compared to another node key, since the node key type will have the comparableTo method.

// in Simple words: for this function to be able to determine if a binary tree is a binary search tree, the binary nodes'
// keys need to be of a Type that is a subType of Comparable Type and hence the nodes' keys can be compared, since they will have
// the compareTo method.
bool isBinarySearchTree<T extends Comparable<dynamic>>(BinaryTree<T>? binaryTree) {
  return _isBinarySearchTree(binaryTree?.root);
}

bool _isBinarySearchTree<T extends Comparable<dynamic>>(BinaryNode<T>? node) {
  // first check node.leftChild is not null,
  if (node?.leftChild != null) {
    // if so, comparing node.leftChild.key to node.key and return false if node.leftChild.key is not less than node.key.
    if (!(node!.leftChild!.key.compareTo(node.key) < 0)) return false;
    // branch left
    _isBinarySearchTree(node.leftChild);
  }

  //first check node.rightChild is not null,
  if (node?.rightChild != null) {
    // if so, compare node.rightChild.key to node.key and return false if node.rightChild.key is not greater that node.key.
    if (!(node!.rightChild!.key.compareTo(node.key) > 0)) return false;
    // branch right
    _isBinarySearchTree(node.rightChild);
  }

  return true;
}

//book's solution for challenge 1
// extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
//   bool isBinarySearchTree() {
//     return _isBST(this, min: null, max: null);
//   }

//   bool _isBST(BinaryNode<E>? tree, {E? min, E? max}) {

//     if (tree == null) return true;

//     if (min != null && tree.key.compareTo(min) < 0) {
//       return false;
//     } else if (max != null && tree.key.compareTo(max) >= 0) {
//       return false;
//     }

//     return _isBST(tree.leftChild, min: min, max: tree.key) && _isBST(tree.rightChild, min: tree.key, max: max);
//   }
// }

// challenge 2: Equality
// Given two binary trees, how would you test if they are equal or not?

// if the binaryNode key T type its not a primitive type, am assuming that the == operator of that T type has been overridden to check for equality
// based on the field keys of that type.

// in simple long words: when node1.key and node2.key get checked for equality, and both the node key Types
// are the same(but not primitive types eg int, float, double String*), the == operator on that T type should
// be overridden to be able compare the node keys based on there field keys.

// binary trees are considered equal when both binary trees have the same structure and there nodes have the same key.
// this implementation can also work with binary search tree.
bool isBinaryTreesEqual<T>(BinaryTree<T>? binaryTree1, BinaryTree<T>? binaryTree2) {
  return _isBinaryTreesEqual(binaryTree1?.root, binaryTree2?.root);
}

bool _isBinaryTreesEqual<T>(BinaryNode<T>? node1, BinaryNode<T>? node2) {
  if (node1 == null && node2 == null) return true;

  if (node1?.key != node2?.key) {
    return false;
  } else {
    // break out of the recursion and return false if the expression evaluated to false, meaning
    // both node1 leftChild's key and node2 leftChild's key were not equal.
    if (!(_isBinaryTreesEqual(node1?.leftChild, node2?.leftChild))) {
      return false;
    }
    // break out of the recursion and return false if the expression evaluated to false, meaning
    // both node1 rightChild's key and node2 rightChild's key were not equal.
    if (!(_isBinaryTreesEqual(node1?.rightChild, node2?.rightChild))) {
      return false;
    }
  }
  return true;
}

// shorter version but harder to read.
// bool _isBinaryTreesEqual<T>(BinaryNode<T>? node1, BinaryNode<T>? node2) {
//   if (node1 == null && node2 == null) return true;
//   if (node1?.key != node2?.key || !(_isBinaryTreesEqual(node1?.leftChild, node2?.leftChild)) || !(_isBinaryTreesEqual(node1?.rightChild, node2?.rightChild))) {
//     return false;
//   }
//   return true;
// }

//book's solution for challenge 2
// bool treesEqual(BinarySearchTree first, BinarySearchTree second) {
//   return _isEqual(first.root, second.root);
// }

// bool _isEqual(BinaryNode? first, BinaryNode? second) {

//   if (first == null || second == null) {
//     return first == null && second == null;
//   }

//   return first.key == second.key && _isEqual(first.leftChild, second.leftChild) && _isEqual(first.rightChild, second.rightChild);
// }

// challenge 3: is its a subtree?
// create a method that checks if the main tree contains all the element of another tree.

// (checking if one binary search tree is a binary search subtree of another binary search tree)
// here were are not considering the subtree and the main tree structural arrangement, we are only concern with the main tree containing
// all the elements of another tree "the subtree is so".
bool containsBinarySearchSubTree(BinarySearchTree? mainBinarySearchTree, BinarySearchTree? binarySearchSubTree) {
  bool containsBinarySearchSubTree = true;
  if (mainBinarySearchTree?.root == null && binarySearchSubTree?.root == null) return containsBinarySearchSubTree;

  var binarySearchSubTreeNodes = [];
  binarySearchSubTree?.root?.traversePreOrder((node) => binarySearchSubTreeNodes.add(node.key));

  if (binarySearchSubTreeNodes.isEmpty) {
    return false;
  } else {
    for (var nodeValue in binarySearchSubTreeNodes) {
      if (mainBinarySearchTree == null || !(mainBinarySearchTree.contains(nodeValue))) {
        return false;
      }
    }
  }

  return containsBinarySearchSubTree;
}
