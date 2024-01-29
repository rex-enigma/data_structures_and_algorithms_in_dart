- Heap a.k.a **binary heap**, is a specialized tree based data structure that satisfies the heap property, ensuring that a value of a parent node is always greater that or equal to(in a **max heap**) or less that or equal to(in a **min heap**) the value of its children. A heap is a **complete binary tree**( meaning all levels are fully filled, except possibly the last one, which is filled from left to right) that can be implemented using a **list**. It can be used to implement *priority queue*. [you can look at it in both tree representation or list representation, check wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)#/media/File:Max-Heap-new.svg). This heap is different from **memory heap** since memory heap is a diff concept.

- Heap is usually implemented with a List.
- Each element in the list represents a node of the heap and
- The parent / child(left or right) relationship is defined **implicitly** by elements' indices in the list.

- Given a heapNode at index i:
  - The **left child** of this heapNode is at index 2i + 1.
  - The **right child** of this heapNode is at index 2i + 2.
  - The **parent** of this heapNode is at index (i - 1) ~/ 2.(~ operator drops any fractional value)
  
- Accessing a particular node in a heap tree has a time complexity of O(1) due to its using list for its implementation as compared to binary search tree that requires traversing from the root, which is an O(log n) operation.

- Heaps come in two flavor:
   1. **min-heap**, in which elements with ***lowest*** value have a highest priority.
   2. **max-heap**, in which elements with ***highest*** value have highest priority.


#### Heap property
 ```
         (10)                                                   (1)
        /    \                                                 /   \
      (8)     (4)                                           (2)     (4)
     /   \                                                 /   \
   (5)   (1)                                            (5)     (8)
 
  Max heap -> parent node must always contain          Min heap -> parent node must always contain
   a value that is greatest than or equal to the       a value that is less than or equal to the 
   value in its children. The root node will always    value in its children. The root node will
   contain the highest value.                          always contain the lowest value.

```

#### common operation are:

   

#### applications of trees:


#### key points:
