import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/list_based_heap_implementation.dart';

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
  HeapList<int> minHeap = HeapList(elements: [...integers], priority: Priority.min);
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
HeapList mergeHeaps({required HeapList heap1, required HeapList heap2, Priority priority = Priority.max}) {
  var heap1Elements = heap1.elements;
  var heap2Elements = heap2.elements;
  var combinedHeapElements = [...heap1Elements, ...heap2Elements];
  return HeapList(elements: combinedHeapElements, priority: priority);
}

// adding merge functionality in a heap through extension
extension Merge<T extends Comparable<dynamic>> on HeapList<T> {
  void merge(List<T> list) {
    elements.addAll(list);
    buildHeap();
  }
}

// book's solution for challenge 2 is the same as mine but has some issues:
// 1. merge is not add to heap class through extension
// 2. if merge is the extension method, then it is violating the extension condition by trying to access
// private method (_buildHeap).

// void merge(List<E> list) {
// elements.addAll(list);
// _buildHeap();
// }

//challenge 4: is its min-heap
// write a function to check if a given list is a min-heap.

// a min heap is a type of heap tree in which every parent value must be less than or equal to its
// left and right child value. isMinHeap should check every parent value to see if it satisfy that condition
bool isMinHeap<T extends Comparable<dynamic>>(List<T> list) {
  if (list.isEmpty) return true;
  // last parentValues /  non-leaf values.
  var start = (list.length ~/ 2) - 1;
  // you check only the parent values if they are lower than than there children,
  // so you starting with the last parent value iterating backwards towards the first parent value.
  for (var i = start; i >= 0; i--) {
    var parentValue = list[i];
    var leftChildIndex = (2 * i) + 1;
    var rightChildIndex = (2 * i) + 2;

    // return false if the parent is greater than it's leftChild
    if (parentValue.compareTo(list[leftChildIndex]) > 0) {
      return false;
    }

    // check if the rightChildIndex is within the bound of [list] and if its within the bound, check if
    // the parent is greater than its rightChild, return false if it is.
    if (rightChildIndex < list.length && parentValue.compareTo(list[rightChildIndex]) > 0) {
      return false;
    }
  }
  return true;
}

// book's solution for challenge 4:
// bool isMinHeap<E extends Comparable<dynamic>>(List<E> elements) {

//   if (elements.isEmpty) return true;

//   final start = elements.length ~/ 2 - 1;
//   for (var i = start; i >= 0; i--) {

//     final left = 2 * i + 1;
//     final right = 2 * i + 2;

//     if (elements[left].compareTo(elements[i]) < 0) {
//       return false;
//     }

//     if (right < elements.length && elements[right].compareTo(elements[i]) < 0) {
//       return false;
//     }
//   }

//   return true;
// }
