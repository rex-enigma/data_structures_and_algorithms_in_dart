import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

class BinarySearchTree<T extends Comparable<dynamic>> {
  BinaryNode<T>? root;

  @override
  String toString() => root.toString();
}
