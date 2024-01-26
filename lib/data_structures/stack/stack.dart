abstract class Stack<T> {
  /// add an element at the top of a stack
  void push(T element);

  /// remove and return the top element from the stack
  T? pop();

  /// return the top element in the stack
  T? peek();
}
