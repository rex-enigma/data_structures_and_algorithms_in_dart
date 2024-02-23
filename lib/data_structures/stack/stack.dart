abstract class Stack<T> {
  /// add an element at the top of a stack
  void push(T element);

  /// remove and return the top element from the stack. Return null if the stack is empty
  T? pop();

  /// return the top element in the stack. Return null if the stack is empty
  T? peek();
}
