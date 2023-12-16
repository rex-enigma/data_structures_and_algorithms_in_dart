import 'package:dart_data_structure_and_algorithm/linked_list/linked_list.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';

// challenge 1: print in reverse
// create a function that prints the nodes of a linked list in reverse order

// void printReversedLinkedList() {
//   final linkedList = LinkedList<int>();
//   linkedList.push(3);
//   linkedList.push(2);
//   linkedList.push(1);

//   for (var element in linkedList.toList().reversed) {
//     print(element);
//   }
// }

// void printReversedLinkedList() {
//   final linkedList = LinkedList<int>();
//   linkedList.push(3);
//   linkedList.push(2);
//   linkedList.push(1);

//   Stack stack = Stack<int>();

//   for (var element in linkedList) {
//     stack.push(element);
//   }

//   while (stack.isNotEmpty) {
//     print(stack.pop());
//   }
// }

LinkedList? linkedList;
Node? currentNode;

void printReversedLinkedList<E>(LinkedList<E> list) {
  linkedList = list;
  currentNode = linkedList!.head;
  printReveredLinkedListRecursively<E>();
}

void printReveredLinkedListRecursively<E>() {
  E value = currentNode!.value;
  if (currentNode != linkedList!.tail) {
    currentNode = currentNode!.next;
    printReveredLinkedListRecursively();
  }
  print(value);
}
