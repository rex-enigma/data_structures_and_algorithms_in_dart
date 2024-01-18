import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/avl_tree/avl_tree.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/trees/general_tree_challenges.dart';

void main(List<String> arguments) {
  /*******************general tree*********************/

  // printing a tree in level order
  printTreeInLevelOrder();

  // removing a value from a binary search tree.
  final binarySearchTreeBalanced1 = BinarySearchTree<int>();
  binarySearchTreeBalanced1.insert(3);
  binarySearchTreeBalanced1.insert(1);
  binarySearchTreeBalanced1.insert(4);
  binarySearchTreeBalanced1.insert(0);
  binarySearchTreeBalanced1.insert(2);
  binarySearchTreeBalanced1.insert(5);

  print('before removing value 3 from BST: \n $binarySearchTreeBalanced1');
  binarySearchTreeBalanced1.remove(3);
  print('After removing value 3 from BST: \n $binarySearchTreeBalanced1');

  // testing AVL tree balancing mechanism (insertion operation)
  final avlTreeInsert = AVLTree<int>();
  for (var i = 0; i < 15; i++) {
    avlTreeInsert.insert(i);
  }
  print(avlTreeInsert);

  // testing AVL tree balancing mechanism (remove operation)
  final avlTreeRemove = AVLTree<int>();
  avlTreeRemove.insert(15);
  avlTreeRemove.insert(10);
  avlTreeRemove.insert(16);
  avlTreeRemove.insert(18);
  print(avlTreeRemove);
  avlTreeRemove.remove(10);
  print(avlTreeRemove);
}
