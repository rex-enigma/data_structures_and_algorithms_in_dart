abstract class Queue<E> {
  /// insert an element at the back of the queue. Return true when operation is successful.
  bool enqueue(E element);

  /// remove and return the element at the front of the queue. Return null when queue is empty
  E? dequeue();

  /// check if the queue is empty.
  bool get isEmpty;

  /// return a reference(or a copy of the element if the element is primitive) of the element at the front of the queue without removing it.
  E? peek();
}
