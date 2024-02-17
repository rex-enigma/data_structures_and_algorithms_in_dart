import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/bubble_sort/bubble_sort.dart';
import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/insertion_sort/insertion_sort.dart';
import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/selection_sort/selection_sort.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/map_based_graph_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/two-dimensional_list_based_graph_implementation.dart';
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

  // testing adjacencyList graph implementation
  final graphMapBased = AdjacencyList<String>();
  final singaporeA = graphMapBased.createVertex('Singapore');
  final tokyoA = graphMapBased.createVertex('Tokyo');
  final hongKongA = graphMapBased.createVertex('Hong Kong');
  final detroitA = graphMapBased.createVertex('Detroit');
  final sanFranciscoA = graphMapBased.createVertex('San Francisco');
  final washingtonDCA = graphMapBased.createVertex('Washington DC');
  final austinTexasA = graphMapBased.createVertex('Austin Texas');
  final seattleA = graphMapBased.createVertex('Seattle');
  graphMapBased.addEdge(singaporeA, hongKongA, weight: 300);
  graphMapBased.addEdge(singaporeA, tokyoA, weight: 500);
  graphMapBased.addEdge(hongKongA, tokyoA, weight: 250);
  graphMapBased.addEdge(tokyoA, detroitA, weight: 450);
  graphMapBased.addEdge(tokyoA, washingtonDCA, weight: 300);
  graphMapBased.addEdge(hongKongA, sanFranciscoA, weight: 600);
  graphMapBased.addEdge(detroitA, austinTexasA, weight: 50);
  graphMapBased.addEdge(austinTexasA, washingtonDCA, weight: 292);
  graphMapBased.addEdge(sanFranciscoA, washingtonDCA, weight: 337);
  graphMapBased.addEdge(washingtonDCA, seattleA, weight: 277);
  graphMapBased.addEdge(sanFranciscoA, seattleA, weight: 218);
  graphMapBased.addEdge(austinTexasA, sanFranciscoA, weight: 297);
  print(graphMapBased);

  print('\n');

  // testing adjacencyList graph implementation
  final graph2dBased = AdjacencyMatrix<String>();
  final singaporeB = graph2dBased.createVertex('Singapore');
  final tokyoB = graph2dBased.createVertex('Tokyo');
  final hongKongB = graph2dBased.createVertex('Hong Kong');
  final detroitB = graph2dBased.createVertex('Detroit');
  final sanFranciscoB = graph2dBased.createVertex('San Francisco');
  final washingtonDCB = graph2dBased.createVertex('Washington DC');
  final austinTexasB = graph2dBased.createVertex('Austin Texas');
  final seattleB = graph2dBased.createVertex('Seattle');
  graph2dBased.addEdge(singaporeB, hongKongB, weight: 300);
  graph2dBased.addEdge(singaporeB, tokyoB, weight: 500);
  graph2dBased.addEdge(hongKongB, tokyoB, weight: 250);
  graph2dBased.addEdge(tokyoB, detroitB, weight: 450);
  graph2dBased.addEdge(tokyoB, washingtonDCB, weight: 300);
  graph2dBased.addEdge(hongKongB, sanFranciscoB, weight: 600);
  graph2dBased.addEdge(detroitB, austinTexasB, weight: 50);
  graph2dBased.addEdge(austinTexasB, washingtonDCB, weight: 292);
  graph2dBased.addEdge(sanFranciscoB, washingtonDCB, weight: 337);
  graph2dBased.addEdge(washingtonDCB, seattleB, weight: 277);
  graph2dBased.addEdge(sanFranciscoB, seattleB, weight: 218);
  graph2dBased.addEdge(austinTexasB, sanFranciscoB, weight: 297);

  print(graph2dBased);
}
