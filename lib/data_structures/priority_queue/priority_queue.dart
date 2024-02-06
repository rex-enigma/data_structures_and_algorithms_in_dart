import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap.dart';

export '../trees/heap/heap.dart' show Priority;

class PriorityQueue<T extends Comparable<dynamic>> implements Queue<T> {
  late Heap<T> _heap;
  PriorityQueue({List<T>? elements, Priority priority = Priority.max}) {
    _heap = Heap<T>(elements: elements, priority: priority);
  }

  @override
  T? dequeue() => _heap.remove();

  @override
  bool enqueue(element) {
    _heap.insert(element);
    return true;
  }

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  T? peek() => _heap.peek;
}
