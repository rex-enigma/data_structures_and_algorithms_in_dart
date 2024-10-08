import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/list_based_heap_implementation.dart';

class PriorityQueueHeap<T extends Comparable<dynamic>> implements Queue<T> {
  late HeapList<T> _heap;
  PriorityQueueHeap({List<T>? elements, Priority priority = Priority.max}) {
    _heap = HeapList<T>(elements: elements, priority: priority);
  }

  /// remove and return the element with the highest priority. Return null if the priority queue is empty
  @override
  T? dequeue() => _heap.remove();

  /// insert an element into priority queue and return true if the operation is successful.
  @override
  bool enqueue(element) {
    _heap.insert(element);
    return true;
  }

  @override
  bool get isEmpty => _heap.isEmpty;

  //return a reference of the element with the highest priority without removing it. Return null is the priority queue is empty.
  @override
  T? peek() => _heap.peek();
}
