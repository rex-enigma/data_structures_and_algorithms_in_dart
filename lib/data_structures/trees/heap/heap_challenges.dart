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
// Ex. [21, 10, 18, 5, 3, 100, 1]

/* 
Tree representation of the unsorted list.
the left most value after each node value represent the index of that node value in a list
                        (21)0
                       /     \
                  (10)1     (18)2
                  /  \     /     \
                (5)3 (3)4 (100)5  (1)6


You can build a min heap from the given unsorted list by sifting down only non-leaf values,
starting from the last non-leaf value moving toward the first non-leaf value.

  Min-heap construction

  You start with 18 since its the last non-leaf value and you sift it down( 
  You first compare and check which of its children is the smallest, then you 
  compare the smallest child with 18 and swap 18 with that smallest child only if that child is smaller than 18.)

                        (21)0
                       /     \
                  (10)1     (18)2
                  /  \     /     \
                (5)3 (3)4 (100)5  (1)6

  1 is smaller than 100 and 1 is also smaller than 18, so you swap 18 with 1

                        (21)0
                      /     \
                  (10)1     (1)2 <--- swapped with 18
                  /  \     /    \
                (5)3 (3)4 (100)5 (18)6 

  You move to the 10 which is the second non-leaf value and you sift it down to(
  You first compare and check which of its children is the smallest, then you 
  compare the smallest child with 10 and swap 10 with that smallest child only if that child is smaller than 10.)

                        (21)0
                       /     \
                  (10)1     (1)2
                  /  \     /    \
                (5)3 (3)4 (100)5 (18)6 

  3 is smaller than 5 and 3 is also smaller than 10, so you swap 10 with 3.

                        (21)0
                       /     \
swapped with 10---> (3)1     (1)2
                  /   \     /    \
                (5)3 (10)4 (100)5 (18)6 

  You move to 21 which is the first non-leaf value and you sift it down to(
  You first compare and check which of its children is the smallest, then you 
  compare the smallest child with 21 and swap 10 with that smallest child only if that child is smaller than 21.)

                        (21)0
                       /     \
                   (3)1      (1)2
                  /   \     /    \
                (5)3 (10)4 (100)5 (18)6 

  1 is smaller than 3 and 1 is also smaller than 21, so you swap 21 with 1.

                         (1)0 <---- swapped with 21
                       /     \
                   (3)1      (21)2
                  /   \     /    \
                (5)3 (10)4 (100)5 (18)6 

  you sift 21 farther down

                         (1)0
                       /     \
                   (3)1      (18)2
                  /   \     /    \
                (5)3 (10)4 (100)5 (21)6  <---- swapped with 18

Your min-heap is now constructed and takes the form: [1, 3, 18, 5, 10, 100, 21]

*/

// challenge 3: combine two heaps
// write a method that combines two heaps.

// standalone function
Heap<T> mergeHeaps<T extends Comparable<dynamic>>({required Heap<T> heap1, required Heap<T> heap2, Priority priority = Priority.max}) {
  var heap1Elements = heap1.elements;
  var heap2Elements = heap2.elements;
  var combinedHeapElements = [...heap1Elements, ...heap2Elements];
  return Heap<T>(elements: combinedHeapElements, priority: priority);
}

// adding merge functionality in a heap through extension
extension Merge<T extends Comparable<dynamic>> on Heap<T> {
  void merge(List<T> list) {
    elements.addAll(list);
    buildHeap();
  }
}
