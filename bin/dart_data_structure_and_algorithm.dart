import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart' as dart_data_structure_and_algorithm;
import 'package:dart_data_structure_and_algorithm/queue/ring_buffer_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/queue/singly_linked_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/ring_buffer/ring_buffer.dart';
import 'package:dart_data_structure_and_algorithm/linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/linked_list/singly_linked_list_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/queue/single_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';
import 'package:dart_data_structure_and_algorithm/trees/general_tree.dart';
import 'package:dart_data_structure_and_algorithm/trees/general_tree_challenges.dart';

void main(List<String> arguments) {
  /*******************general tree*********************/

  // printing a tree in level order
  printTreeInLevelOrder();

  // tree diagrammatic representation
  print(createBinaryTree());

  // DEPTH-TRAVERSAL TYPE ALGORITHMS
  final numberTree = createBinaryTree();

  //pre-order traversal
  numberTree.traversePreOrder(print);

  print('\n');

  // in-order traversal
  numberTree.traverseInOrder(print);

  print('\n');

  // post-order traversal
  numberTree.traversePostOrder(print);
}
