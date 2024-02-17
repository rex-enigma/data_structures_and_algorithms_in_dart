import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/bubble_sort/bubble_sort.dart';
import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/insertion_sort/insertion_sort.dart';
import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/selection_sort/selection_sort.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/map_based_graph_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/avl_tree/avl_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/general_tree_based_challenges.dart';

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

  /*******************comparison_based sorting algorithm with O(n^2) time complexity****************/

  // testing bubble,insertion and selection sort
  final list1 = [9, 4, 10, 3];
  final list2 = [8, 5, 11, 3];
  final list3 = [7, 12, 2, 3];

  print('original list before bubble sort: $list1');
  bubbleSort(list1);
  print('bubble sorted: $list1');

  print('original list before selection sort: $list2');
  selectionSort(list2);
  print('selection sorted: $list2');

  print('original list before insertion sort: $list3');
  insertionSort(list3);
  print('insertion sorted: $list3');

  print('\n');

  /****************************graph***********************************/

  final graph = AdjacencyList<String>();
  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');
  graph.addEdge(singapore, hongKong, weight: 300);
  graph.addEdge(singapore, tokyo, weight: 500);
  graph.addEdge(hongKong, tokyo, weight: 250);
  graph.addEdge(tokyo, detroit, weight: 450);
  graph.addEdge(tokyo, washingtonDC, weight: 300);
  graph.addEdge(hongKong, sanFrancisco, weight: 600);
  graph.addEdge(detroit, austinTexas, weight: 50);
  graph.addEdge(austinTexas, washingtonDC, weight: 292);
  graph.addEdge(sanFrancisco, washingtonDC, weight: 337);
  graph.addEdge(washingtonDC, seattle, weight: 277);
  graph.addEdge(sanFrancisco, seattle, weight: 218);
  graph.addEdge(austinTexas, sanFrancisco, weight: 297);
  print(graph);
}
