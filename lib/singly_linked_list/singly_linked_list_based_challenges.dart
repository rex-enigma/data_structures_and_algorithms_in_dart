import 'dart:io';

import 'package:dart_data_structure_and_algorithm/singly_linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';

// challenge 1: print in reverse
// create a function that prints the nodes of a linked list in reverse order

// solution: 1
/* 
void printReversedSinglyLinkedList() {
  final linkedList = SinglyLinkedList<int>();
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
void printReversedSinglyLinkedList() {
  final linkedList = SinglyLinkedList<int>();
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

SinglyLinkedList? linkedList;
Node? currentNode;

void printReversedSinglyLinkedList<E>(SinglyLinkedList<E> list) {
  linkedList = list;
  currentNode = linkedList!.head;
  printReveredSinglyLinkedListRecursively<E>();
}

void printReveredSinglyLinkedListRecursively<E>() {
  E value = currentNode!.value;
  if (currentNode != linkedList!.tail) {
    currentNode = currentNode!.next;
    printReveredSinglyLinkedListRecursively();
  }
  print(value);
}

//book's solution for challenge 1
/* 
void printReversedSinglyLinkedList<E>(SinglyLinkedList<E> list) {
  printReveredSinglyLinkedListRecursively<E>(list.head);
}

void printReveredSinglyLinkedListRecursively<E>(Node<E>? node) {
  if (node == null) return;
  printReveredSinglyLinkedListRecursively(node.next);
  print(node.value);
}
 */

// challenge 2: find the middle value
// create a function that finds the middle value of a linked list

// solution: 1

extension MiddleNodeValue<T> on SinglyLinkedList<T> {
  /// returns the middle value of this linkedList. Returns null if linked list is empty.
  T? middleValue() {
    final linkedListLength = length;
    final middleNodeIndex = (linkedListLength / 2).floor();
    return nodeAt(middleNodeIndex)?.value;
  }
}

// book's solution for challenge 2
// using the runner's technique to find the middle
/* 
Node<E>? getMiddleNode<E>(SinglyLinkedList<E> linkedList) {
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
// used recursion to reverse a linked list.
extension ReverseLinkedList<E> on SinglyLinkedList<E> {
  void reverseSinglyLinkedListRecursively() {
    // handles when linkedList has only one node or no nodes
    if (tail == head || isEmpty) return;

    var newTailNode = _reverseSinglyLinkedListRecursively(head!);
    newTailNode.next = null;
    head = tail;
    tail = newTailNode;
  }

  Node<E> _reverseSinglyLinkedListRecursively(Node<E> node) {
    var nextNode = node;
    if (node.next == null) return nextNode;

    var currentNode = _reverseSinglyLinkedListRecursively(node.next!);

    currentNode.next = nextNode;
    return nextNode;
  }
}

//book's solution for challenge 3
/* 
extension ReversibleSinglyLinkedList<E> on SinglyLinkedList<E> {
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
extension RemoveAllOccurrences<E> on SinglyLinkedList<E> {
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


// //book's solution for challenge 4
/* 
extension RemovableSinglyLinkedList<E> on SinglyLinkedList {
  void removeAll(E value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }

    var previous = head;
    var current = head!.next;

    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
      }
      previous = current;
      current = current?.next;
      tail = previous; // bug detected here: if only one node remains after removing all occurrences of 'value', tail will be pointing to null instead of pointing to that node, causing the SinglyLinkedList.append method to crash
    }
  }
}
*/