import 'package:dart_data_structure_and_algorithm/linked_list/linked_list.dart';
import 'package:dart_data_structure_and_algorithm/queue/queue.dart';

class QueueSinglyLinkedList<E> implements Queue<E> {
  final linkedList = LinkedList<E>();

  @override
  bool get isEmpty => linkedList.isEmpty;

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// remove and return the element at the front of the queue.
  E? dequeue() => linkedList.pop();

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// insert an element at the back of the queue. Return true when operation is successful.
  bool enqueue(E element) {
    linkedList.append(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// return a reference of the element at the front of the queue without removing it.
  E? peek() => isEmpty ? null : linkedList.first;
}
