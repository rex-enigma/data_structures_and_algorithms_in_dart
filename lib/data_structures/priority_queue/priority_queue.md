- Priority queue it a type of queue in which elements are dequeued in **priority order** instead of FIFO order.

- Priority queue can be either of these two:
   1. **Max-priority queue**, in which element at the front is always the largest.
   2. **Min-priority queue**, in which element at the front is always the smallest.

 ##### Priority queue can be implemented using:
 1. sorted list -> this is useful to obtain the maximum or minimum value in O(1) time. However, insertion is slow and will require O(n) time since you have to first search for the insertion location and then shift every element after that location.
 2. balanced binary search tree / AVL -> this is useful in creating a **double ended priority queue** which features getting both the maximum and minimum value in O(log n) time. Insertion is better than a sorted list, also O(log n).
 3. heap -> this is a natural choice for priority queue. A heap is more efficient than a sorted list because a heap only need to be partially sorted. Inserting and removing from a heap are O(log n) while simply querying the highest priority value is O(1).(will be using heap for the implementation)


- A priority queue creates a layer of abstraction by focusing on the key operations of a queue and leaving out additional functionality provided by heap. Its only job is to enqueue and dequeue elements, nothing else.

#### common operations are:(similar to queue's operations)
1. **enqueue** -> insert an element into priority queue and return true if the operation is successful.
2. **dequeue** -> remove and return the element with the highest priority. Return null if the priority queue is empty.(most of the time the element dequeued is the first element in list based implementation or the root element in a tree based implementation)
3. **isEmpty** -> check if the priority queue is empty.
4. **peek** -> return a reference of the element with the highest priority without removing it. Return null is the priority queue is empty. (most of the time the element peeked is the first element in list based implementation or the root element in a tree based implementation)


#### applications of priority queue:

#### key points: