class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);

  final List<E?> _list;
  int _writeIndex = 0;
  int _readIndex = 0;

  // represents the number of elements that can be read
  int _size = 0;

  bool get isFull => _size == _list.length;
  bool get isEmpty => _size == 0;

  /// writes data the current [writeIndex] in the list and advances the [writeIndex] pointer one step forward.
  /// Throws an Exception when trying to write an element when the ring buffer is full.
  void write(E element) {
    if (isFull) throw Exception('Buffer is full');
    _list[_writeIndex] = element;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  int _advance(int index) {
    return (index == _list.length - 1) ? 0 : index + 1;
  }

  /// Reads data at the current [readIndex] in the list and advances the [readIndex] pointer one step forward
  E? read() {
    if (isEmpty) return null;
    final element = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;
    return element;
  }

  /// Returns a copy(if the data is primitive eg int,double,float,string) or reference of the data which the [readIndex] is pointing to without advancing the [readIndex] pointer one step forward.
  /// Return null if the ring buffer is empty.
  E? get peek => isEmpty ? null : _list[_readIndex];

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');

    for (var i = 0; i < _size; i++) {
      final index = (_readIndex + i) % _list.length;
      if (index != _readIndex) text.write(', ');
      text.write(_list[index]);
    }

    text.write(']');
    return text.toString();
  }
}
