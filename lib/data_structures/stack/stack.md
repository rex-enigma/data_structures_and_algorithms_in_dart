#### Definition:
- A stack is a **LIFO**, last-in-first-out, abstract data type / abstract data structure.

- Essential operations are push and pop methods which have O(1) time complexity.

#### Stack ADT can be implemented using:
1. list(normal array data structure). [i will be using it to implement stack]
2. doubly linked list data structure.
3. singly linked list data structure.
4. double ended queue (deque): DequeSingleList, DequeDoublyLinkedList, DequeSinglyLinkedList data structures.[what i mean is that you can implement deque using either a single list, singly linked list or doubly linked list.]

#### Common public properties:
1. **isEmpty** -> checks if stack is empty.

#### Common operations are:
1. **push** -> adds an element to the top of the stack
2. **pop** -> removes and returns the element at the top of the stack
3. **peek** -> returns a copy(if the data is primitive eg int,double,float,string) or a reference of the element at the top of the stack without removing it.


#### Applications of stack:
 1. Stacks are crucial to problems that searches trees and graphs. eg backtracking.
 2. Function call management.(call stack)
 3. Undo mechanism in software.
 4. Browser history.

#### Key points:
1. A stack is a **LIFO**, last-in first-out abstract data type, which can be implemented using  a normal list aka array, doubly linked list, singly linked list or double ended queue data structure.
2. Push, pop and peak are constant time operations.