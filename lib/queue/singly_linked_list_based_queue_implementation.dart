import 'package:dart_data_structure_and_algorithm/singly_linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/queue/queue.dart';

class QueueSinglyLinkedList<E> implements Queue<E> {
  final _linkedList = SinglyLinkedList<E>();

  @override
  bool get isEmpty => _linkedList.isEmpty;

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// remove and return the element at the front of the queue.
  E? dequeue() => _linkedList.pop();

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// insert an element at the back of the queue. Return true when operation is successful.
  bool enqueue(E element) {
    _linkedList.append(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// return a reference of the element at the front of the queue without removing it.
  E? peek() => _linkedList.head?.value;

  @override
  String toString() => _linkedList.toString();
}
