import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/traversable_binary_node.dart';

class BinarySearchNode<T> extends TraversableBinaryNode<T> {
  BinarySearchNode(this.key);
  @override
  T key;

  @override
  BinarySearchNode<T>? leftChild;

  @override
  BinarySearchNode<T>? rightChild;
}

class BinarySearchTree<T extends Comparable<dynamic>> {
  BinarySearchNode<T>? root;

  /// inserting a key in a binary search tree. Duplicate keys insertion will be discarded.
  // key always replaces a NULL reference (left or right) of an external node / leaf node in the tree.
  void insert(T key) {
    root = _insertAt(root, key);
  }

  BinarySearchNode<T> _insertAt(BinarySearchNode<T>? node, T key) {
    if (node == null) {
      return BinarySearchNode(key);
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
    // preventing BST from having duplicate keys.
    else {
      node.key = key;
    }

    return node;
  }

  /// checking if the given key exist in a binary search tree.
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

  /// removing the given key from a binary search tree.
  void remove(T key) {
    root = _remove(root, key);
  }

  // does the removal computation on the node that need to be removed.
  BinarySearchNode<T>? _remove(BinarySearchNode<T>? node, T key) {
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
      // handles the case where the node to be removed has only one child specifically the right child.
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
      // i would have used else only but i chose else if for readability purpose.
    } else if (key.compareTo(node.key) > 0) {
      node.rightChild = _remove(node.rightChild, key);
    }
    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<T> on BinarySearchNode<T> {
  /// used to find the node with the smallest key in a subtree in a BST.
  // in this case we called it inOrder successor (the node with the smallest key in the right subtree of a given node)
  BinarySearchNode<T> get minimumNode => leftChild?.minimumNode ?? this;
}
