import 'package:dart_data_structure_and_algorithm/queue/queue.dart';

class QueueSingleList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  // average case time complexity: O(n) | worse case time complexity: O(n)
  E? dequeue() => isEmpty ? null : _list.removeAt(0);

  @override
  // average case time complexity: O(1) | worse case time complexity: O(n)
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? peek() => isEmpty ? null : _list.first;

  @override
  String toString() {
    return _list.toString();
  }
}
