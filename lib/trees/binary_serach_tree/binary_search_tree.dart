import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

class BinarySearchTree<T extends Comparable<dynamic>> {
  BinaryNode<T>? root;

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
    // else if value is equal to node.value, just set node.value to value.
    // preventing from having duplicate values
    else {
      node.value = value;
    }

    return node;
  }

  // bool contains(T value) {}

  @override
  String toString() => root.toString();
}
