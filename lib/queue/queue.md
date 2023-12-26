Queue used **FIFO**, first-in first-out ordering, abstract data type, meaning the first element that was added will always be the first to be removed.

Queues are handy when you need to maintain the order of your elements to process later.

Queue only cares about removal at the front and insertion at the back, you don't need to know what the contents are in between.

#### Queue ADT can be implemented using:
1. List(normal array data structure).
2. Doubly linked list data structure
3. singly linked list data structure.
4. Ring buffer data structures.
5. Double list (2 list) data structures.
6. double ended queue (deque): DequeSingleList, DequeDoublyLinkedList, DequeSinglyLinkedList data structures.[what i mean is that you can implement deque using either a single list, doubly linked list or doubly linked list in you can use those concrete implementations to implement a queue]



#### common operation are:
1. **enqueue** -> insert an element at the back of the queue. Return true when operation is successful.
2. **dequeue** -> remove and return the element at the front of the queue.
3. **isEmpty** -> check if the queue is empty.
4. **peek** -> return a reference of the element at the front of the queue without removing it.


##### applications of queue 




##### key points
Dequeuing an item in list base queue takes linear time ,O(n), while dequeueing an item in both single and double linked list based queue takes constant time O(1).

The main weakness of queueSingleLinkedList and queueDoubleLinkedList is, every time you create a new element it requires extra storage for the forward and back reference and also it requires a relatively expensive dynamic allocation of memory for the new node.By contrast, QueueList does bulk allocation, which is relatively faster.
