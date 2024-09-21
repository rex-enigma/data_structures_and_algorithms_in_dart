import 'dart:math';

import 'package:dart_data_structure_and_algorithm/algorithms/searching_algorithms/binary_search/binary_search.dart';
import 'package:dart_data_structure_and_algorithm/algorithms/searching_algorithms/binary_search/binary_search_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/deque/deque_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/deque/singly_linked_list_based_deque_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/map_based_graph_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/breadth-first_search/breadth-first_search_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/depth-first_search/depth-first_search.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/depth-first_search/depth-first_search_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/heap_based_priority_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/double_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/ring_buffer_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/single_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/singly_linked_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/ring_buffer/list_based_ring_buffer_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/linked_list/singly_linked_list_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/stack/single_list_based_stack_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/stack/stack_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_tree/binary_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_tree/binary_tree_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/general_tree_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/list_based_heap_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/tire/string_trie_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/tire/trie_tree_challanges.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

/*********************STACK*********************/

  StackList stack = StackList<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  test('stack implementation', () {
    expect(stack.peek(), 4);
  });

  List list = ['q', 'w', 'e', 't', 'y'];
  StackList letters = StackList.fromIterable(list);
  test('returning the element at the top of the stack without removing it', () {
    expect(letters.peek(), 'y');
  });

  List ordered = ['one', 'two', 'three', 'four'];
  test('stacked based challenge 1: reverse a list', () {
    expect(reverseList(ordered), ['four', 'three', 'two', 'one']);
  });

  String unbalancedParenthesis = '(hello world';
  String balancedParenthesis = 'h((e))llo(world)()';
  test('stacked based challenge 2: check if parenthesis is balanced in a string', () {
    expect(isParenthesisBalanced(unbalancedParenthesis), false);
    expect(isParenthesisBalanced(balancedParenthesis), true);
  });

  /********************LINKED LIST*****************************/

  Node<int> node1 = Node(value: 1);
  Node<int> node2 = Node(value: 2);
  Node<int> node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;
  test('creating node with values', () {
    expect(node1.toString(), '1 -> 2 -> 3');
  });

  SinglyLinkedList<int> linkedListPush = SinglyLinkedList();
  linkedListPush.push(1);
  linkedListPush.push(2);
  linkedListPush.push(3);
  test('pushing values at the front of the linked list', () {
    expect(linkedListPush.toString(), '3 -> 2 -> 1');
  });

  SinglyLinkedList<int> linkedListAppend = SinglyLinkedList();
  linkedListAppend.append(1);
  linkedListAppend.append(2);
  linkedListAppend.append(3);
  test('appending values at the end of the linked list', () {
    expect(linkedListAppend.toString(), '1 -> 2 -> 3');
  });

  final linkedListInsertion = SinglyLinkedList<int>();
  linkedListInsertion.push(3);
  linkedListInsertion.push(2);
  linkedListInsertion.push(1);

  Node<int> middleNode = linkedListInsertion.nodeAt(1)!;
  linkedListInsertion.insertAfter(middleNode, 42);
  test('inserting a value after a particular node in the linked list', () {
    expect(linkedListInsertion.toString(), '1 -> 2 -> 42 -> 3');
  });

  final linkedListPop = SinglyLinkedList<int>();
  linkedListPop.push(3);
  linkedListPop.push(2);
  linkedListPop.push(1);

  int? poppedValue = linkedListPop.pop();
  test('popping a value at the front of the linked list', () {
    expect(linkedListPop.toString(), '2 -> 3');
    expect(poppedValue, 1);
  });

  final linkedListRemoveLast = SinglyLinkedList<int>();
  linkedListRemoveLast.push(3);
  linkedListRemoveLast.push(2);
  linkedListRemoveLast.push(1);

  final removedLastValue = linkedListRemoveLast.removeLast();
  test('removing a value at the end of the linked list', () {
    expect(linkedListRemoveLast.toString(), '1 -> 2');
    expect(removedLastValue, 3);
  });

  final linkedListAfterANode = SinglyLinkedList<int>();
  linkedListAfterANode.push(3);
  linkedListAfterANode.push(2);
  linkedListAfterANode.push(1);

  final secondNode = linkedListAfterANode.nodeAt(1);
  final removedValue = linkedListAfterANode.removeAfter(secondNode!);
  test('removing a value after a particular node in the linked list', () {
    expect(linkedListAfterANode.toString(), '1 -> 2');
    expect(removedValue, 3);
  });

  final iterableLinkedList = SinglyLinkedList<int>();
  iterableLinkedList.push(3);
  iterableLinkedList.push(2);
  iterableLinkedList.push(1);

  test('iterating through a linked list after making it iterable using for in loop', () {
    expect((() {
      final values = StringBuffer();
      for (var element in iterableLinkedList) {
        values.write(element);
      }
      return values.toString();
    })(), '123');
  });

  final linkedListMiddleValue = SinglyLinkedList<int>();
  linkedListMiddleValue.push(3);
  linkedListMiddleValue.push(2);
  linkedListMiddleValue.push(1);
  test("linkedList based challenge 2: return the middle value of a linked list", () {
    expect(linkedListMiddleValue.middleValue(), 2);
  });

  final linkedListReversed = SinglyLinkedList<int>();
  linkedListReversed.push(6);
  linkedListReversed.push(5);
  linkedListReversed.push(4);
  linkedListReversed.push(3);
  linkedListReversed.push(2);
  linkedListReversed.push(1);

  linkedListReversed.reverseSinglyLinkedListRecursively();
  test("linkedList based challenge 3: reversing a linked list", () {
    expect(linkedListReversed.toString(), '6 -> 5 -> 4 -> 3 -> 2 -> 1');
  });

  final linkedListRemoveOccurrencesOfAValue = SinglyLinkedList<int>();
  linkedListRemoveOccurrencesOfAValue.push(3);
  linkedListRemoveOccurrencesOfAValue.push(2);
  linkedListRemoveOccurrencesOfAValue.push(2);
  linkedListRemoveOccurrencesOfAValue.push(3);
  linkedListRemoveOccurrencesOfAValue.push(1);

  linkedListRemoveOccurrencesOfAValue.removeAll(3);
  test("linkedList based challenge 4: remove all occurrences of a particular value", () {
    expect(linkedListRemoveOccurrencesOfAValue.toString(), '1 -> 2 -> 2');
  });

