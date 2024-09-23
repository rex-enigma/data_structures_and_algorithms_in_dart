import 'package:dart_data_structure_and_algorithm/data_structures/queue/double_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/ring_buffer_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/single_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/singly_linked_list_based_queue_implementation.dart';
import 'package:test/test.dart';

void main() {
  final queueSingleLinkedList = QueueSinglyLinkedList();
  queueSingleLinkedList.enqueue('Ray');
  queueSingleLinkedList.enqueue('Brian');
  queueSingleLinkedList.enqueue('Eric');
  test('queue implementation based on singleLinkedList: test queue methods', () {
    expect(queueSingleLinkedList.toString(), 'Ray -> Brian -> Eric');
    expect(queueSingleLinkedList.dequeue(), 'Ray');
    expect(queueSingleLinkedList.peek(), 'Brian');
  });

  final queueRingBuffer = QueueRingBuffer<String>(10);
  queueRingBuffer.enqueue('Ray');
  queueRingBuffer.enqueue('Brian');
  queueRingBuffer.enqueue('Eric');
  test('queue implementation based on ringBuffer: test queue methods', () {
    expect(queueRingBuffer.toString(), '[Ray, Brian, Eric]');
    expect(queueRingBuffer.dequeue(), 'Ray');
    expect(queueRingBuffer.peek(), 'Brian');
  });

  final queueSingleList = QueueSingleList();
  queueSingleList.enqueue('Ray');
  queueSingleList.enqueue('Brian');
  queueSingleList.enqueue('Eric');
  test('queue implementation based on single list: test queue methods', () {
    expect(queueRingBuffer.toString(), '[Ray, Brian, Eric]');
    expect(queueRingBuffer.dequeue(), 'Ray');
    expect(queueRingBuffer.peek(), 'Brian');
  });

  final queueDoubleList = QueueDoubleList<String>();
  queueDoubleList.enqueue("Ray");
  queueDoubleList.enqueue("Brian");
  queueDoubleList.enqueue("Eric");
  test('queue implementation based on two lists: test queue methods', () {
    expect(queueDoubleList.toString(), '[Ray, Brian, Eric]');
    expect(queueDoubleList.dequeue(), 'Ray');
    expect(queueDoubleList.peek(), 'Brian');
  });

  final boardGameManager = QueueRingBuffer<dynamic>(3);
  boardGameManager.enqueue("Ray");
  boardGameManager.enqueue("Brian");
  boardGameManager.enqueue("Eric");
  test('queue based challenge 1: check if nextPlayer method can return the correct next player', () {
    expect(boardGameManager.nextPlayer(), "Ray");
    expect(boardGameManager.nextPlayer(), 'Brian');
    expect(boardGameManager.nextPlayer(), 'Eric');
    expect(boardGameManager.nextPlayer(), "Ray");
    expect(boardGameManager.nextPlayer(), 'Brian');
  });
}
