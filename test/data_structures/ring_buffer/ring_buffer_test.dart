import 'package:dart_data_structure_and_algorithm/data_structures/ring_buffer/list_based_ring_buffer_implementation.dart';
import 'package:test/test.dart';

void main() {
  final ringBuffer = RingBufferList(5);
  ringBuffer.write(0);
  ringBuffer.write(0);
  ringBuffer.write(0);
  ringBuffer.write(1);
  ringBuffer.write(2);

  ringBuffer.read();
  ringBuffer.read();
  ringBuffer.read();

  ringBuffer.write(3);
  ringBuffer.write(4);
  test('check if toString in ringBuffer returns the correct available values that can only be read ', () {
    expect(ringBuffer.toString(), '[1, 2, 3, 4]');
  });
}
