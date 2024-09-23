import 'package:dart_data_structure_and_algorithm/data_structures/deque/deque_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/deque/singly_linked_list_based_deque_implementation.dart';
import 'package:test/test.dart';

void main() {
  final dequeSinglyLinkedListFrontOperations = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListFrontOperations.enqueue(3, Direction.front);
  dequeSinglyLinkedListFrontOperations.enqueue(2, Direction.front);
  dequeSinglyLinkedListFrontOperations.enqueue(1, Direction.front);
  test('enqueues in the front and dequeues from the front', () {
    expect(dequeSinglyLinkedListFrontOperations.dequeue(Direction.front), 1);
    expect(dequeSinglyLinkedListFrontOperations.dequeue(Direction.front), 2);
    expect(dequeSinglyLinkedListFrontOperations.dequeue(Direction.front), 3);
  });

  final dequeSinglyLinkedListBackOperations = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListBackOperations.enqueue(1, Direction.back);
  dequeSinglyLinkedListBackOperations.enqueue(2, Direction.back);
  dequeSinglyLinkedListBackOperations.enqueue(3, Direction.back);
  test('enqueues in the back and dequeues from the back', () {
    expect(dequeSinglyLinkedListBackOperations.dequeue(Direction.back), 3);
    expect(dequeSinglyLinkedListBackOperations.dequeue(Direction.back), 2);
    expect(dequeSinglyLinkedListBackOperations.dequeue(Direction.back), 1);
  });

  final dequeSinglyLinkedListPeekOperation = DequeSinglyLinkedList<int>();
  dequeSinglyLinkedListPeekOperation.enqueue(1, Direction.front);
  dequeSinglyLinkedListPeekOperation.enqueue(2, Direction.back);
  dequeSinglyLinkedListPeekOperation.enqueue(3, Direction.front);
  test('peek() in the front and peek() in the back', () {
    expect(dequeSinglyLinkedListPeekOperation.peek(Direction.front), 3);
    expect(dequeSinglyLinkedListPeekOperation.peek(Direction.back), 2);
    expect(dequeSinglyLinkedListPeekOperation.toString(), '3 -> 1 -> 2');
  });
}
