import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/traversable_binary_node.dart';

class BinaryTree<T> {
  BinaryTree(this.root);
  BinaryNode<T>? root;
}

class BinaryNode<T> extends TraversableBinaryNode<T> {
  BinaryNode(this.key);

  @override
  T key;

  @override
  BinaryNode<T>? leftChild;

  @override
  BinaryNode<T>? rightChild;
}
