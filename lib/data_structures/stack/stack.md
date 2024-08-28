#### Definition:
- A stack is a **LIFO**, last-in-first-out, abstract data type / abstract data structure.

- Essential operations are push and pop method which have O(1) time complexity.

#### Stack ADT can be implemented using:
1. list(normal array data structure).
2. doubly linked list data structure.
3. singly linked list data structure.
4. double ended queue (deque): DequeSingleList, DequeDoublyLinkedList, DequeSinglyLinkedList data structures.[what i mean is that you can implement deque using either a single list, singly linked list or doubly linked list.]

#### Common operations are:
1. **push** -> add an element to the top of the stack
2. **pop** -> remove and return the element at the top of the stack
3. **peek** -> return a reference of the element at the top of the stack without removing it.


#### Applications of stack:
 1. Stacks are crucial to problems that searches trees and graphs. eg backtracking.
 2. Function call management.(call stack)
 3. Undo mechanism in software.
 4. Browser history.

#### Key points:
1. A stack is a **LIFO**, last-in first-out abstract data type, which can be implemented using  a normal list aka array, doubly linked list, singly linked list or double ended queue data structure.
2. Push, pop and peak are constant time operations.