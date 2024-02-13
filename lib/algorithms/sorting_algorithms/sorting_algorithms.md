- Sorting algorithm is an algorithm that puts elements of a **list** in a specific order. The most frequently used order are, ***numerical order*** and ***lexicographical order*** which can be either ascending(a-z,0-9) or descending(z-a,9-0) order.

- A sorting algorithm is **stable** if its able to maintain the relative order of equal elements after being sorted.Example: If you have unsorted deck of cards in which 5 of clubs comes before the 5 of diamonds. If you then sort the cards by number only, the 5 of clubs would still come before the 5 of diamonds in a stable sort.

- Bubble, selection and insertion sort have worse time complexity of O(n^2)

#### List of sorting algorithms:
**A. Comparison based sorting algorithms:**
   1. **bubble sort** -> (a.k.a sinking sort), it iterates through an unsorted list, comparing adjacent elements and swapping them if they are in wrong order. This 'bubbling' motion gradually pushes the largest element to the rightmost position in each iteration.This process is repeated until the entire list is sorted. Bubble sort is a stable sorting algorithm. [check geeksforgeeks for visual illustration](https://www.geeksforgeeks.org/bubble-sort/).
   2. **insertion sort** ->  insertion sort builds a sorted sublist from left to right. It iterates through each element in the unsorted section, comparing it with elements in the sorted sublist from right to left to find its correct insertion point. If necessary, it shifts existing sorted elements to make space before inserting the current element at its rightful position, repeating this process for each element until the entire list is sorted.[check geeksforgeeks for a visual illustration](https://www.geeksforgeeks.org/insertion-sort/).
   3. **selection sort** -> it starts from the leftmost unsorted element in the unsorted list and iterates through the unsorted elements and selects the smallest element in the rightmost part of the unsorted list and swaps it with that leftmost unsorted element.This process is repeated until the entire list is sorted.[check geeksforgeeks for a visual illustration](https://www.geeksforgeeks.org/selection-sort/).
   4. **merge sort** -> is an efficient, general purpose sorting algorithm which divides the input list into halves recursively, sorts each half recursively and them merge the sorted halves. Most implementations produce a ***stable sort***. Its a divide and conquer algorithm.
   5. **quick sort** -> 
   6. **heap sort** -> it is similar to selection sort but its worse time complexity is O(n log n) which is better than O(n^2) time complexity for selection sort. You ***first heapify*** the list, then you ***swap the first element*** at index 0 with the last element at index n - 1(where n is the current heap size). After swap, the last element of the list is in the correct spot but invalidates the heap. Thus the ***second step is to sift the root element down*** until it land in its correct position excluding then last element of the list from the heap since you no longer consider it as part of the heap but of the sorted list. Then you repeat the process of swapping and sifting down incrementing the number of elements to be excluded by 1 each time you do swap + sifting down (since those elements will have already been sorted) until you reach a heap of size 1, in which the list will be fully sorted.
**B. Non_comparison based sorting algorithms:**
   1. **radix sort** ->
   2. **counting sort** ->
   3. **bucket sort** ->

#### key points:
1.  O(n²) algorithms often have a terrible reputation. Still, some of these algorithms
have some redeeming qualities. Insertion sort can sort in O(n) time if the
collection is already in sorted order and gradually scales down to O(n²) the more
unsorted the collection is.
2. Insertion sort is one of the best sorts in situations where you know ahead of time
that your data is already mostly sorted.