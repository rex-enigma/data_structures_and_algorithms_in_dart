abstract class Queue<E> {
  /// inserts an element at the back of the queue. Return true when operation is successful.
  bool enqueue(E element);

  /// remove and returns the element at the front of the queue. Return null when queue is empty
  E? dequeue();

  /// checks if the queue is empty.
  bool get isEmpty;

  /// returns a reference(or a copy of the element if the element is primitive) of the element at the front of the queue without removing it.
  E? peek();
}
