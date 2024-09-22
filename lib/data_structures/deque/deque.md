#### Definition
Double-ended queue aka deque is an abstract data typed that allows elements/values to be inserted and removed on both sides (front and back)

#### Deque ADT can be implemented using:
1. list(normal array data structure).
2. doubly linked list data structure.
3. singly linked list data structure. [i will be using it to implement deque]

#### Common public properties:
1. **isEmpty** -> checks if the deque is empty.

#### Common operation are:
1. **enqueue** -> inserts an element at the front or back of the deque. Return true when operation is successful.
2. **dequeue** -> removes and return the element at the front or back of the deque.
3. **peek** -> returns a copy(if the data is primitive eg int,double,float,string) or a reference of the element at the front or back of the deque without removing it.

#### Applications of deque:
1. Palindrome Checking -> Deques can efficiently determine whether a string or number is a palindrome (reads the same backward as forward). Characters are added to the deque then they are compared from both ends for equality until the deque is empty.
2. Breadth-First Search (BFS)-> In certain graph algorithms like BFS, Deques can be used to maintain the order in which nodes are visited.
3. Round Robin Scheduling -> In CPU scheduling, deques can implement round robin algorithms, where processes are given equal time slices in a circular fashion.

#### Key points:
1. Deque can act as both a queue(FIFO) and a stack(LIFO) offering flexibility in implementing various data structures such a s stack, queue.



**Extra Info:** Dart queues are actually double ended queues (deques), which means they can be accessed equally from either end, and can therefore be used to implement both stack and queue behaviour.
