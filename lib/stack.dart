// push and pop method have O(1) time complexity
class Stack<E> {
  final List<E> _storage;

  Stack() : _storage = <E>[];
  Stack.fromIterable(Iterable<E> elements) : _storage = elements.toList();

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

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
