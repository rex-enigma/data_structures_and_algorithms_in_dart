abstract class Queue<E> {
  /// inserts an element at the back of the queue. Return true when operation is successful.
  bool enqueue(E element);

  /// remove and returns the element at the front of the queue. Return null when queue is empty
  E? dequeue();

  /// checks if the queue is empty.
  bool get isEmpty;

  /// returns a copy(if the data is primitive eg int,double,float,string)
  /// or a reference of the element at the front of the queue without removing it.
  /// Return null if the queue is empty.
  E? peek();
}
