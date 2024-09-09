abstract class RingBuffer<E> {
  /// check if ring buffer full.
  bool get isFull;

  /// checks if ring buffer is empty.
  bool get isEmpty;

  /// Returns a copy(if the data is primitive eg int,double,float,string) or reference of the data which the [readIndex] is pointing to without advancing the [readIndex] pointer one step forward.
  /// Return null if the ring buffer is empty.
  E? peek();

  /// Writes data the current [writeIndex] in the list and advances the [writeIndex] pointer one step forward.
  /// Throws an Exception when trying to write an element when the ring buffer is full.
  void write(E element);

  /// Reads data at the current [readIndex] in the list and advances the [readIndex] pointer one step forward.
  /// Return null if the ring buffer is empty.
  E? read();
}
