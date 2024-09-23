#### Definition:
- Priority queue it a type of queue in which elements are dequeued in **priority order** instead of FIFO order.

#### Types of priority queue:
   1. **Max-priority queue**, in which element at the back is always the largest.
   2. **Min-priority queue**, in which element at the back is always the smallest.
   
**NB:**
- elements are removed from the back to make dequeueing O(1) instead of O(n) if elements were to be dequeued from the front.

 ##### Priority queue can be implemented using:
 1. **sorted list** -> this is useful to obtain the maximum or minimum value in O(1) time. However, insertion is slow and will require O(n) time since you have to first search for the insertion location and then shift every element after that location.
 2. **balanced binary search tree / AVL** -> this is useful in creating a **double ended priority queue** which features getting both the maximum and minimum value in O(log n) time. Insertion is better than a sorted list, also O(log n).
 3. **heap** -> this is a natural choice for priority queue. A heap is more efficient than a sorted list because a heap only need to be partially sorted. Inserting and removing from a heap are O(log n) while simply querying the highest priority value is O(1).[i will be using heap for the implementation]


- A priority queue creates a layer of abstraction by focusing on the key operations of a queue and leaving out additional functionality provided by heap. Its only job is to enqueue and dequeue elements, nothing else.

#### Common operations are:(similar to queue's operations)
1. **enqueue** -> insert an element into priority queue and return true if the operation is successful.
2. **dequeue** -> remove and return the element with the highest priority. Return null if the priority queue is empty.(most of the time the element dequeued is the first element in list based implementation or the root element in a tree based implementation)
3. **isEmpty** -> check if the priority queue is empty.
4. **peek** -> return a reference of the element with the highest priority without removing it. Return null is the priority queue is empty. (most of the time the element peeked is the first element in list based implementation or the root element in a tree based implementation)


#### Applications of priority queue:
1. Dijkstra's algorithm for finding shortest paths uses a priority queue to explore nodes in the graphs efficiently prioritizing those closer to the destination.
2. In operating system, priority queues are used to schedule processes based on their importance or resource requirements.
3. heapSort algorithms uses priority queue.
4. Huffman coding that build a compression tree. a min-priority queue is used to repeatedly find two nodes with the smallest frequency that do not yet have a parent node.
5. Triage systems in emergency departments rely on priority queues to asses and treat patients base on the severity of their conditions.

#### Key points:
1. Priority queue is often used to retrieve elements in **priority order**.
2. A max-priority queue prioritizes the largest elements, while a min-priority queue prioritizes the smallest elements.
3. Wrapping a heap with queue interface allows you to focus on the key operations of a queue while ignoring unneeded heap operations.