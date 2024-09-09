import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue_interface.dart';

class QueueSingleList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool get isEmpty => _list.isEmpty;

  // average case time complexity: O(n) | worse case time complexity: O(n)
  @override
  E? dequeue() => isEmpty ? null : _list.removeAt(0);

  // average case time complexity: O(1) | worse case time complexity: O(n)
  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  E? peek() => isEmpty ? null : _list.first;

  @override
  String toString() {
    return _list.toString();
  }
}
