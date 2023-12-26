enum Direction {
  front,
  back;
}

abstract class Deque<T> {
  /// check if the deque is empty.
  bool get isEmpty;

  /// insert an element at the front or back of the deque. Return true when operation is successful.
  bool enqueue(T element, Direction to);

  /// remove and return the element at the front or back of the deque.
  T? dequeue(Direction from);

  /// return an element at the front or back of the deque without removing it.
  T? peek(Direction from);
}
