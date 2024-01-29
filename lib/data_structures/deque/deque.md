Double-ended queue aka deque is an abstract data typed that allows elements/values to be inserted and removed on both sides ( front and back )

#### deque ADT can be implemented using:
1. list(normal array data structure).
2. doubly linked list data structure.
3. singly linked list data structure.



#### common operation are:
1. **enqueue** -> insert an element at the front or back of the deque. Return true when operation is successful.
2. **dequeue** -> remove and return the element at the front or back of the deque.
3. **peek** -> return an element at the front or back of the deque without removing it.
4. **isEmpty** -> check if the deque is empty.


#### applications of deque
1. Palindrome Checking -> Deques can efficiently determine whether a string or number is a palindrome (reads the same backward as forward). Characters are added to the deque then they are compared from both ends for equality until the deque is empty.
2. Breadth-First Search (BFS)-> In certain graph algorithms like BFS, Deques can be used to maintain the order in which nodes are visited.
3. Round Robin Scheduling -> In CPU scheduling, deques can implement round robin algorithms, where processes are given equal time slices in a circular fashion.

#### key points
1. Deque can act as both a queue(FIFO) and a stack(LIFO) offering flexibility in implementing various data structures such a s stack, queue.



**Other Info:** Dart queues are actually double ended queues (deques), which means they can be accessed equally from either end, and can there for be used to implement both stack and queue behaviour.
