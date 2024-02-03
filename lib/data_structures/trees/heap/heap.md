- Heap a.k.a **binary heap**, is a specialized tree based data structure that satisfies the heap property, ensuring that a value of a parent node is always greater that or equal to(in a **max heap**) or less that or equal to(in a **min heap**) the value of its children. A heap is a **complete binary tree**( meaning all levels are fully filled, except possibly the last one, which is filled from left to right) that can be implemented using a **list**. It can be used to implement *priority queue*. [you can look at it in both tree representation or list representation, check wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)#/media/File:Max-Heap-new.svg). This heap is different from **memory heap** since memory heap is a diff concept.

- Heap is usually implemented with a List.
- Each element in the list represents a node of the heap and
- The parent / child(left or right) relationship is defined **implicitly** by elements' indices in the list.
- Heap tree is partially sorted.

- Given an element at index i:
  - The **left child** of this element is at index 2i + 1.
  - The **right child** of this element is at index 2i + 2.
  - The **parent** of this element is at index (i - 1) ~/ 2.(~ operator drops any fractional value)
  
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
2. **insertion / push** -> add a value to the heap tree. Adding a value in a heap(max heap or min heap) might make the heap violate the heap property, therefore after adding a value to the heap, ***sifting up***(is the process of moving the new value up in the heap tree {since list is the one used to implement heap we can also say, moving the new value leftwards of the list} as long as needed to restore heap condition / property ) is done to restore the heap property. Example of an ***insertion algorithm for max heap***:
   1. A value is first added at the end of the list.
   2. The new value is compared to its parent, if the new value is smaller than its parent, the insertion is done, otherwise,
   3. Sifting up is done through swapping the new value with its parent.
   4. step 2 - 3 is repeated until the new value either reaches the root(index 0 in the list) satisfying the heap property OR becomes smaller than or equal to its parent satisfying the heap property as well and the insertion is done.
3. **remove / pop** -> remove and return the root value from a heap tree(max heap or min heap). This is done first by swapping the root value(first value in the list) with the last value in the list. The swapping of the root value with the last value in the list first before removing it, makes removing easier with a time complexity of O(1) since the values in the list wont have to shift leftwards after the root value is removed. Removing a value from a heap(max heap or min heap) might make the heap violate the heap property, therefore after swapping and removing the root value which will be at the last index of the list, ***sifting down***(is the process of moving the root value, the one that was swapped with the actual root value, down the heap tree {moving it rightwards in the list})is done to restore the heap property.(worse case time complexity is O(log n) due to sifting down) Example of a ***removal algorithm for max heap***:
   1. The root value (the first in the list) is swapped with the last value, which is then removed as the last value from the heap tree(from the list).
   2. Swift down is done by:
      1. storing the parent index to keep track where you are in the traversal
      2. Find the indices of the parent's left and right children.
      3. Use a variable (let call it ***chosen***) to keep track of which index that represents a value to swap with the parent index's value. 
      4. If there's leftChild, and has high priority than its parent, make it the chosen one.
      5. If there's rightChild and has an even higher priority than the current chosen on, make it the chosen one instead.
      6. if the chosen is still parent, then the removal is done and no more sifting down is required.
      7. Otherwise, swap the chosen with the parent and set it as the new parent and repeat step 2 - 7.
4. **removeAt** -> remove and return an arbitrary value from the heap tree. Example of a ***removeAt algorithm for both max and min heap***:
   1. we'll be using index to access the value we want to remove and return from the heap tree.
   2. check to see if the provided index is within the bound of the list. if not, return null.
   3. If the  value to be removed is the last in the heap, just remove and return the value.
   4. If the value to be removed is not the last in the heap, first swap that value with the last value, then remove the last value, saving it to a variable to be returned at the end.
   5. perform a down sift then up sift to adjust the heap.
   6. return the value you saved.
5. Other internal helper operations:
   1. ***siftDown*** -> move a value down in the heap (move a value rightwards in the list).
   2. ***siftUp*** -> move a value up in the heap (move a value leftwards in th list).
   3. ***buildHeap / heapify*** -> create a heap out of the given list of comparable values. Sifting down is performed only on the 'non-leaf values(values that have both children or one child), looping through the list backwards, starting from the last non leaf value to the first non-leaf value.It has a time complexity of O(log n) as compared to time complexity of O(n log n) if sifting up was used.
   4. ***leftChildIndex*** -> return the leftChild's index of the parent's value. This index can be determined by the formula ***2i + 1***, where i is the index of the parent.
   5. ***rightChildIndex*** -> return the rightChild's index of the parent's value. This index can be determined by the formula ***2i + 2***, where i is the index of the parent.
   6. ***parentIndex*** -> return the parent index given either left or right child's index. This index can be determined by the formula ***(i - 1) ~/2***, where i is the index representing either the left or right child's index.
   

#### applications of trees:


#### key points:
