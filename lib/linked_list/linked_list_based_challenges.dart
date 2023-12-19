import 'dart:io';

import 'package:dart_data_structure_and_algorithm/linked_list/linked_list.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';

// challenge 1: print in reverse
// create a function that prints the nodes of a linked list in reverse order

// solution: 1
/* 
void printReversedLinkedList() {
  final linkedList = LinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  for (var element in linkedList.toList().reversed) {
    print(element);
  }
}
 */

// solution:2
/* 
void printReversedLinkedList() {
  final linkedList = LinkedList<int>();
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);

  Stack stack = Stack<int>();

  for (var element in linkedList) {
    stack.push(element);
  }

  while (stack.isNotEmpty) {
    print(stack.pop());
  }
}
*/

// solution: 3
/* 
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
 */

//book's solution for challenge 1
/* 
void printReversedLinkedList<E>(LinkedList<E> list) {
  printReveredLinkedListRecursively<E>(list.head);
}

void printReveredLinkedListRecursively<E>(Node<E>? node) {
  if (node == null) return;
  printReveredLinkedListRecursively(node.next);
  print(node.value);
}
 */

// challenge 2: find the middle value
// create a function that finds the middle value of a linked list

// solution: 1
/* 
void printMiddleNodeValue<E>(LinkedList<E> linkedList) {
  final linkedListLength = linkedList.length;
  final middleNodeIndex = (linkedListLength / 2).floor();
  print(linkedList.nodeAt(middleNodeIndex)?.value);
} */

// book's solution for challenge 2
// using the runner's technique to find the middle
/* 

Node<E>? getMiddleNode<E>(LinkedList<E> linkedList) {
  var slow = linkedList.head;
  var fast = linkedList.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}
*/

// challenge 3: reverse a linked list
// create a function that reverses a linked list. You do this by manipulating the nodes so tha
// they're linked in the other direction.

// solution: 1
// using recursion
/* 
void reverseLinkedListRecursively<E>(LinkedList<E> linkedList) {
  // handles when linkedList has only one node or no nodes
  if (linkedList.tail == linkedList.head || linkedList.isEmpty) return;

  var newTailNode = _reverseLinkedListRecursively(linkedList.head!);
  newTailNode.next = null;
  linkedList.head = linkedList.tail;
  linkedList.tail = newTailNode;
}

Node<E> _reverseLinkedListRecursively<E>(Node<E> node) {
  var nextNode = node;
  if (node.next == null) return nextNode;

  var currentNode = _reverseLinkedListRecursively<E>(node.next!);

  currentNode.next = nextNode;
  return nextNode;
}
*/

//book's solution for challenge 3
/* 
extension ReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;
    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    head = previous;
  }
}
*/

// challenge 4: Remove all occurrences
// create a function that removes all occurrences of a specific element from a linked list

// solution: 1
extension RemoveAllOccurrences<E> on LinkedList<E> {
  void removeAll(E value) {
    var currentNode = head;
    Node<E>? previousNode;

    bool isHeadSet = false;

    while (currentNode != null) {
      if (currentNode.value == value) {
        final next = currentNode.next;
        previousNode?.next = next;
        currentNode.next = null;
        currentNode = next;

        if (!isHeadSet) head = currentNode;
        if (next == null) tail = previousNode;
      } else {
        previousNode = currentNode;
        currentNode = currentNode.next;

        // in case the value you want to remove is on the head node and any adjust nodes, this ensures that the head will point to
        // the node which the previousNode will be pointing to the very first time. the head will stick on that node even when the previousNode moves forward.
        if (!isHeadSet) {
          head = previousNode;
          isHeadSet = true;
        }
      }
    }
  }
}
