- Binary search is a search algorithm that finds the position(index) of a target value within a **sorted** List. It does this by comparing the target value to the middle element of the list, if they are not equal the half in which the target cannot lie is eliminated and the search continues on the remaining half, again taking the middle element to compare to the target value, and repeating this until the target value is found and its position / index is returned, if not found -1 is returned.

- if there are duplicate values in the list and the target value is one of those duplicate values, the ***first*** position / index of that target value in the list is returned.

- Two conditions **must** be met for binary search to work:
    1. The collection **must** be **sorted**.
    2. The underlying collection **must** be able to perform random index lookup in constant time. In dart **List** satisfies this condition as long as its elements are sorted(other linear data structures such as linked-list can't work because of non-random index lookup ability).


- Binary search algorithm is only applicable on a linear, sorted, random index lookup based data structure.

#### applications of binary search:

#### key points: