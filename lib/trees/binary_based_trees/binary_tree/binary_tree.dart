import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/traversable_binary_node.dart';

class BinaryTree<T> {
  BinaryTree(this.root);
  BinaryNode<T>? root;
}

class BinaryNode<T> extends TraversableBinaryNode<T> {
  BinaryNode(this.value);

  @override
  T value;

  @override
  BinaryNode<T>? leftChild;

  @override
  BinaryNode<T>? rightChild;
}
