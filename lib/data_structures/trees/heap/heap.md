#### Definition:
- Heap (will be working with `binary heap` specifically), is a specialized tree based data structure that satisfies the heap property, ensuring that a value of a parent node is always greater that or equal to(in a **max heap**) or less that or equal to(in a **min heap**) the value of its children(the left and the right child). A heap is a **complete binary tree**( meaning all levels are fully filled, except possibly the last one, which is filled from left to right) that can be implemented using a **list**. It can be used to implement *priority queue*. [you can look at it in both tree representation or list representation, check wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)#/media/File:Max-Heap-new.svg). This heap is different from **memory heap** since memory heap is a diff concept.

- Heap tree is partially sorted / ordered.

#### Heap can be implemented using:
1. Heap is usually implemented using a List. [i will be using it to implement binary heap]
   - Each element in the list represents a node of the heap and
   - The parent-child(left or right) relationship is defined **implicitly** by elements' indices in the list.
2. Binary tree.
<br>
- Given an element at index i:
  - The **left child** of this element is at index 2i + 1.
  - The **right child** of this element is at index 2i + 2.
  - The **parent** of this element is at index (i - 1) ~/ 2.(~ operator drops any fractional value)
  
- Accessing a particular node in a heap tree has a time complexity of O(1) due to its using list for its implementation as compared to binary search tree that requires traversing from the root, which is an O(log n) operation.

- Heaps come in two flavour:
   1. **Max-heap**, in which elements with ***highest*** value have highest priority.
   2. **Min-heap**, in which elements with ***lowest*** value have a highest priority.
    

#### Heap property:
```
The right most value represents the index for the elements in brackets 

         (10)0                                               
        /    \                                                
      (8)1   (4)2                                           
     /   \                                               
   (5)3  (1)4                                             
 
   max-heap property:                                   
   In max heap, parent node always contains a value that is greater than or equal to the value of its children nodes. 
   The maximum value is always at the root node.(meaning, all descendant values must be less than the root value)
   
        (1)0
        /   \
      (2)1  (4)2
     /   \
  (5)3  (8)3
 
   min-heap property:
   In min heap, parent node always contains a value that is less than or equal to the value of its children nodes.   
   The minimum value is always at the root node.(meaning, all descendant values must be greater than the root value)
```
#### Common public properties:
1. **isEmpty** -> checks if the heap is empty.
2. **priority** -> specifies the type of heap (either max or min).
3. **size** -> returns number of values currently stored in this heap.

#### Common operation are:
1. **peek** -> returns a copy(if the data is primitive eg int,double,float,string) or a reference of the root value (the first value in the list) from a heap tree (max-heap or min-heap) without removing it.
2. **insert** -> inserts a value to the heap tree. Adding a value in a heap(max heap or min heap) might make the heap violate the heap property, therefore after adding a value to the heap, ***sifting up***(is the process of moving the new value up in the heap tree {since list is the one used to implement heap we can also say, moving the new value leftwards of the list} continuously upwards | leftwards as needed to restore heap condition / property) is done to restore the heap property. Example of an ***insertion algorithm for max heap***:
   
   1. A value is first added at the end of the list.
   2. The new value is compared to its parent, if the new value is smaller than  or equal to its parent, the insertion is done, otherwise,
   3. Sifting up is done through swapping the new value with its parent.
   4. step 2 - 3 is repeated until the new value either reaches the root(index 0 in the list) satisfying the heap property OR becomes smaller than or equal to its parent satisfying the heap property as well and the insertion is done.
   
3. **remove** -> removes and return the root value(the first value in the list) from a heap tree(max heap or min heap). This is done first by swapping the root value(first value in the list) with the last value in the list. The swapping of the root value with the last value in the list first before removing it, makes removing easier with a time complexity of O(1) since the values in the list wont have to shift leftwards after the root value is removed. Removing a value from a heap(max heap or min heap) might make the heap violate the heap property, therefore after swapping and removing the root value, ***sifting down***(is the process of moving the root value, the one that was swapped with the actual root value, down the heap tree {moving it rightwards in the list}) is done to restore the heap property.(worse case time complexity is O(log n) due to sifting down) Example of a ***removal algorithm for max heap***:
   
   1. The root value (the first in the list) is swapped with the last value, which is then removed as the last value from the heap tree(from the list).
   2. Swift down is done by:
      1. keeping track of parent index when traversing downwards | rightwards
      2. Find the indices of the parent's left and right children.
      3. Use a variable (let call it ***chosen***) to keep track of the index representing a value to swap with the parent index's value. 
      4. If there's leftChild, and has high priority than its parent, make it the chosen one.
      5. If there's rightChild and has an even higher priority than the current chosen one, make it the chosen one instead.
      6. if the chosen is still parent, then the removal is done and no more sifting down is required.
      7. Otherwise, swap the chosen with the parent and set it as the new parent and repeat step 2 - 7.
   
