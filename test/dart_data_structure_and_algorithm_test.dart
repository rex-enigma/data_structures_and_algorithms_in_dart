import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart';
import 'package:dart_data_structure_and_algorithm/deque/deque.dart';
import 'package:dart_data_structure_and_algorithm/deque/single_linked_list_based_deque_implementation.dart';
import 'package:dart_data_structure_and_algorithm/queue/double_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/queue/queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/queue/ring_buffer_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/queue/single_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/queue/singly_linked_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/ring_buffer/ring_buffer.dart';
import 'package:dart_data_structure_and_algorithm/linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/linked_list/singly_linked_list_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/stack/single_list_based_stack_implementation.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/binary_search_tree/binary_search_tree_challenges.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/binary_tree/binary_tree.dart';
import 'package:dart_data_structure_and_algorithm/trees/binary_based_trees/binary_tree/binary_tree_challenges.dart';
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

  final ringBuffer = RingBuffer(5);
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

  final dequeSinglyLinkedListPeekOperation = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListPeekOperation.enqueue(1, Direction.front);
  dequeSinglyLinkedListPeekOperation.enqueue(2, Direction.back);
  dequeSinglyLinkedListPeekOperation.enqueue(3, Direction.front);
  test('peek in the front and peek in the back', () {
    expect(dequeSinglyLinkedListPeekOperation.peek(Direction.front), 3);
    expect(dequeSinglyLinkedListPeekOperation.peek(Direction.back), 2);
    expect(dequeSinglyLinkedListPeekOperation.toString(), '3 -> 1 -> 2');
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
    expect(treeHeight(binaryTreeHeight3), 3);
    expect(treeHeight(binaryTreeHeight5), 5);
    expect(treeHeight(BinaryTree(BinaryNode(20))), 0);
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

  test("binary tree based challenge 2a: serialization of a binary tree", () {
    expect(serializeBinaryTreeToListRecursively(serializeZeroRoot).toString(), "[15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null]");
  });

  // this binary tree based list is from the above serialized Binary tree.
  final binaryTreeList = [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null];
  final deserializedBinaryTreeRoot = deserializeListToBinaryTree(binaryTreeList);
  test("binary tree based challenge 2b: deserialization of a binaryTree list", () {
    expect(deserializedBinaryTreeRoot?.value, 15);
    expect(deserializedBinaryTreeRoot?.leftChild?.value, 10);
    expect(deserializedBinaryTreeRoot?.leftChild?.leftChild?.value, 5);
    expect(deserializedBinaryTreeRoot?.leftChild?.leftChild?.leftChild, null);
    expect(deserializedBinaryTreeRoot?.leftChild?.leftChild?.rightChild, null);
    expect(deserializedBinaryTreeRoot?.leftChild?.rightChild?.value, 12);
    expect(deserializedBinaryTreeRoot?.leftChild?.rightChild?.leftChild, null);
    expect(deserializedBinaryTreeRoot?.leftChild?.rightChild?.rightChild, null);
    expect(deserializedBinaryTreeRoot?.rightChild?.value, 25);
    expect(deserializedBinaryTreeRoot?.rightChild?.leftChild?.value, 17);
    expect(deserializedBinaryTreeRoot?.rightChild?.leftChild?.leftChild, null);
    expect(deserializedBinaryTreeRoot?.rightChild?.leftChild?.rightChild, null);
    expect(deserializedBinaryTreeRoot?.rightChild?.rightChild, null);
  });

  final binarySearchTreeUnbalanced1 = BinarySearchTree<int>();
  for (var i = 0; i < 5; i++) {
    // this insertion will create unbalanced tree
    binarySearchTreeUnbalanced1.insert(i);
  }

  test('inserting values in a binary search tree, creating unbalanced search tree', () {
    expect(binarySearchTreeUnbalanced1.root?.value, 0);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.value, 1);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.value, 2);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.rightChild?.value, 3);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.rightChild?.rightChild?.value, 4);
  });

  final binarySearchTreeBalanced1 = BinarySearchTree<int>();
  binarySearchTreeBalanced1.insert(3);
  binarySearchTreeBalanced1.insert(1);
  binarySearchTreeBalanced1.insert(4);
  binarySearchTreeBalanced1.insert(0);
  binarySearchTreeBalanced1.insert(2);
  binarySearchTreeBalanced1.insert(5);
  test('inserting values in a binary search tree, creating balanced search tree', () {
    expect(binarySearchTreeBalanced1.root?.value, 3);
    expect(binarySearchTreeBalanced1.root?.leftChild?.value, 1);
    expect(binarySearchTreeBalanced1.root?.leftChild?.leftChild?.value, 0);
    expect(binarySearchTreeBalanced1.root?.leftChild?.rightChild?.value, 2);
    expect(binarySearchTreeBalanced1.root?.rightChild?.value, 4);
    expect(binarySearchTreeBalanced1.root?.rightChild?.rightChild?.value, 5);
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

  test('binary search tree based challenge 1: check if a binary tree is a binary search tree', () {
    expect(isBinarySearchTree(binarySearchTreeBalanced1.root), true);
    expect(isBinarySearchTree(notABinarySearchTreeRoot), false);
  });

  final binaryTree1IdenticalRoot = BinaryNode(3);
  final binaryTree1IdenticalOne = BinaryNode(1);
  final binaryTree1IdenticalTwo = BinaryNode(4);
  binaryTree1IdenticalRoot.leftChild = binaryTree1IdenticalOne;
  binaryTree1IdenticalRoot.rightChild = binaryTree1IdenticalTwo;

  final binaryTree2IdenticalRoot = BinaryNode(3);
  final binaryTree2IdenticalOne = BinaryNode(1);
  final binaryTree2IdenticalTwo = BinaryNode(4);
  binaryTree2IdenticalRoot.leftChild = binaryTree2IdenticalOne;
  binaryTree2IdenticalRoot.rightChild = binaryTree2IdenticalTwo;

  final binaryTree3StructureNotIdenticalRoot = BinaryNode(3);
  final binaryTree3StructureNotIdenticalOne = BinaryNode(1);
  binaryTree3StructureNotIdenticalRoot.leftChild = binaryTree3StructureNotIdenticalOne;

  final binaryTree4ValueNotIdenticalRoot = BinaryNode(3);
  final binaryTree4ValueNotIdenticalOne = BinaryNode(1);
  final binaryTree4ValueNotIdenticalTwo = BinaryNode(5);
  binaryTree4ValueNotIdenticalRoot.leftChild = binaryTree4ValueNotIdenticalOne;
  binaryTree4ValueNotIdenticalRoot.rightChild = binaryTree4ValueNotIdenticalTwo;

// though have written binary search tree and the isBinaryTreeEqual is based on binary tree, the method can also be used for binary search tree.
  test('binary search tree based challenge 2: check if two binary trees are equal, should be true because both binary trees have the same structure and value', () {
    expect(isBinaryTreesEqual(binaryTree1IdenticalRoot, binaryTree2IdenticalRoot), true);
  });
  test(
      'binary search tree based challenge 2: check if two binary trees are equal, should be false because though there structures are similar, they contain value(s) that are not equal',
      () {
    expect(isBinaryTreesEqual(binaryTree1IdenticalRoot, binaryTree4ValueNotIdenticalRoot), false);
  });
  test('binary search tree based challenge 2: check if two binary trees are equal, should be false because there structures are not similar', () {
    expect(isBinaryTreesEqual(binaryTree1IdenticalRoot, binaryTree3StructureNotIdenticalRoot), false);
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
}
