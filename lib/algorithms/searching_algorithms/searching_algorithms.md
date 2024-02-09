 - Search algorithm is an algorithm designed to solve a search problem. Search algorithms work to retrieve information stored within particular data structure, or calculated in the search space of a problem domain, with either discrete or continuous values. 
  
 - The appropriate search algorithm to use often depends on the data structure being searched, and may also include prior knowledge about the data. Search algorithms can be made faster or more efficient by specially constructed database structures, such as search trees, hash maps, and database indexes.

- **Search algorithms can be classified based on their mechanism of searching into three types**:
    1. **Linear search algorithm** -> checks every record for the one associated with a target element in a linear fashion.
    2. **Binary search algorithm** -> aka half-interval, finds the position(index) of a target element within a **sorted** List. It does this by comparing the target element to the middle element of the list, if they are not equal the half in which the target cannot lie is eliminated and the search continues on the remaining half, again taking the middle element to compare to the target element, and repeating this until the target element is found and its position / index is returned, if not found -1 is returned.
    3. **Hashing** -> directly maps elements to records based on hash function.

#### List of search algorithms:
1. **Linear search** -> it iterates through each element in a unsorted list, one by one comparing it to the target element, returning the index of that element if it exist or -1 if it doesn't. 
   - Best case time complexity is ***O(1)***, when the target element is the first element in the unsorted list. 
   - Average case time complexity is ***O(n/2)***, when the target element is in the middle of the unsorted list. 
   - Worse case time complexity is ***O(n)***, when the targe element is at end of the unsorted list or is not in the unsorted list.
2. **Binary search** (currently focusing on this) -> it finds the position(index) of a target element within a **sorted List**. It does this by comparing the target element to the middle element of the sorted list, if they are not equal the half in which the target cannot lie is eliminated and the search continues on the remaining half, again taking the middle element to compare to the target element, and repeating this until the target element is found and its position / index is returned, if not found -1 is returned.
   -  Best case time complexity is ***O(1)***, when the target element is the middle element of the sorted list in the very first search. 
   -  Average case time complexity is ***O(log n)***, when the target element is the middle element of the sorted list. 
   -  Worse case time complexity is ***O(n)***, when the target element is not in the sorted list.
3. **Sentinel search** -> is a variant of linear search that simplifies comparisons by adding a sentinel element with a predefined value at the end of the unsorted list. It iterates through the unsorted list comparing each element to the target value, and the sentinel value acts as flag indicating the end of the list without requiring an additional check.
4. **Ternary search** -> Works well for data with a continuous and monotonic (increasing or decreasing) function relationship between the index and value. It divides the search space into three parts at each iteration instead of two like binary search, narrowing down the possible location of the target value more quickly.
5. **Jump search** -> is a variant of the linear search algorithm that attempts to reduce the number of comparisons by jumping ahead certain fixed steps. 
6. **Interpolation search** -> is a variant of the linear search algorithm that uses the fact that the list is sorted to make more informed guesses about where the target element might be located.
7. **Fibonacci search** -> is a variant of binary search algorithm that uses the fibonacci sequence to determine the jump size.
8. **Exponential search** -> it works well for unbounded and unknown length data. It first tires to find the minimum bound for the target element using repeated doubling and then uses binary search within the found bound.
9.  **Ubiquitous binary search** ->
10. **Meta binary | one-sided binary search** ->

