import 'package:dart_data_structure_and_algorithm/data_structures/linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';

class QueueSinglyLinkedList<E> implements Queue<E> {
  final _singlyLinkedList = SinglyLinkedList<E>();
  QueueSinglyLinkedList();
  QueueSinglyLinkedList.from(Iterable<E> iterable) {
    iterable.forEach(enqueue);
  }

  @override
  bool get isEmpty => _singlyLinkedList.isEmpty;

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? dequeue() => _singlyLinkedList.pop();

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  bool enqueue(E element) {
    _singlyLinkedList.append(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? get peek => _singlyLinkedList.head?.value;

  @override
  String toString() => _singlyLinkedList.toString();
}
