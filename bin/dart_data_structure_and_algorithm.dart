import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart' as dart_data_structure_and_algorithm;
import 'package:dart_data_structure_and_algorithm/queue/singly_linked_list_based_queue_implementation.dart';
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

/*********returning the reference of the value at the top of the stack without removing it***************/
/* 
  List list = ['q', 'w', 'e', 't', 'y'];
  Stack letters = Stack.fromIterable(list);
  print(letters);
  print(letters.peek());
 */

/* 
  List ordered = ['one', 'two', 'three', 'four'];
  printReverseList(ordered);
 */

/***STACK BASED CHALLENGES*****/
/* 
  print(isParenthesisBalanced('h((e))llo(world)()'));
  print(isParenthesisBalanced('(hello world'));
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

/**************pushing a value at the front of the linked list**************/
/* 
  SinglyLinkedList<int> linkedList = SinglyLinkedList();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);
  print(linkedList);
 */

/**************appending a value at the end of the linked list**************/

/* 
  SinglyLinkedList<int> linkedList = SinglyLinkedList();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  print(linkedList);
 */

/**************inserting a value after a particular node in the linked list**************/
/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  Node<int> middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);

  print('After: $list');
*/

/******************popping a value at the front of the linked list**********************/

/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print("Before: $list");

  int? poppedValue = list.pop();

  print("After: $list");
  print("poppedValue: $poppedValue");
*/

/******************remove a value at the end of the linked list**********************/

/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print("Before: $list");

  final removedLastValue = list.removeLast();

  print("After: $list");
  print("Removed Last value: $removedLastValue");
 */

/******************remove a value after a particular node in the linked list**********************/

/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  final firstNode = list.nodeAt(1);
  final removedValue = list.removeAfter(firstNode!);

  print('After: $list');
  print('Removed value: $removedValue');
 */

/*****************iterating through a linked list after making it iterable**********************/

/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  for (var element in list) {
    print(element);
  }
*/

/***LINKED LIST BASE CHALLENGES*****/

/******print linked list in reverse********/
/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print("Before:\n $list");
  print("After:");
  printReversedSinglyLinkedList(list);
*/

/******print the middle value of a linked list********/
/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print(list);
  printMiddleNodeValue(list);

  //book's solution
  final middleNode = getMiddleNode(list);
  print("Middle value: ${middleNode?.value}");
 */

/******reversing a linked list********/
/* 
  final list = SinglyLinkedList<int>();
  list.push(6);
  list.push(5);
  list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);

// recursive method (traverse from the head to tail, then move backwards changing the pointer's direction)


  print("Before: \n $list");
  reverseSinglyLinkedListRecursively(list);
  print("After: \n $list"); 


// book's solution
// adding a reverse method through extension

  print("Original list: $list");
  list.reverse();
  print("Reversed list: $list");
*/

/********remove all occurrences**********/
/* 
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(2);
  list.push(3);
  list.push(1);

  print("Original list: \n $list");
  list.removeAll(3);
  print('list after removing all occurrences of 3: \n $list');
  print("head: ${list.head} \n tail: ${list.tail}");

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

  final queue = QueueSinglyLinkedList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek();
  print(queue);
}
