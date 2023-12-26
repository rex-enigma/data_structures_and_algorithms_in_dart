import 'package:dart_data_structure_and_algorithm/linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/queue/queue.dart';

class QueueSinglyLinkedList<E> implements Queue<E> {
  final _singlyLinkedList = SinglyLinkedList<E>();

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
  E? peek() => _singlyLinkedList.head?.value;

  @override
  String toString() => _singlyLinkedList.toString();
}