/********************RING BUFFER*****************************/

  final ringBuffer = RingBufferList(5);
  ringBuffer.write(0);
  ringBuffer.write(0);
  ringBuffer.write(0);
  ringBuffer.write(1);
  ringBuffer.write(2);

  ringBuffer.read();
  ringBuffer.read();
  ringBuffer.read();

  ringBuffer.write(3);
  ringBuffer.write(4);
  test('check if toString in ringBuffer returns the correct available values that can only be read ', () {
    expect(ringBuffer.toString(), '[1, 2, 3, 4]');
  });

/********************QUEUE*****************************/

  final queueSingleLinkedList = QueueSinglyLinkedList();
  queueSingleLinkedList.enqueue('Ray');
  queueSingleLinkedList.enqueue('Brian');
  queueSingleLinkedList.enqueue('Eric');
  test('queue implementation based on singleLinkedList: test queue methods', () {
    expect(queueSingleLinkedList.toString(), 'Ray -> Brian -> Eric');
    expect(queueSingleLinkedList.dequeue(), 'Ray');
    expect(queueSingleLinkedList.peek(), 'Brian');
  });

  final queueRingBuffer = QueueRingBuffer<String>(10);
  queueRingBuffer.enqueue('Ray');
  queueRingBuffer.enqueue('Brian');
  queueRingBuffer.enqueue('Eric');
  test('queue implementation based on ringBuffer: test queue methods', () {
    expect(queueRingBuffer.toString(), '[Ray, Brian, Eric]');
    expect(queueRingBuffer.dequeue(), 'Ray');
    expect(queueRingBuffer.peek(), 'Brian');
  });

  final queueSingleList = QueueSingleList();
  queueSingleList.enqueue('Ray');
  queueSingleList.enqueue('Brian');
  queueSingleList.enqueue('Eric');
  test('queue implementation based on single list: test queue methods', () {
    expect(queueRingBuffer.toString(), '[Ray, Brian, Eric]');
    expect(queueRingBuffer.dequeue(), 'Ray');
    expect(queueRingBuffer.peek(), 'Brian');
  });

  final queueDoubleList = QueueDoubleList<String>();
  queueDoubleList.enqueue("Ray");
  queueDoubleList.enqueue("Brian");
  queueDoubleList.enqueue("Eric");
  test('queue implementation based on two lists: test queue methods', () {
    expect(queueDoubleList.toString(), '[Ray, Brian, Eric]');
    expect(queueDoubleList.dequeue(), 'Ray');
    expect(queueDoubleList.peek(), 'Brian');
  });

  final boardGameManager = QueueRingBuffer<dynamic>(3);
  boardGameManager.enqueue("Ray");
  boardGameManager.enqueue("Brian");
  boardGameManager.enqueue("Eric");
  test('queue based challenge 1: check if nextPlayer method can return the correct next player', () {
    expect(boardGameManager.nextPlayer(), "Ray");
    expect(boardGameManager.nextPlayer(), 'Brian');
    expect(boardGameManager.nextPlayer(), 'Eric');
    expect(boardGameManager.nextPlayer(), "Ray");
    expect(boardGameManager.nextPlayer(), 'Brian');
  });

