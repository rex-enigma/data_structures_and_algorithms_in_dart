import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/traversable_binary_node.dart';
import 'dart:math' as math;

class AVLNode<T> extends TraversableBinaryNode<T> {
  AVLNode(this.value);
  @override
  T value;

  @override
  AVLNode<T>? leftChild;

  @override
  AVLNode<T>? rightChild;

  /// the downwards longest path from [this] node to a leaf node.
  int height = 0;

  int get balanceFactor => leftChildHeight - rightChildHeight;
  int get leftChildHeight => leftChild?.height ?? -1;
  int get rightChildHeight => rightChild?.height ?? -1;
}

class BinarySearchTree<T extends Comparable<dynamic>> {
  AVLNode<T>? root;

  /// inserting a value in an AVL tree. Duplicate values insertion will be discarded.
  // value always replaces a NULL reference (left or right) of an external node / leaf node in the tree.
  void insert(T value) {
    root = _insertAt(root, value);
  }

  AVLNode<T> _insertAt(AVLNode<T>? node, T value) {
    if (node == null) {
      return AVLNode(value);
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
      // return the AVLnode immediate if the value is a duplicate, preventing balanced method from running since the structure of the AVL tree
      // is not affected. The performance is improved since this will prevent from going through the extra steps of balancing which is not
      // necessary.
      return node;
    }
    // the balancing will be performed on each node when going up from recursion.
    final balancedNode = balanced(node);
    //when an AVLNode is inserted, the height of each AVLNode that has been visited by this function needs to be updated.
    balancedNode.height = 1 + math.max(balancedNode.leftChildHeight, balancedNode.rightChildHeight);

    return balancedNode;
  }

  AVLNode<T> leftRotate(AVLNode<T> node) {
    final pivot = node.rightChild!;
    node.rightChild = pivot.leftChild;
    pivot.leftChild = node;

    // recalculate the hight of the node since its position is changed.
    node.height = 1 + math.max(node.leftChildHeight, node.rightChildHeight);
    // recalculate the height of the pivot since its position is changed.
    pivot.height = 1 + math.max(pivot.leftChildHeight, pivot.rightChildHeight);

    return pivot;
  }

  AVLNode<T> rightRotate(AVLNode<T> node) {
    final pivot = node.leftChild!;
    node.leftChild = pivot.rightChild;
    pivot.rightChild = node;

    // recalculate the hight of the node since its position is changed.
    node.height = 1 + math.max(node.leftChildHeight, node.rightChildHeight);
    // recalculate the height of the pivot since its position is changed.
    pivot.height = 1 + math.max(pivot.leftChildHeight, pivot.rightChildHeight);

    return pivot;
  }

  AVLNode<T> rightLeftRotate(AVLNode<T> node) {
    if (node.rightChild == null) {
      return node;
    }

    node.rightChild = rightRotate(node.rightChild!);
    return leftRotate(node);
  }

  AVLNode<T> leftRightRotate(AVLNode<T> node) {
    if (node.leftChild == null) {
      return node;
    }

    node.leftChild = rightRotate(node.leftChild!);
    return rightRotate(node);
  }

  // inspects the balance factor of an AVLNode to determine which rotation to perform or not.
  AVLNode<T> balanced(AVLNode<T> node) {
    switch (node.balanceFactor) {
      case 2:
        final left = node.leftChild;
        if (left != null && left.balanceFactor == -1) {
          return leftRightRotate(node);
        }
        // else if left.balanceFactor == 1
        else {
          return leftRotate(node);
        }
      case -2:
        final right = node.rightChild;
        if (right != null && right.balanceFactor == 1) {
          return rightLeftRotate(node);
        }
        // else if right.balanceFactor == -1
        else {
          return leftRotate(node);
        }
      default:
        return node;
    }
  }

  /// checking if the given value exist in a AVL tree.
  bool contains(T value) {
    var current = root;

    while (current != null) {
      if (current.value == value) {
        return true;
      }
      // branch to the left side if value is less than current node's value.
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
        // branch to the right side if value is greater than current node's value(i would have used else only but i chose else if for readability purpose)
      } else if (value.compareTo(current.value) > 0) {
        current = current.rightChild;
      }
    }
    return false;
  }

  /// removing the given value from a AVL tree.
  void remove(T value) {
    root = _remove(root, value);
  }

  // does the removal computation on the node that need to be removed.
  AVLNode<T>? _remove(AVLNode<T>? node, T value) {
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

    // the balancing will be performed on each node when going up from recursion.
    final balancedNode = balanced(node);
    //when an AVLNode is removed, the height of each AVLNode that has been visited by this function needs to be updated.
    balancedNode.height = 1 + math.max(balancedNode.leftChildHeight, balancedNode.rightChildHeight);

    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<T> on AVLNode<T> {
  /// used to find the node with the smallest value in a subtree in a BST.
  // in this case we called it inorder successor (the node with the smallest value in the right subtree of a given node)
  AVLNode<T> get minimumNode => leftChild?.minimumNode ?? this;
}
