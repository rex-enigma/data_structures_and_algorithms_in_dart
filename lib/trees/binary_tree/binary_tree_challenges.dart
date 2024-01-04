import 'package:dart_data_structure_and_algorithm/stack/single_list_based_stack_implementation.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

// challenge 1: height of the tree
// given a binary tree find the height of the tree. The height of a binary tree is determined by the distance
// between the root and the furthest leaf. The height of a binary tree with a single node is zero since
// the single node is both the root and the furthest leaf.

int treeHeight(BinaryNode root) {
  if (root.leftChild == null && root.rightChild == null) return 0;

  int treeHeight = 0;
  int counter = 0;

  root.traversePreOrder((node) {
    if (node.leftChild == null && node.rightChild == null) {
      counter++;
      treeHeight = counter > treeHeight ? counter : treeHeight;
      counter--;
    } else {
      counter++;
    }

    if (node == root.rightChild) {
      counter = 2;
    } else {}
  });

  return treeHeight;
}
