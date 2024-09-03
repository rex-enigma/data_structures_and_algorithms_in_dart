import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/ring_buffer/list_based_ring_buffer_implementation.dart';

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBufferList(length);
  final RingBufferList<E> _ringBuffer;

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  // average case time complexity: O(1) | worse case time complexity: O(1)
  /// inserts an element at the back of the queue. Return true when operation is successful.
  /// returns false when the queue is full.
  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) return false;
    _ringBuffer.write(element);
    return true;
  }

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  E? dequeue() => _ringBuffer.read();

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  E? peek() => _ringBuffer.peek();

  @override
  String toString() => _ringBuffer.toString();
}
