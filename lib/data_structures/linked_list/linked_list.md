#### Definition:
- A linked list is an abstract data type representing collection of values arranged in a linear sequence.

- A linked list is a chain of 'Nodes' that hold a value and a reference to the next Node. A null reference indicates the end of the linked list.

#### Types of Linked List
1. **single linked list | unidirectional linked list** is a type of a linked list were each node has a pointer to the next node in the list, but not the previous node. The linked list can only be traversed in one direction from the head node to the tail node.

2. **double linked list | bidirectional linked list** is a type of a linked list were each node has a pointer to the next node and the previous node in the list. The linked list can be traversed in either direction, from head node to tail node and vise versa.

#### A link list has a several theoretical advantages over contiguous storage options such as the Dart List:
1. *constant time insertion and deletion from the front of the list.O(1)*
2. *reliable performance characteristics.*


#### Common public properties:
1. **head** -> holds the first Node of the linked list.
2. **tail** -> holds the last Node of the linked list.
3. **isEmpty** -> checks if linked list is empty.

#### Common operation are:
- ##### Adding a value to a linked list:
  1. **push** -> adds a value at the front of the linked list.
  2. **append** -> adds a value at the end of the linked list.
  3. **insertAfter** -> adds a value after a particular node in the linked list. 

- ##### Removing a value from a linked list:
  1. **pop** -> removes and returns the value at the front of the linked list. Returns null if the linked list is empty.
  2. **removeLast** -> removes and returns the value at the end of the linked list. Returns null if the linked list is empty.
  3. **removeAfter** -> removes and returns the value after a particular node in the linked list. Returns null if the linked list is empty.
   
- ##### Additional useful operations:
  1. **nodeAt** -> returns a reference of a node at a particular index, without removing it.



#### Applications of linked list:
1. Implementing other data structures. eg stack, queue, deque
2. Dynamic memory allocation.
3. Representing graphs -> Linked lists are perfect for representing graphs using adjacency lists: Each node in the graph has a linked list of its adjacent nodes, enabling efficient graph traversal algorithms like breadth-first search and depth-first search.
4. Symbol Tables -> Compilers and interpreters use linked lists to create symbol tables: These tables map identifiers like variable names to their associated values or memory locations.

#### Key points:
1. Linked list has O(1) time complexity for head first insertions whereas standard list have O(n) time complexity for head first insertions.
2. Implementing the Dart *Iterable* interface allows you to loop through the linked list elements.