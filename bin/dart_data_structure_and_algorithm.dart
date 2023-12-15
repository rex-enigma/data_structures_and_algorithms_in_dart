import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart' as dart_data_structure_and_algorithm;
import 'package:dart_data_structure_and_algorithm/linked_list/linked_list.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack_based_challenges.dart';

void main(List<String> arguments) {
  // print('Hello world: ${dart_data_structure_and_algorithm.calculate()}!');

/*************stack*********************/
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

/* 
  print(isParenthesisBalanced('h((e))llo(world)()'));
  print(isParenthesisBalanced('(hello world'));
 */

/********************linkedList*****************************/

/* 
  Node<int> node1 = Node(value: 1);
  Node<int> node2 = Node(value: 2);
  Node<int> node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;
  print(node1);
 */

/* 
  LinkedList<int> linkedList = LinkedList();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);
  print(linkedList);
 */

/* 
  LinkedList<int> linkedList = LinkedList();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  print(linkedList);
   */

/* 
  final list = LinkedList<int>();
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
  final list = LinkedList<int>();
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
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print("Before: $list");

  final removedLastValue = list.removeLast();

  print("After: $list");
  print("Removed Last value: $removedLastValue");
 */

/******************remove a value after a particular node in the linked list**********************/
}
