import 'dart:ffi';

import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

class BinarySearchTree<T extends Comparable<dynamic>> {
  BinaryNode<T>? root;

  /// inserting a value in a binary search tree. Duplicate values insertion will be discarded
  void insert(T value) {
    root = _insertAt(root, value);
  }

  BinaryNode<T> _insertAt(BinaryNode<T>? node, T value) {
    if (node == null) {
      return BinaryNode(value);
    }
    // if value is less than node.value, -1 is returned, which is less than 0
    // indicating that the value need to be inserted on the left side.
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    }
    // if value is greater than node.value, 1 is returned which is greater than 0
    // indicating that the value need to be inserted on the right side.
    else if (value.compareTo(node.value) > 0) {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    // else if value is equal to node.value, just set node.value to value
    // preventing BST from having duplicate values.
    else {
      node.value = value;
    }

    return node;
  }

  /// checking if the given value exist in a binary search tree.
  bool contains(T value) {
    var current = root;

    while (current != null) {
      if (current.value == value) {
        return true;
      }
      // branch to the left side if value is less than current node's value.
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
        // branch to the right side if value is greater than current node's value;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  /// removing the given value from a binary search tree.
  void remove(T value) {
    root = _remove(root, value);
  }

  // does the removal computation on the node that need to be removed.
  BinaryNode<T>? _remove(BinaryNode<T>? node, T value) {
    if (node == null) return null;

    if (value == node.value) {
      // handles the case where the node to be removed is a leafNode.
      // if node is leaf you return null, thereby removing the current node.
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
      // handle the case where the node to be remove has only one child specifically the right child.
      // if the node has no left child, you return node.rightChild to reconnect the left subtree.
      if (node.leftChild == null) {
        return node.rightChild;
      }
      // handles the case where the node to be removed has only one child specifically the right child.
      // if the node has no right child, you return node.leftChild to reconnect the left subtree.
      if (node.rightChild == null) {
        return node.leftChild;
      }
      // in 2 lines below, handle the case where the node to be removed has both the left child and the right child.
      // 1.find the inorder successor(node with the smallest value which is the leftMost node of the right subtree) and set node.value to that inorder successor's node value.
      node.value = node.rightChild!.minimumNode.value;
      // 2.remove that inorder successor node and reconnect the subtree.
      // will also handle reconnection of the subtree in situation where the inorder successor had a right child.
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
      // i would have used else only but i chose else if for readability purpose.
    } else if (value.compareTo(node.value) > 0) {
      node.rightChild = _remove(node.rightChild, value);
    }
    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<T> on BinaryNode<T> {
  /// used to find the node with the smallest value in a subtree in a BST.
  // in this case we called it inorder successor (the node with the smallest value in the right subtree of a given node)
  BinaryNode<T> get minimumNode => leftChild?.minimumNode ?? this;
}
