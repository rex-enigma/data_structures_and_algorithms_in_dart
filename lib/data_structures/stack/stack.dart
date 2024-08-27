abstract class Stack<T> {
  /// add an element at the top of a stack.
  void push(T element);

  /// remove and return the top element from the stack. Return null if the stack is empty.
  T? pop();

  /// return a reference of the element at the top of the stack without removing it. Return null if the stack is empty.
  T? peek();
}
