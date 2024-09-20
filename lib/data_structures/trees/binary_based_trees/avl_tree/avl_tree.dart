import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/traversable_binary_node.dart';
import 'dart:math' as math;

class AVLNode<T> extends TraversableBinaryNode<T> {
  AVLNode(this.key);
  @override
  T key;

  @override
  AVLNode<T>? leftChild;

  @override
  AVLNode<T>? rightChild;

  /// the `number of edges` on the longest downward path from a given node to a leaf node.
  int height = 0;

  int get balanceFactor => leftChildHeight - rightChildHeight;
  int get leftChildHeight => leftChild?.height ?? -1;
  int get rightChildHeight => rightChild?.height ?? -1;
}

class AVLTree<T extends Comparable<dynamic>> {
  AVLNode<T>? root;

  /// inserts a key in an AVL tree. Duplicate keys inserted will be discarded.
  // key always replaces a NULL reference (left or right) of an external node / leaf node in the tree.
  void insert(T key) {
    root = _insertAt(root, key);
  }

  AVLNode<T> _insertAt(AVLNode<T>? node, T key) {
    if (node == null) {
      return AVLNode(key);
    }
    // if key is less than node.key, -1 is returned, which is less than 0
    // indicating that the key need to be inserted on the left side.
    if (key.compareTo(node.key) < 0) {
      node.leftChild = _insertAt(node.leftChild, key);
    }
    // if key is greater than node.key, 1 is returned which is greater than 0
    // indicating that the key need to be inserted on the right side.
    else if (key.compareTo(node.key) > 0) {
      node.rightChild = _insertAt(node.rightChild, key);
    }
    // else if key is equal to node.key, just set node.key to key
    // preventing AVL from having duplicate keys.
    else {
      node.key = key;
      // return the AVLnode immediate if the key is a duplicate, preventing balanced method from running since the structure of the AVL tree
      // is not affected. The performance is improved since this will prevent from going through the extra steps of balancing which is not
      // necessary.
      return node;
    }
    // balancing will be performed on each visited node when going up from recursion.
    final balancedNode = balanced(node);
    // the formula below is used to calculate the height of an AVLNode.
    // when an AVLNode is inserted, the height of each AVLNode that has been visited by this function gets updated.
    balancedNode.height = 1 + math.max(balancedNode.leftChildHeight, balancedNode.rightChildHeight);

    return balancedNode;
  }

  AVLNode<T> _leftRotate(AVLNode<T> node) {
    final pivot = node.rightChild!;
    node.rightChild = pivot.leftChild;
    pivot.leftChild = node;

    // recalculate the height of the node since its position is changed.
    node.height = 1 + math.max(node.leftChildHeight, node.rightChildHeight);
    // recalculate the height of the pivot since its position is changed.
    pivot.height = 1 + math.max(pivot.leftChildHeight, pivot.rightChildHeight);

    return pivot;
  }

  AVLNode<T> _rightRotate(AVLNode<T> node) {
    final pivot = node.leftChild!;
    node.leftChild = pivot.rightChild;
    pivot.rightChild = node;

    // recalculate the height of the node since its position has changed.
    node.height = 1 + math.max(node.leftChildHeight, node.rightChildHeight);
    // recalculate the height of the pivot since its position has changed.
    pivot.height = 1 + math.max(pivot.leftChildHeight, pivot.rightChildHeight);

    return pivot;
  }

  AVLNode<T> _rightLeftRotate(AVLNode<T> node) {
    if (node.rightChild == null) {
      return node;
    }

    node.rightChild = _rightRotate(node.rightChild!);
    return _leftRotate(node);
  }

  AVLNode<T> _leftRightRotate(AVLNode<T> node) {
    if (node.leftChild == null) {
      return node;
    }

    node.leftChild = _rightRotate(node.leftChild!);
    return _rightRotate(node);
  }

  /// inspects the balance factor of [node] to determine whether a rotation needs to be performed.
  AVLNode<T> balanced(AVLNode<T> node) {
    switch (node.balanceFactor) {
      case 2:
        final left = node.leftChild;
        if (left != null && left.balanceFactor == -1) {
          return _leftRightRotate(node);
        }
        // else if left.balanceFactor == 1
        else {
          return _leftRotate(node);
        }
      case -2:
        final right = node.rightChild;
        if (right != null && right.balanceFactor == 1) {
          return _rightLeftRotate(node);
        }
        // else if right.balanceFactor == -1
        else {
          return _leftRotate(node);
        }
      default:
        return node;
    }
  }

  /// checks if the given key exist in a AVL tree.
  bool contains(T key) {
    var current = root;

    while (current != null) {
      if (current.key == key) {
        return true;
      }
      // branch to the left side if key is less than current node's key.
      if (key.compareTo(current.key) < 0) {
        current = current.leftChild;
        // branch to the right side if key is greater than current node's key(i would have used else only but i chose else if for readability purpose)
      } else if (key.compareTo(current.key) > 0) {
        current = current.rightChild;
      }
    }
    return false;
  }

  /// removes the given key from the AVL tree.
  void remove(T key) {
    root = _remove(root, key);
  }

  // does the removal computation on the node that need to be removed.
  AVLNode<T>? _remove(AVLNode<T>? node, T key) {
    if (node == null) return null;

    if (key == node.key) {
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
      // handles the case where the node to be removed has only one child specifically the left child.
      // if the node has no right child, you return node.leftChild to reconnect the left subtree.
      if (node.rightChild == null) {
        return node.leftChild;
      }
      // in 2 lines below, handle the case where the node to be removed has both the left child and the right child.
      // 1.find the inOrder successor(node with the smallest key which is the leftMost node of the right subtree) and set node.key to that inOrder successor's node key.
      node.key = node.rightChild!.minimumNode.key;
      // 2.remove that inOrder successor node and reconnect the subtree.
      // will also handle reconnection of the subtree in situation where the inOrder successor had a right child.
      node.rightChild = _remove(node.rightChild, node.key);
    } else if (key.compareTo(node.key) < 0) {
      node.leftChild = _remove(node.leftChild, key);
      // i would have used else only but i choose else if for readability purpose.
    } else if (key.compareTo(node.key) > 0) {
      node.rightChild = _remove(node.rightChild, key);
    }

    // balancing will be performed on each visited node when going up from recursion.
    final balancedNode = balanced(node);
    // when an AVLNode is removed, the height of each AVLNode that has been visited by this function gets updated.
    balancedNode.height = 1 + math.max(balancedNode.leftChildHeight, balancedNode.rightChildHeight);

    return balancedNode;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<T> on AVLNode<T> {
  /// finds the node with the smallest key in a subtree in a BST.
  // in this case we called it inOrder successor (the node with the smallest key in the right subtree of a given node)
  AVLNode<T> get minimumNode => leftChild?.minimumNode ?? this;
}
