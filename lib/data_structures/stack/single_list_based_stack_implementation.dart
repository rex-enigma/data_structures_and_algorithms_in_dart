import 'package:dart_data_structure_and_algorithm/data_structures/stack/stack.dart';

class StackList<T> implements Stack<T> {
  final List<T> _storage;

  StackList() : _storage = <T>[];
  StackList.fromIterable(Iterable<T> elements) : _storage = elements.toList();

  @override
  void push(T element) => _storage.add(element);

  @override
  T? pop() {
    if (_storage.isNotEmpty) {
      return _storage.removeLast();
    }
    return null;
  }

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  T? peek() {
    return isEmpty ? null : _storage.last;
  }

  @override
  String toString() {
    return '---Top---\n'
        '${_storage.reversed.join('\n')}'
        '\n---Bottom---';
  }
}
