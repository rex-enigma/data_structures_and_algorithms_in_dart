#### Definition:
- Queue is a **FIFO**, first-in first-out abstract data type. This means that, first element that is added will always be the first to be removed.

- Queues are handy when you need to maintain the order of your elements to process later.

- Queue only cares about removal at the front and insertion at the back, you don't need to know what the contents are in between.

#### Queue ADT can be implemented using:
1. List(normal array data structure).[i will be used it to implement queue]
2. Doubly linked list data structure
3. singly linked list data structure.[i will be used it to implement queue]
4. Ring buffer data structures.[i will be used it to implement queue]
5. Double list (2 list) data structures.[i will be used it to implement queue]
6. double ended queue (deque): DequeSingleList, DequeSinglyLinkedList, DequeDoublyLinkedList data structures.[what i mean is that you can implement deque using either a single list, singly linked list or doubly linked list concrete implementations]

#### Common public properties:
1. **isEmpty** -> checks if the queue is empty.
 
#### Common operation are:
1. **enqueue** -> inserts an element at the back of the queue. Return true when operation is successful.
2. **dequeue** -> removes and returns the element at the front of the queue. Return null if the queue is empty. 
3. **peek** ->  returns a copy(if the data is primitive eg int,double,float,string) or a reference of the element at the front of the queue without removing it. Return null if the queue is empty.


#### Applications of queue:
1. print queue -> in printer spooling systems, print jobs are placed in a queue and they are printed in the order they are received.
2. breadth-first-search(BFS) in graphs -> queues are essential in graph algorithms, particularly in BFS traversal. Nodes are processed in levels, with each level representing the distance from the source node
3. handling of requests in web servers -> web servers use queues to manage incoming requests from clients. The server processes request in the order they are received.
4. Order processing in e-commerce -> queues can be used to manage the processing of orders. 



#### key points:
1. Dequeuing an item in list base queue takes linear time , O(n), while dequeueing an item in both single and double linked list based queue takes constant time O(1).
2. Queue takes a FIFO strategy: an element added first must be removed first.
3. Single list base queue imp, elements are laid out in a contiguous memory blocks whereas in a singly linked list are more scattered with potential of cache misses.
4. A ring buffer based implementation is good for queues with a fixed size.
5. Compared to a single list-based implementation, leveraging two lists improves
the dequeue time complexity to an amortized O(1) operation.
6. The two lists (double-list) implementation beats out linked-list in terms of spatial locality.

**Note:**
The main weakness of QueueDoublyLinkedList is, every time you create a new element it requires extra storage for the forward and back reference and also it requires a relatively expensive dynamic allocation of memory for the new node.By contrast, QueueList does bulk allocation, which is relatively faster.
