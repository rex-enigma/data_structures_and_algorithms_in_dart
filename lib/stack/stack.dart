// a stack is a LIFO, last-in-first-out, data structure.
// common operation are push and pop method which have O(1) time complexity.
// a stack can be implemented with a list(array) or a linked list, here we use list to implement it.
class Stack<E> {
  final List<E> _storage;

  Stack() : _storage = <E>[];
  Stack.fromIterable(Iterable<E> elements) : _storage = elements.toList();

  /// add an element at the top of a stack
  void push(E element) => _storage.add(element);

  /// remove and return the top element from the stack
  E? pop() {
    if (_storage.isNotEmpty) {
      return _storage.removeLast();
    }
    return null;
  }

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  /// return a duplicate of the top element in the stack
  E? peek() {
    try {
      return _storage.last;
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return '---Top---\n'
        '${_storage.reversed.join('\n')}'
        '\n---Bottom---';
  }
}
