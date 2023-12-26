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
}
