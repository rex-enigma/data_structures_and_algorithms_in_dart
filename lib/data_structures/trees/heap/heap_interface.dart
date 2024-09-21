// specifies the type of heap.
enum Priority { max, min }

abstract class Heap<T> {
  /// returns a reference of the root value from this heap.
  T? peek();

  /// inserts a value in the heap.
  void insert(T value);

  /// removes and return the root value from the heap.
  T? remove();

  /// removes and return an arbitrary value of the given [index] from the heap.
  T? removeAt(int index);

  /// returns an index of a heap value if its exist otherwise it returns -1.
  int indexOf(T value, {int index = 0});
}
