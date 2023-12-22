import 'package:dart_data_structure_and_algorithm/queue/queue.dart';

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  // average case time complexity: O(n) | worse case time complexity: O(n)
  /// remove and return the element at the front of the queue.
  E? dequeue() => isEmpty ? null : _list.removeAt(0);

  @override
  // average case time complexity: O(1) | worse case time complexity: O(n)
  /// insert an element at the back of the queue. Return true when operation is successful.
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// return the element at the front of the queue without removing it.
  E? peek() => isEmpty ? null : _list.first;

  @override
  String toString() {
    return _list.toString();
  }
}
