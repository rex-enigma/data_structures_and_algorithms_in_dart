import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/list_based_heap_implementation.dart';
import 'package:test/test.dart';

void main() {
  final heapInsertion = HeapList<int>();
  heapInsertion.insert(8);
  heapInsertion.insert(6);
  heapInsertion.insert(5);
  heapInsertion.insert(4);
  heapInsertion.insert(3);
  heapInsertion.insert(2);
  heapInsertion.insert(1);
  test('inserting values in heapInsertion tree', () {
    expect(heapInsertion.toString(), '[8, 6, 5, 4, 3, 2, 1]');
  });

  // heapInsertion.insert(7);
  // test('insert a value in heapInsertion tree', () {
  //   expect(heapInsertion.toString(), '[8, 7, 5, 6, 3, 2, 1, 4]');
  // });

  final maxHeapRemoval = HeapList<int>();
  maxHeapRemoval.insert(10);
  maxHeapRemoval.insert(8);
  maxHeapRemoval.insert(5);
  maxHeapRemoval.insert(4);
  maxHeapRemoval.insert(6);
  maxHeapRemoval.insert(2);
  maxHeapRemoval.insert(1);
  maxHeapRemoval.insert(3);
  test('remove a value from heapRemoval tree', () {
    expect(maxHeapRemoval.toString(), '[10, 8, 5, 4, 6, 2, 1, 3]');
    expect(maxHeapRemoval.remove(), 10);
    expect(maxHeapRemoval.toString(), '[8, 6, 5, 4, 3, 2, 1]');
  });

  final maxHeapRemoveAt = HeapList<int>();
  maxHeapRemoveAt.insert(10);
  maxHeapRemoveAt.insert(7); // remove this
  maxHeapRemoveAt.insert(2);
  maxHeapRemoveAt.insert(5);
  maxHeapRemoveAt.insert(1);
  test('remove a value at a given index from heapRemoveAt tree', () {
    expect(maxHeapRemoveAt.removeAt(1), 7);
    expect(maxHeapRemoveAt.toString(), '[10, 5, 2, 1]');
  });

  final maxHeapSearch = HeapList<int>();
  maxHeapSearch.insert(10);
  maxHeapSearch.insert(7);
  maxHeapSearch.insert(2);
  maxHeapSearch.insert(5);
  maxHeapSearch.insert(1);
  test('search if the given value exist in heapSearch tree, return index of the value if it exist otherwise return -1', () {
    expect(maxHeapSearch.indexOf(7), 1);
  });

  test('convert an arbitrary list into a max heap tree', () {
    expect(HeapList<int>(elements: [1, 12, 3, 4, 1, 6, 8, 7]).toString(), '[12, 7, 8, 4, 1, 6, 3, 1]');
  });
  test('convert an arbitrary list into a min heap tree', () {
    expect(HeapList<int>(elements: [1, 12, 3, 4, 1, 6, 8, 7], priority: Priority.min).toString(), '[1, 1, 3, 4, 12, 6, 8, 7]');
  });

  test('heap challenge 1: find the 3th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(3, [3, 10, 18, 5, 21, 100]), 10);
  });
  test('heap challenge 1: find the 4th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(4, [3, 10, 18, 5, 21, 100]), 18);
  });
  test('heap challenge 1: find the 5th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(5, [3, 10, 18, 5, 21, 100]), 21);
  });
  test('heap challenge 1: find the 1th smallest integer value in an unsorted list', () {
    expect(nthSmallestValue(1, [3, 10, 18, 5, 21, 100]), 3);
  });

  test('heap challenge 4: check if the given list is a min heap', () {
    expect(isMinHeap([1, 1, 3, 4, 12, 6, 8, 7]), true);
    expect(isMinHeap([3, 10, 18, 5, 21, 100]), false);
  });
}
