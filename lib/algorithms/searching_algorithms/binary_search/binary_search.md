#### Definition:
- Binary search is a search algorithm that finds the position (index) of a target value within a **sorted List**. It does this by comparing the target value to the middle element of the sorted list, if they are not equal the half in which the target cannot lie is eliminated and the search continues on the remaining half, again taking the middle element to compare to the target value, and repeating this until the target value is found and its position / index is returned, if not found -1 is returned.

<!-- - if there are duplicate values in the list and the target value is one of those duplicate values, the ***first*** position / index of that target value in the sorted list is returned. -->

#### Two conditions must be met for binary search to work:
1. The collection **must** be **sorted**.
2. The underlying collection **must** be able to perform random index lookup in constant time. In dart **List** satisfies this condition as long as its elements are sorted (other linear data structures such as linked-list can't work because of non-random index lookup ability).

**Note:**
- Binary search algorithm is only applicable on a linear, sorted, random index lookup based data structure.

#### applications of binary search:
1. Binary search can be used to find the index of a particular element in an ordered list.
2. Binary search can be used as a building block for more complex algorithms used in machine learning, such as algorithms for training neutral networks or finding the optimal hyper-parameters for a model.
3. Binary search can be used for searching in computer graphics such as algorithms for ray tracing or textual mapping
4. It can also be used for searching in database.

#### key points:
1. Binary search is only a valid algorithm in sorted collections.
2. Some times it may be beneficial to sort a collection to leverage the binary search capability for looking up elements.
3. The *indexOf* method in List used a linear search with O(n) time complexity. Binary search has O(log n) time complexity, which scales much better for large data sets if you are doing repeated lookups.