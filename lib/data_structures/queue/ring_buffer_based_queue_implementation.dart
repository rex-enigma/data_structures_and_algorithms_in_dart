import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/ring_buffer/ring_buffer.dart';

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer(length);
  final RingBuffer<E> _ringBuffer;

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  bool enqueue(E element) {
    if (_ringBuffer.isFull) return false;
    _ringBuffer.write(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? dequeue() => _ringBuffer.read();

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}
