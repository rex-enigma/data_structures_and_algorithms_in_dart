import 'package:dart_data_structure_and_algorithm/deque/deque.dart';
import 'package:dart_data_structure_and_algorithm/linked_list/singly_linked_list.dart';

class DequeSinglyLinkedList<T> implements Deque<T> {
  final _singlyLinkedList = SinglyLinkedList<T>();
  @override
  bool get isEmpty => _singlyLinkedList.isEmpty;

  @override
  // average case time complexity: O(1) | worse case time complexity: O(n)
  T? dequeue(Direction from) {
    if (from == Direction.front) {
      return _singlyLinkedList.pop();
    } else {
      return _singlyLinkedList.removeLast();
    }
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  bool enqueue(T element, Direction from) {
    if (from == Direction.front) {
      _singlyLinkedList.push(element);
      return true;
    } else {
      _singlyLinkedList.append(element);
      return true;
    }
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  T? peek(Direction from) {
    return switch (from) {
      Direction.front => _singlyLinkedList.head?.value,
      Direction.back => _singlyLinkedList.tail?.value,
    };
  }

  @override
  String toString() {
    return _singlyLinkedList.toString();
  }
}
