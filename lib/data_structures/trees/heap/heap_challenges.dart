import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap.dart';

// challenge 1: find the nth smallest integer
// write a function that find the nth smallest integer in an unsorted list.
// For example, given the following list:
/*
final integers = [3, 10, 18, 5, 21, 100]
if n = 3, the result should be 10 
*/

//nb: there are many ways to solve for nth smallest integer in an unsorted list, but here i will use a min heap
//    since the challenge revolves around heap tree data structure.

/// return the nth smallest integer in [integers] unsorted list.
int? nthSmallestValue(int n, List<int> integers) {
  Heap<int> minHeap = Heap(elements: [...integers], priority: Priority.min);
  int? nthSmallest;
  for (var i = 0; i < n; i++) {
    nthSmallest = minHeap.remove()!;
  }
  return nthSmallest;
}

// books solution for challenge 1
// its the same as my solution.



// challenge 2: step-by-sep Diagram
// given the following unsorted list, visually construct a min-heap. Provide a step by step diagram on how the
// min-heap is formed.