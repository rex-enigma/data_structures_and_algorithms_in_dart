import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart' as dart_data_structure_and_algorithm;
import 'package:dart_data_structure_and_algorithm/queue/ring_buffer_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/queue/singly_linked_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/ring_buffer/ring_buffer.dart';
import 'package:dart_data_structure_and_algorithm/singly_linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/singly_linked_list/singly_linked_list_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/queue/list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack_based_challenges.dart';

void main(List<String> arguments) {
  // print('Hello world: ${dart_data_structure_and_algorithm.calculate()}!');

/*********************STACK*********************/

/*********return and remove (popping) a value at the top of the stack***************/
/* 
  Stack stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack);

  final element = stack.pop();
  print('popped: $element');
  print(stack);
  print(stack.peek());
 */

/*********returning the element at the top of the stack without removing it***************/
/* 
  List list = ['q', 'w', 'e', 't', 'y'];
  Stack letters = Stack.fromIterable(list);
  print(letters);
  print(letters.peek());
 */

/***STACK BASED CHALLENGES*****/

/****** ********/
/* 
  print(isParenthesisBalanced('h((e))llo(world)()'));
  print(isParenthesisBalanced('(hello world'));
*/

/******print list in reverse(using stack to implement the functionality)********/
/* 
  List ordered = ['one', 'two', 'three', 'four'];
  printReverseList(ordered);

*/

/********************LINKED LIST*****************************/

/**************creating node with values**************/
/* 
  Node<int> node1 = Node(value: 1);
  Node<int> node2 = Node(value: 2);
  Node<int> node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;
  print(node1);
 */

/**************pushing values at the front of the linked list**************/
/* 
  SinglyLinkedList<int> linkedList = SinglyLinkedList();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);
  print(linkedList);
*/

/**************appending values at the end of the linked list**************/

/* 
  SinglyLinkedList<int> linkedList = SinglyLinkedList();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  print(linkedList);
 */

/**************inserting a value after a particular node in the linked list**************/
/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  print('Before: $linkedList');

  Node<int> middleNode = linkedList.nodeAt(1)!;
  linkedList.insertAfter(middleNode, 42);

  print('After: $linkedList');
*/

/******************popping a value at the front of the linked list**********************/

/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  print("Before: $linkedList");

  int? poppedValue = linkedList.pop();

  print("After: $linkedList");
  print("poppedValue: $poppedValue");
*/

/******************removing a value at the end of the linked list**********************/

/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  print("Before: $linkedList");

  final removedLastValue = linkedList.removeLast();

  print("After: $linkedList");
  print("Removed Last value: $removedLastValue");
 */

/******************removing a value after a particular node in the linked list**********************/

/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  print('Before: $linkedList');

  final secondNode = linkedList.nodeAt(1);
  final removedValue = linkedList.removeAfter(secondNode!);

  print('After: $linkedList');
  print('Removed value: $removedValue');
 */

/*****************iterating through a linked list after making it iterable using for in loop**********************/

/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  for (var element in linkedList) {
    print(element);
  }
*/

/***LINKED LIST BASE CHALLENGES*****/

/******print linked list in reverse********/
/* 
  final linkedListRecursivePrint = SinglyLinkedList<int>();
  linkedListRecursivePrint.push(3);
  linkedListRecursivePrint.push(2);
  linkedListRecursivePrint.push(1);

  print("Before:\n $linkedListRecursivePrint");
  print("After:");
  printReversedSinglyLinkedList(linkedListRecursivePrint);
*/

/******return the middle value of a linked list********/
/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  print(linkedList);
  final middleNodeValue = linkedList.middleValue();
  print(middleNodeValue);

  //book's solution
/*
  final middleNode = getMiddleNode(linkedList);
  print("Middle value: ${middleNode?.value}");
*/
 */

/******reversing a linked list********/
/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(6);
  linkedList.push(5);
  linkedList.push(4);
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

// recursive method (traverse from the head to tail, then move backwards changing the pointer's direction)

  print("Before: \n $linkedList");
  linkedList.reverseSinglyLinkedListRecursively();
  print("After: \n $linkedList");

// book's solution
// adding a reverse method through extension

/*   print("Original linkedList: $linkedList");
  linkedList.reverse();
  print("Reversed linkedList: $linkedList"); 
*/
*/

/********remove all occurrences of a particular value**********/
/* 
  final linkedList = SinglyLinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(2);
  linkedList.push(3);
  linkedList.push(1);

  print("Original linkedList: \n $linkedList");
  linkedList.removeAll(3);
  print('linkedList after removing all occurrences of 3: \n $linkedList');
  print("head: ${linkedList.head} \n tail: ${linkedList.tail}");

 */

/********************LIST BASED QUEUE IMPLEMENTATION*****************************/

/*************creating a queueList and testing its local methods**********/
/* 
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek();
  print(queue);
*/

/*************creating a queueLinkedList and testing its local methods**********/
/* 
  final queue = QueueSinglyLinkedList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek();
  print(queue);
*/

/********************RING BUFFER*****************************/

/*************creating a ringBuffer and testing its local methods**********/
/* 
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

  print(ringBuffer);
*/

/*******I wrote all the test(including whatever i have written above) in the test file*****/
}
