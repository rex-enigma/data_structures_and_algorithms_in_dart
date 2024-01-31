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
      The left most value represents the index for the elements in brackets 

         (10)0                                                  (1)0
        /    \                                                 /   \
      (8)1   (4)2                                            (2)1  (4)2
     /   \                                                  /   \
   (5)3  (1)4                                             (5)3  (8)3
 
   max-heap property:                                  min-heap property:
   In max heap,parent node must always contain         In min heap,parent node must always contain
   a value that is greatest than or equal to the       a value that is less than or equal to the 
   value in its children. The root node will always    value in its children. The root node will
   contain the highest value.                          always contain the lowest value.

```

#### common operation are:
1. **peek** -> return a reference of the highest priority or the lowest priority value in a max-heap or min-heap respectively without removing it. This value is found in the root element(the first element in the list) of either the max-heap or min-heap respectively.
2. **insertion / push** -> add a value to the heap tree. Adding a value in a heap(max heap or min heap) might make the heap violate the heap property. Therefore after adding a value to the heap, ***sifting up***(is the process of moving the heapNode up in the heap tree {since list is the one used to implement heap we can also say, moving the heapNode leftwards of the list} as long as needed to restore heap condition / property ) is done to restore the heap property. Example of an ***insertion algorithm for max heap***:
   1. A heapNode representing this value is first added at the end of the list
   2. The new heapNode is compared to its parent, if the new heapNode's value is smaller than its parent, the insertion is done, otherwise,
   3. Sifting up is done through swapping the new heapNode with its parent.
   4. step 2-3 is repeated until the new heapNode either reaches the root(index 0 in the list) satisfying the heap property OR becomes smaller than or equal to its parent satisfying the heap property as well and the insertion is done.
3. **remove / pop** -> remove and return the root heapNode's value from a heap tree(max heap or min heap). This is done first by swapping the root heapNode(first heapNode in the list) with the last heapNode in the list. The swapping of the root heapNode with the last heapNode in the list first before removing it, makes removing easier with a time complexity of O(1) since the heapNodes in the list wont have to shift leftwards. removing a value in a heap(max heap or min heap) might make the heap violate the heap property
   

#### applications of trees:


#### key points:
