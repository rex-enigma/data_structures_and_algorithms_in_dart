import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';

/* 
Using two lists(rightList and leftList) to implement a queue, leveraging list functions: add,removeLast and reverse.
The right List is used to enqueue elements.
The left List is used to dequeue elements. 

The idea behind using two Lists is simple. Whenever you enqueue an element, it
goes in the right List.

When you need to dequeue an element, you reverse the right List, place it in the
left List, and remove the last element.

*/

class QueueDoubleList<E> implements Queue<E> {
  final _leftList = <E>[];
  final _rightList = <E>[];

  @override
  bool get isEmpty => _leftList.isEmpty && _rightList.isEmpty;

  @override
  // average case time complexity: O(1) | worse case time complexity: O(n)
  bool enqueue(E element) {
    _rightList.add(element);
    return true;
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(n)
  E? dequeue() {
    // if the left list is empty, set it as the reverse of the right list
    if (_leftList.isEmpty) {
      _leftList.addAll(_rightList.reversed);
      _rightList.clear();
    }
    // if left list is empty at this point again, it means the right list was empty, hence return null since both right and left are empty.
    if (_leftList.isEmpty) return null;

    return _leftList.removeLast();
  }

  @override
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? peek() {
    if (_leftList.isNotEmpty) return _leftList.last;
    if (_rightList.isNotEmpty) return _rightList.first;
    return null;
  }

  @override
  String toString() {
    return [..._leftList.reversed, ..._rightList].toString();
  }
}