/********************DEQUE*****************************/

  final dequeSinglyLinkedListFrontOperations = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListFrontOperations.enqueue(3, Direction.front);
  dequeSinglyLinkedListFrontOperations.enqueue(2, Direction.front);
  dequeSinglyLinkedListFrontOperations.enqueue(1, Direction.front);
  test('enqueues in the front and dequeues from the front', () {
    expect(dequeSinglyLinkedListFrontOperations.dequeue(Direction.front), 1);
    expect(dequeSinglyLinkedListFrontOperations.dequeue(Direction.front), 2);
    expect(dequeSinglyLinkedListFrontOperations.dequeue(Direction.front), 3);
  });

  final dequeSinglyLinkedListBackOperations = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListBackOperations.enqueue(1, Direction.back);
  dequeSinglyLinkedListBackOperations.enqueue(2, Direction.back);
  dequeSinglyLinkedListBackOperations.enqueue(3, Direction.back);
  test('enqueues in the back and dequeues from the back', () {
    expect(dequeSinglyLinkedListBackOperations.dequeue(Direction.back), 3);
    expect(dequeSinglyLinkedListBackOperations.dequeue(Direction.back), 2);
    expect(dequeSinglyLinkedListBackOperations.dequeue(Direction.back), 1);
  });

  final dequeSinglyLinkedListpeekOperation = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListpeekOperation.enqueue(1, Direction.front);
  dequeSinglyLinkedListpeekOperation.enqueue(2, Direction.back);
  dequeSinglyLinkedListpeekOperation.enqueue(3, Direction.front);
  test('peek() in the front and peek() in the back', () {
    expect(dequeSinglyLinkedListpeekOperation.peek(Direction.front), 3);
    expect(dequeSinglyLinkedListpeekOperation.peek(Direction.back), 2);
    expect(dequeSinglyLinkedListpeekOperation.toString(), '3 -> 1 -> 2');
  });

  /********************Trees*****************************/

  final h3Zero = BinaryNode(0);
  final h3One = BinaryNode(1);
  final h3Five = BinaryNode(5);
  final h3SevenRoot = BinaryNode(7);
  final h3Eight = BinaryNode(8);
  final h3Nine = BinaryNode(9);
  h3SevenRoot.leftChild = h3One;
  h3SevenRoot.rightChild = h3Nine;
  h3One.leftChild = h3Zero;
  h3One.rightChild = h3Five;
  h3Nine.leftChild = h3Eight;

  BinaryTree binaryTreeHeight3 = BinaryTree<int>(h3SevenRoot);

  final h5ZeroRoot = BinaryNode(0);
  final h5One = BinaryNode(1);
  final h5Two = BinaryNode(2);
  final h5Three = BinaryNode(3);
  final h5Four = BinaryNode(4);
  final h5Five = BinaryNode(5);
  final h5Six = BinaryNode(6);
  final h5Seven = BinaryNode(7);
  final h5Eight = BinaryNode(8);
  final h5Nine = BinaryNode(9);
  final h5Ten = BinaryNode(10);
  final h5Eleven = BinaryNode(11);
  h5ZeroRoot.leftChild = h5One;
  h5ZeroRoot.rightChild = h5Two;
  h5One.leftChild = h5Three;
  h5One.rightChild = h5Four;
  h5Two.leftChild = h5Five;
  h5Two.rightChild = h5Six;
  h5Four.leftChild = h5Seven;
  h5Four.rightChild = h5Eight;
  h5Six.leftChild = h5Nine;
  h5Eight.leftChild = h5Ten;
  h5Eight.rightChild = h5Eleven;

  BinaryTree binaryTreeHeight5 = BinaryTree<int>(h5ZeroRoot);

  test(" binary tree based challenge 1: calculating binary tree height", () {
    expect(binaryTreeHeight(binaryTreeHeight3), 3);
    expect(binaryTreeHeight(binaryTreeHeight5), 5);
    expect(binaryTreeHeight(BinaryTree(BinaryNode(20))), 0);
  });

  final serializeZeroRoot = BinaryNode(15);
  final serializeOne = BinaryNode(10);
  final serializeTwo = BinaryNode(25);
  final serializeThree = BinaryNode(5);
  final serializeFour = BinaryNode(12);
  final serializeFive = BinaryNode(17);
  serializeZeroRoot.leftChild = serializeOne;
  serializeZeroRoot.rightChild = serializeTwo;
  serializeOne.leftChild = serializeThree;
  serializeOne.rightChild = serializeFour;
  serializeTwo.leftChild = serializeFive;

  BinaryTree serializableBinaryTree = BinaryTree<int>(serializeZeroRoot);

  test("binary tree based challenge 2a: serialization of a binary tree", () {
    expect(serializeBinaryTreeToListRecursively(serializableBinaryTree).toString(), "[15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null]");
  });

  // this binary tree based list is from the above serialized Binary tree.
  final binaryTreeList = [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null];
  final deserializedBinaryTree = deserializeListToBinaryTree(binaryTreeList);
  test("binary tree based challenge 2b: deserialization of a binaryTree list", () {
    expect(deserializedBinaryTree?.root?.key, 15);
    expect(deserializedBinaryTree?.root?.leftChild?.key, 10);
    expect(deserializedBinaryTree?.root?.leftChild?.leftChild?.key, 5);
    expect(deserializedBinaryTree?.root?.leftChild?.leftChild?.leftChild, null);
    expect(deserializedBinaryTree?.root?.leftChild?.leftChild?.rightChild, null);
    expect(deserializedBinaryTree?.root?.leftChild?.rightChild?.key, 12);
    expect(deserializedBinaryTree?.root?.leftChild?.rightChild?.leftChild, null);
    expect(deserializedBinaryTree?.root?.leftChild?.rightChild?.rightChild, null);
    expect(deserializedBinaryTree?.root?.rightChild?.key, 25);
    expect(deserializedBinaryTree?.root?.rightChild?.leftChild?.key, 17);
    expect(deserializedBinaryTree?.root?.rightChild?.leftChild?.leftChild, null);
    expect(deserializedBinaryTree?.root?.rightChild?.leftChild?.rightChild, null);
    expect(deserializedBinaryTree?.root?.rightChild?.rightChild, null);
  });

  final binarySearchTreeUnbalanced1 = BinarySearchTree<int>();
  for (var i = 0; i < 5; i++) {
    // this insertion will create unbalanced tree
    binarySearchTreeUnbalanced1.insert(i);
  }

  test('inserting values in a binary search tree, creating unbalanced search tree', () {
    expect(binarySearchTreeUnbalanced1.root?.key, 0);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.key, 1);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.key, 2);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.rightChild?.key, 3);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.rightChild?.rightChild?.key, 4);
  });

  final binarySearchTreeBalanced1 = BinarySearchTree<int>();
  binarySearchTreeBalanced1.insert(3);
  binarySearchTreeBalanced1.insert(1);
  binarySearchTreeBalanced1.insert(4);
  binarySearchTreeBalanced1.insert(0);
  binarySearchTreeBalanced1.insert(2);
  binarySearchTreeBalanced1.insert(5);
  test('inserting values in a binary search tree, creating balanced search tree', () {
    expect(binarySearchTreeBalanced1.root?.key, 3);
    expect(binarySearchTreeBalanced1.root?.leftChild?.key, 1);
    expect(binarySearchTreeBalanced1.root?.leftChild?.leftChild?.key, 0);
    expect(binarySearchTreeBalanced1.root?.leftChild?.rightChild?.key, 2);
    expect(binarySearchTreeBalanced1.root?.rightChild?.key, 4);
    expect(binarySearchTreeBalanced1.root?.rightChild?.rightChild?.key, 5);
  });
  test('searching / finding a value in a binary search tree', () {
    expect(binarySearchTreeBalanced1.contains(2), true);
    expect(binarySearchTreeBalanced1.contains(10), false);
  });

  final notABinarySearchTreeRoot = BinaryNode(3);
  final notABinarySearchTreeOne = BinaryNode(1);
  final notABinarySearchTreeTwo = BinaryNode(0);
  final notABinarySearchTreeThree = BinaryNode(4);
  final notABinarySearchTreeFour = BinaryNode(2);
  final notABinarySearchTreeFive = BinaryNode(5);
  notABinarySearchTreeRoot.leftChild = notABinarySearchTreeOne;
  notABinarySearchTreeRoot.rightChild = notABinarySearchTreeFour;
  notABinarySearchTreeOne.leftChild = notABinarySearchTreeTwo;
  notABinarySearchTreeOne.rightChild = notABinarySearchTreeThree;
  notABinarySearchTreeFour.rightChild = notABinarySearchTreeFive;

  BinaryTree<int> notBinarySearchTree = BinaryTree<int>(notABinarySearchTreeRoot);

  final aBinaryTreeRoot = BinaryNode(3);
  final aBinaryTreeOne = BinaryNode(1);
  final aBinaryTreeTwo = BinaryNode(0);
  final aBinaryTreeThree = BinaryNode(4);
  final aBinaryTreeFour = BinaryNode(2);
  final aBinaryTreeFive = BinaryNode(5);
  aBinaryTreeRoot.leftChild = aBinaryTreeOne;
  aBinaryTreeRoot.rightChild = aBinaryTreeThree;
  aBinaryTreeOne.leftChild = aBinaryTreeTwo;
  aBinaryTreeOne.rightChild = aBinaryTreeFour;
  aBinaryTreeFour.rightChild = aBinaryTreeFive;

  // this binary tree is ordered where the left child is less than and the right child is greater than
  // the parent, making it to have the characteristics of a binary search tree.
  BinaryTree<int> orderedBinaryTree = BinaryTree<int>(aBinaryTreeRoot);

  test('binary search tree based challenge 1: check if a binary tree is a binary search tree', () {
    expect(isBinarySearchTree(orderedBinaryTree), true);
    expect(isBinarySearchTree(notBinarySearchTree), false);
  });

  final binaryTree1IdenticalRoot = BinaryNode(3);
  final binaryTree1IdenticalOne = BinaryNode(1);
  final binaryTree1IdenticalTwo = BinaryNode(4);
  binaryTree1IdenticalRoot.leftChild = binaryTree1IdenticalOne;
  binaryTree1IdenticalRoot.rightChild = binaryTree1IdenticalTwo;

  BinaryTree<int> binaryTree1Identical = BinaryTree<int>(binaryTree1IdenticalRoot);

  final binaryTree2IdenticalRoot = BinaryNode(3);
  final binaryTree2IdenticalOne = BinaryNode(1);
  final binaryTree2IdenticalTwo = BinaryNode(4);
  binaryTree2IdenticalRoot.leftChild = binaryTree2IdenticalOne;
  binaryTree2IdenticalRoot.rightChild = binaryTree2IdenticalTwo;

  BinaryTree<int> binaryTree2Identical = BinaryTree<int>(binaryTree2IdenticalRoot);

  final binaryTree3StructureNotIdenticalRoot = BinaryNode(3);
  final binaryTree3StructureNotIdenticalOne = BinaryNode(1);
  binaryTree3StructureNotIdenticalRoot.leftChild = binaryTree3StructureNotIdenticalOne;

  BinaryTree<int> binaryTree3StructureNotIdentical = BinaryTree<int>(binaryTree3StructureNotIdenticalRoot);

  final binaryTree4ValueNotIdenticalRoot = BinaryNode(3);
  final binaryTree4ValueNotIdenticalOne = BinaryNode(1);
  final binaryTree4ValueNotIdenticalTwo = BinaryNode(5);
  binaryTree4ValueNotIdenticalRoot.leftChild = binaryTree4ValueNotIdenticalOne;
  binaryTree4ValueNotIdenticalRoot.rightChild = binaryTree4ValueNotIdenticalTwo;

  BinaryTree<int> binaryTree4ValueNotIdentical = BinaryTree<int>(binaryTree4ValueNotIdenticalRoot);

