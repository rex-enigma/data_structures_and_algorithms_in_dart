import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/comparison_based_sorting%20algorithms/heap_sort/heap_sort.dart';

// challenge 1: Theory
// When performing heap sort in ascending order, which of these starting lists requires the fewest comparison
// assume the implementation used max-heap.

// [1, 2, 3, 4, 5] and
// [5, 4, 3, 2, 1]

// [5, 4, 3, 2, 1] will require fewest comparison when starting the heap sort since its already a max-heap

// books solutions is the same as mine.

// challenge 2: Descending order
// The current implementation of heap sort in heap_sort/heap_sort.dart sort the elements in ascending order. How
// would you sort in descending order.

// 1st solution
/// heap sort in descending order
extension HeapSortDescending<T extends Comparable<dynamic>> on List<T> {
  /// will sort this list is descending order.
  void heapSortInPlaceDescending() {
    heapSortInPlace();
    reversed.toList();
  }
}

// 2nd solution

// you can also reimplement the first 2 if statements in _siftDown method under the HeapSort extension in
// heap_sort/heap_sort.dart file and change the direction of the comparison operator '>'
// for the 1st if: this[leftIndex].compareTo(this[chosenIndex]) > 0, you change it to: this[left].compareTo(this[chosen]) < 0
// for the 2nd if: this[rightIndex].compareTo(this[chosenIndex]) > 0, you change it to: this[rightIndex].compareTo(this[chosenIndex]) < 0 

// book's solution for challenge 2 uses 'reversed' list method to reverse the list and also indicate change the
// comparison '>' operator as stated on my 2nd solution.
