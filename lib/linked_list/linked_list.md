A linked list is an abstract data type representing collection of values arranged in a linear sequence.

'single linked list' / 'unidirectional linked list' is a type of a linked list were each node has a pointer to the next node in the list, but not the previous node. The linked list can only be traversed in one direction from the head node to the tail node.

'double linked list' / 'bidirectional linked list' is a type of a linked list were each node has a pointer to the next node and the previous node in the list. The linked list can be traversed in either direction, from head node to tail node and vise versa.

#### A link list has a several theoretical advantages over contiguous storage options such as the dart List:
1. *constant  time insertion and deletion from the front of the list.O(1)*
2. *reliable performance characteristics.*


A linked list is a chain of 'Nodes' that hold a value and a reference to the next Node. A null reference indicates the end of the linked list.


#### common operation are:
- ##### Adding values to a list
  1. **push** -> adds a value at the front of the linked list.
  2. **append** -> adds a value at the end of the linked list.
  3. **insertAfter** -> adds a value after a particular node in the linked list. 

- ##### Removing values from a list
  1. **pop** -> removes and returns the value at the front of the linked list.
  2. **removeLast** -> removes and returns the value at the end of the linked list.
  3. **removeAfter** -> removes and returns the value after a particular node in the linked list.
- ##### additional useful operations
  1. **nodeAt** -> returns a node at a particular index.



##### applications of linked list
1. implementing other data structures. eg stack, queue, deque


##### key points
1. linked list hav O(1) time complexity for head first insertions whereas standard list have O(n) time complexity for head first insertions.
2. implementing the Dart *Iterable* interface allows you to loop through the elements of a collection as well as offering a host of other helpful methods