// though i have written binary search tree and the isBinaryTreeEqual is based on binary tree, the method can also be used for binary search tree.
  test('binary search tree based challenge 2: check if two binary trees are equal, should be true because both binary trees have the same structure and value', () {
    expect(isBinaryTreesEqual(binaryTree1Identical, binaryTree2Identical), true);
  });
  test(
      'binary search tree based challenge 2: check if two binary trees are equal, should be false because though there structures are similar, they contain value(s) that are not equal',
      () {
    expect(isBinaryTreesEqual(binaryTree1Identical, binaryTree4ValueNotIdentical), false);
  });
  test('binary search tree based challenge 2: check if two binary trees are equal, should be false because there structures are not similar', () {
    expect(isBinaryTreesEqual(binaryTree1Identical, binaryTree3StructureNotIdentical), false);
  });

  final binarySearchSubTreeBalanced1 = BinarySearchTree<int>();
  binarySearchSubTreeBalanced1.insert(1);
  binarySearchSubTreeBalanced1.insert(0);
  binarySearchSubTreeBalanced1.insert(2);

  final binarySearchNotSubTreeBalanced1 = BinarySearchTree<int>();
  binarySearchNotSubTreeBalanced1.insert(1);
  binarySearchNotSubTreeBalanced1.insert(0);
  binarySearchNotSubTreeBalanced1.insert(6);

  test('binary search tree based challenge 3: checking if one binary search tree is a binary search subtree of another binary search tree) ', () {
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, binarySearchSubTreeBalanced1), true);
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, BinarySearchTree<int>()), false);
    expect(containsBinarySearchSubTree(BinarySearchTree<int>(), binarySearchTreeBalanced1), false);
    expect(containsBinarySearchSubTree(null, null), true);
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, null), false);
    expect(containsBinarySearchSubTree(null, binarySearchSubTreeBalanced1), false);
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, binarySearchNotSubTreeBalanced1), false);
  });

  final stringTrieTree = StringTire();
  stringTrieTree.insert('car');
  stringTrieTree.insert('card');
  stringTrieTree.insert('care');
  stringTrieTree.insert('cared');
  stringTrieTree.insert('cars');
  stringTrieTree.insert('carbs');
  stringTrieTree.insert('carapace');
  stringTrieTree.insert('cargo');
  stringTrieTree.insert('cut');
  stringTrieTree.insert('cute');
  test('insert a word in stringTrieTree', () {
    expect(stringTrieTree.contains('car'), true);
    expect(stringTrieTree.contains('cart'), false);
  });

  stringTrieTree.remove('cute');
  test('removing a word from stringTrieTree', () {
    expect(stringTrieTree.contains('cute'), false);
    expect(stringTrieTree.contains('cut'), true);
  });

  test("prefix matching, collection of words that start with 'car' ", () {
    expect(stringTrieTree.matchPrefix('car').toString(), "[car, card, care, cared, cars, carbs, carapace, cargo]");
  });

  test("prefix matching, collection of words that start with 'care' ", () {
    expect(stringTrieTree.matchPrefix('care').toString(), "[care, cared]");
  });
  test("prefix matching, collection of words that start with 'cu' ", () {
    expect(stringTrieTree.matchPrefix('cu').toString(), "[cut]");
  });
  test('return all words that exist in stringTrieTree', () {
    expect(stringTrieTree.allWords.toString(), "[car, card, care, cared, cars, carbs, carapace, cargo, cut]");
  });
  test('return the total number of words that exist in the stringTrieTree', () {
    expect(stringTrieTree.wordCount, 9);
  });

  final heapInsertion = HeapList<int>();
  heapInsertion.insert(8);
  heapInsertion.insert(6);
  heapInsertion.insert(5);
  heapInsertion.insert(4);
  heapInsertion.insert(3);
  heapInsertion.insert(2);
  heapInsertion.insert(1);
  test('inserting values in heapInsertion tree', () {
    expect(heapInsertion.toString(), '[8, 6, 5, 4, 3, 2, 1]');
  });

  heapInsertion.insert(7);
  test('insert a value in heapInsertion tree', () {
    expect(heapInsertion.toString(), '[8, 7, 5, 6, 3, 2, 1, 4]');
  });

  final maxHeapRemoval = HeapList<int>();
  maxHeapRemoval.insert(10);
  maxHeapRemoval.insert(8);
  maxHeapRemoval.insert(5);
  maxHeapRemoval.insert(4);
  maxHeapRemoval.insert(6);
  maxHeapRemoval.insert(2);
  maxHeapRemoval.insert(1);
  maxHeapRemoval.insert(3);
  test('remove a value from heapRemoval tree', () {
    expect(maxHeapRemoval.toString(), '[10, 8, 5, 4, 6, 2, 1, 3]');
    expect(maxHeapRemoval.remove(), 10);
    expect(maxHeapRemoval.toString(), '[8, 6, 5, 4, 3, 2, 1]');
  });

  final maxHeapRemoveAt = HeapList<int>();
  maxHeapRemoveAt.insert(10);
  maxHeapRemoveAt.insert(7); // remove this
  maxHeapRemoveAt.insert(2);
  maxHeapRemoveAt.insert(5);
  maxHeapRemoveAt.insert(1);
  test('remove a value at a given index from heapRemoveAt tree', () {
    expect(maxHeapRemoveAt.removeAt(1), 7);
    expect(maxHeapRemoveAt.toString(), '[10, 5, 2, 1]');
  });

  final maxHeapSearch = HeapList<int>();
  maxHeapSearch.insert(10);
  maxHeapSearch.insert(7);
  maxHeapSearch.insert(2);
  maxHeapSearch.insert(5);
  maxHeapSearch.insert(1);
  test('search if the given value exist in heapSearch tree, return index of the value if it exist otherwise return -1', () {
    expect(maxHeapRemoveAt.indexOf(7), 1);
  });

  test('convert an arbitrary list into a max heap tree', () {
    expect(HeapList<int>(elements: [1, 12, 3, 4, 1, 6, 8, 7]).toString(), '[12, 7, 8, 4, 1, 6, 3, 1]');
  });
  test('convert an arbitrary list into a min heap tree', () {
    expect(HeapList<int>(elements: [1, 12, 3, 4, 1, 6, 8, 7], priority: Priority.min).toString(), '[1, 1, 3, 4, 12, 6, 8, 7]');
  });

  test('heap challenge 1: find the 3th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(3, [3, 10, 18, 5, 21, 100]), 10);
  });
  test('heap challenge 1: find the 4th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(4, [3, 10, 18, 5, 21, 100]), 18);
  });
  test('heap challenge 1: find the 5th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(5, [3, 10, 18, 5, 21, 100]), 21);
  });
  test('heap challenge 1: find the 1th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(1, [3, 10, 18, 5, 21, 100]), 3);
  });

  test('heap challenge 4: check if the given list is a min heap', () {
    expect(isMinHeap([1, 1, 3, 4, 12, 6, 8, 7]), true);
    expect(isMinHeap([3, 10, 18, 5, 21, 100]), false);
  });

  final maxPriorityQueue = PriorityQueueHeap();
  maxPriorityQueue.enqueue(1);
  maxPriorityQueue.enqueue(12);
  maxPriorityQueue.enqueue(3);
  maxPriorityQueue.enqueue(4);
  maxPriorityQueue.enqueue(1);
  maxPriorityQueue.enqueue(6);
  maxPriorityQueue.enqueue(8);
  maxPriorityQueue.enqueue(7);
  test('enqueueing values out of order, expecting the values to be ordered based on max priority(larger values have higher priority)', () {
    expect(maxPriorityQueue.dequeue(), 12);
    expect(maxPriorityQueue.dequeue(), 8);
    expect(maxPriorityQueue.dequeue(), 7);
    expect(maxPriorityQueue.dequeue(), 6);
    expect(maxPriorityQueue.dequeue(), 4);
    expect(maxPriorityQueue.dequeue(), 3);
    expect(maxPriorityQueue.dequeue(), 1);
    expect(maxPriorityQueue.dequeue(), 1);
  });

  final ticketWaitList = TicketWaitList();
  ticketWaitList.addPersonToWaitList(Person(name: 'Mark', age: 21, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Amos', age: 23, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Josh', age: 27, isMilitary: true));
  ticketWaitList.addPersonToWaitList(Person(name: 'Einstein', age: 21, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Ben', age: 25, isMilitary: true));
  test('priority queue challenge 1: add persons in a ticket waitList, prioritizing first persons with military background follows by seniority(older)', () {
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Josh, age: 27, isMilitary: true}');
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Ben, age: 25, isMilitary: true}');
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Amos, age: 23, isMilitary: false}');
    // even though Mark was added before Einstein, Einstein will be the first to be removed before Mark, this is because
    // of the internal implementation of _firstHasHigherPriority method in heap class.
    // the order in which Mark and Einstein are added is not the same order in which they are be removed because
    // there age are the same.
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Einstein, age: 21, isMilitary: false}');
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Mark, age: 21, isMilitary: false}');
  });

  final maxPriorityQueueList1 = PriorityQueueList(unsortedList: [1, 12, 3, 4, 1, 6, 8, 7]);
  test('priority queue challenge 2: sort a list of unsortedList in max order where the last value is the greatest', () {
    expect(maxPriorityQueueList1.toString(), '[1, 1, 3, 4, 6, 7, 8, 12]');
  });

  final maxPriorityQueueList2 = PriorityQueueList<int>();
  maxPriorityQueueList2.enqueue(7);
  maxPriorityQueueList2.enqueue(4);
  maxPriorityQueueList2.enqueue(1);
  maxPriorityQueueList2.enqueue(7);
  maxPriorityQueueList2.enqueue(10);
  maxPriorityQueueList2.enqueue(5);
  test('priority queue challenge 2: testing priorityQueueList enqueue method', () {
    expect(maxPriorityQueueList2.toString(), '[1, 4, 5, 7, 7, 10]');
    expect(maxPriorityQueueList2.dequeue(), 10);
    expect(maxPriorityQueueList2.dequeue(), 7);
  });

  final minPriorityQueueList3 = PriorityQueueList<int>(unsortedList: [1, 12, 3, 4, 1, 6, 8, 7], priority: Priority.min);
  test('priority queue challenge 2: sort a list of unsortedList in min order where the last value is the smallest', () {
    expect(minPriorityQueueList3.toString(), '[12, 8, 7, 6, 4, 3, 1, 1]');
  });

  /*************************graph**************************************/

  final graphMapBased2 = AdjacencyList<String>();
  final a = graphMapBased2.createVertex('A');
  final b = graphMapBased2.createVertex('B');
  final c = graphMapBased2.createVertex('C');
  final d = graphMapBased2.createVertex('D');
  final e = graphMapBased2.createVertex('E');
  final f = graphMapBased2.createVertex('F');
  final g = graphMapBased2.createVertex('G');
  final h = graphMapBased2.createVertex('H');

  graphMapBased2.addEdge(a, b, weight: 1);
  graphMapBased2.addEdge(a, c, weight: 1);
  graphMapBased2.addEdge(a, d, weight: 1);
  graphMapBased2.addEdge(b, e, weight: 1);
  graphMapBased2.addEdge(c, f, weight: 1);
  graphMapBased2.addEdge(c, g, weight: 1);
  graphMapBased2.addEdge(e, h, weight: 1);
  graphMapBased2.addEdge(e, f, weight: 1);
  graphMapBased2.addEdge(f, g, weight: 1);
  final vertices = graphMapBased2.breadthFirstSearchRecursive(a);

  test('graph breadth-first search challenge 2: testing breadthFirstSearchRecursive method. Return all vertices in the order in which they were added', () {
    expect(vertices.map((vertex) => vertex.data).toList().toString(), '[A, B, C, D, E, F, G, H]');
  });

  final graphMapBased3 = AdjacencyList<String>();
  final A = graphMapBased3.createVertex('A');
  final B = graphMapBased3.createVertex('B');
  final C = graphMapBased3.createVertex('C');
  final D = graphMapBased3.createVertex('D');
  final E = graphMapBased3.createVertex('E');
  final F = graphMapBased3.createVertex('F');
  final G = graphMapBased3.createVertex('G');
  final H = graphMapBased3.createVertex('H');
  graphMapBased3.addEdge(A, B, weight: 1);
  graphMapBased3.addEdge(A, C, weight: 1);
  graphMapBased3.addEdge(A, D, weight: 1);
  // not adding an edge btn b-f,c-f and c-g from the graph makes the graph to be disconnected.
  /*  
  graphMapBased3.addEdge(B, E, weight: 1);
  graphMapBased3.addEdge(C, F, weight: 1);
  graphMapBased3.addEdge(C, G, weight: 1); 
  */
  graphMapBased3.addEdge(E, H, weight: 1);
  graphMapBased3.addEdge(E, F, weight: 1);
  graphMapBased3.addEdge(F, G, weight: 1);
  test('graph breadth-first search challenge 3: check if a graph is connected', () {
    expect(graphMapBased3.isConnected(), false);
  });

  final graphMapBased4 = AdjacencyList<String>();
  final aa = graphMapBased4.createVertex('A');
  final bb = graphMapBased4.createVertex('B');
  final cc = graphMapBased4.createVertex('C');
  final dd = graphMapBased4.createVertex('D');
  final ee = graphMapBased4.createVertex('E');
  final ff = graphMapBased4.createVertex('F');
  final gg = graphMapBased4.createVertex('G');
  final hh = graphMapBased4.createVertex('H');

  graphMapBased4.addEdge(aa, bb, weight: 1);
  graphMapBased4.addEdge(aa, cc, weight: 1);
  graphMapBased4.addEdge(aa, dd, weight: 1);
  graphMapBased4.addEdge(bb, ee, weight: 1);
  graphMapBased4.addEdge(cc, gg, weight: 1);
  graphMapBased4.addEdge(ee, ff, weight: 1);
  graphMapBased4.addEdge(ee, hh, weight: 1);
  graphMapBased4.addEdge(ff, gg, weight: 1);
  graphMapBased4.addEdge(ff, cc, weight: 1);
  test('graph depth-first search method test', () {
    expect(graphMapBased4.depthFirstSearch(aa).toString(), '[A, B, E, F, G, C, H, D]');
  });
  test('graph depth-first search challenge 2: testing depthFirstSearchRecursive method', () {
    expect(graphMapBased4.depthFirstRecursive(aa).toString(), '[A, B, E, F, G, C, H, D]');
  });

  /*************************BINARY SEARCH ALGORITHM**************************************/
  final orderedList = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  test("recursive binarySearch returns the index of a given / targeted element in the sorted list if it exit, else return -1 if it don't exit", () {
    expect(orderedList.indexOf(31), 7);
    expect(orderedList.binarySearch(31), 7);
    expect(orderedList.binarySearch(10), -1);
  });

  final freeFunctionBinarySearch31 = binarySearch(31, orderedList);
  test("recursive binarySearch returns the index of a given / targeted element in the sorted list if it exit, else return -1 if it don't exit", () {
    expect(freeFunctionBinarySearch31, 7);
    expect(binarySearch<int>(10, orderedList), -1);
  });

  final nonRecursiveBinarySearch24 = nonRecursiveBinarySearch(24, orderedList);
  test("non-recursive binarySearch returns the index of a given / targeted element in the sorted list if it exit, else return -1 if it don't exit", () {
    expect(nonRecursiveBinarySearch24, 6);
    expect(nonRecursiveBinarySearch<int>(15, orderedList), 2);
  });

  final orderedDuplicatedValueList = [1, 1, 2, 3, 3, 3, 4, 5, 5];
  test('binary search challenge 3: find the range of indices of a particular element', () {
    expect(findRange(value: 3, orderedList: orderedDuplicatedValueList), Range(3, 6));
    expect(findRange(value: 5, orderedList: orderedDuplicatedValueList), Range(7, 9));
    expect(findRange(value: 1, orderedList: orderedDuplicatedValueList), Range(0, 2));
    expect(findRange(value: 2, orderedList: orderedDuplicatedValueList), Range(2, 3));
    expect(findRange(value: 7, orderedList: orderedDuplicatedValueList), null);
  });
}