4. **removeAt** -> removes and return an arbitrary value of the given index from the heap tree. Example of a ***removeAt algorithm for both max and min heap***:
   
   1. we'll be using index to access the value that we want to remove and return from the heap tree.
   2. check to see if the provided index is within the bound of the list. if not, return null.
   3. if the  value to be removed is the last in the heap, just remove and return the value.
   4. if the value to be removed is not the last in the heap, first swap that value with the last value, then remove the last value, saving it to a variable to be returned at the end.
   5. perform a down sift then up sift to adjust the heap.
   6. return the value you saved.
   
5. **indexOf** -> returns an index of a heap value if its exist otherwise it returns -1. Can be used together with **removeAt** operation to find and remove a values if it exist


#### Internal private helper operations:
   1. ***siftDown*** -> moves a value down in the heap (move a value rightwards in the list) to restore heap condition / property.
   2. ***siftUp*** -> moves a value up in the heap (move a value leftwards in th list) to restore heap condition / property.
   3. ***buildHeap / heapify*** -> creates a heap out of the given list of comparable values. Sifting down is performed only on the 'non-leaf values / parent values(values that have both children or one child,) in which the formula ***(lengthOfList ~/ 2) - 1*** is used to determine the number of non-leaf values, which will be used to loop through the list in reverse, starting from the last non-leaf value to the first non-leaf value. Build heap has a time complexity of O(log n) as compared to time complexity of O(n log n) if sifting up was used.
   4. ***leftChildIndex*** -> returns the leftChild's index of the parent's value. This index can be determined by the formula ***2i + 1***, where i is the index of the parent.
   5. ***rightChildIndex*** -> returns the rightChild's index of the parent's value. This index can be determined by the formula ***2i + 2***, where i is the index of the parent.
   6. ***parentIndex*** -> returns the parent index given either left or right child's index. This index can be determined by the formula ***(i - 1) ~/2***, where i is the index representing either the left or right child's index.
   7. ***swap*** -> swaps two heap values which are out of order.
   
**NB**: 
1. for both sifting down and sifting up to happen, you will only comparing the child value to its parent value and do swapping if child value has higher priority than its parent value.
2. The current implementation (in list_based_heap_implementation.dart file) for heap using a list ***sometimes*** it doesn't not guarantee the order in which when equal values are added will be the same order in which they will be removed.For example:
if first, `value1`, get added then the second, `value1`, get added later, when removing the values from a heap, second value1 ***might*** get removed first before the actual first `value1` that was added as the first one.


#### Applications of heap tree:
1. It's used to implement **heapSort algorithm** .(is a comparison-based sorting algorithm for linear data structure.)
2. It's used to implement **priority queue**.
3. It's used to build graph algorithms that use a priority queue, like dijkstra's algorithm.
4. Calculating the minimum or maximum element of a collection.


#### Key points:
1. Heap data structure is good for maintaining the highest priority value. Meaning in max-heap the greatest values has the highest priority and in min-heap the smallest value has the highest priority.
2. In max-heap the parent value is greater than or equal to that of its children(left and right child in binary heap).
3. For min-heap the parent value is smaller than or equal to that of its children(left and right child in binary heap).
4. Every time you insert or remove items, you must take care to preserve the heap property / condition. whether max or min.
5. There can't be any holes in a heap. The shape property requires that all of the upper levels must be completely filled, and the final level needs to be filled from left to right.
6. Elements in heap are packed in contiguous memory using simple formulas for lookup.
7. Insertion operation has a average and worse time complexity of O(log n).
8. Removal operation has a average and worse time complexity of O(log n).
9. Search operation has a average and worse time complexity of O(n).
10. peek operation has a average and worse time complexity of O(1)

