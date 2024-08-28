abstract class Stack<T> {
  /// adds an element at the top of a stack.
  void push(T element);

  /// removes and returns the top element from the stack. Returns null if the stack is empty.
  T? pop();

  /// returns a reference of the element at the top of the stack without removing it. Returns null if the stack is empty.
  T? peek();
}
