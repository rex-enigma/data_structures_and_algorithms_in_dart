abstract class RingBuffer<E> {
  /// Writes data the current [writeIndex] in the list and advances the [writeIndex] pointer one step forward.
  /// Throws an Exception when trying to write an element when the ring buffer is full.
  void write(E element);

  /// Reads data at the current [readIndex] in the list and advances the [readIndex] pointer one step forward.
  /// Return null if the ring buffer is empty.
  E? read();
}
