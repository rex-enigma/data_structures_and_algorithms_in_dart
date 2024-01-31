A stack is a **LIFO**, last-in-first-out, abstract data type.
Common operation are push and pop method which have O(1) time complexity.

#### Stack ADT can be implemented using:
1. list(normal array data structure).
2. doubly linked list data structure.
3. singly linked list data structure.
4. double ended queue (deque): DequeSingleList, DequeDoublyLinkedList, DequeSinglyLinkedList data structures.[what i mean is that you can implement deque using either a single list, doubly linked list or doubly linked list in you can use those concrete implementations to implement a queue]

#### common operation are:
1. **push** -> add element on top of the stack
2. **pop** -> remove and return the element on top of the stack
3. **peek** -> return a reference of the element on top of the stack without removing it.


#### applications of stack 
 1. Stacks are crucial to problems that search trees and graphs. eg backtracking.
 2. function call management.
 3. undo mechanism in software.
 4. browser history.

#### key points
1. A stack is a **LIFO**, last-in first-out data structure.
2. push,pop and peak are constant time operations