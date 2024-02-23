// specifies the type of heap
enum Priority { max, min }

class Heap<T extends Comparable<dynamic>> {
  late final List<T> elements;
  Priority priority;
  bool get isEmpty => elements.isEmpty;

  /// The number of values in this heap tree.
  int get size => elements.length;

  /// return a reference of the root value from this heap tree.
  // this root value is actually the first element in [elements] list.
  T? get peek => (isEmpty) ? null : elements.first;

  Heap({List<T>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
    buildHeap();
  }

  // also known as heapify
  void buildHeap() {
    if (isEmpty) return;
    final start = (elements.length ~/ 2) - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(i);
    }
  }

  int _leftChildIndex(int parentIndex) {
    return (2 * parentIndex) + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return (2 * parentIndex) + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  // return true if child represented by value1 has higher priority than 'parent' represented by value2
  bool _firstHasHigherPriority(T value1, T value2) {
    return switch (priority) {
      // in max heap the largest value has higher priority.
      // [value1] is the child value compared with [value2] which is the parent value or a chosen value.
      Priority.max => value1.compareTo(value2) > 0,
      // in min heap the smallest value has higher priority.
      // [value1] is the child value compared with [value2] which is the parent value or a chosen value.
      Priority.min => value1.compareTo(value2) < 0,
    };
  }

  // you want to return the index(indexA or indexB) that represent the value that has higher priority.
  // in most cases indexA represents a child index whose value will be compared with its parent value or
  // a chosen value.
  int _higherPriority(indexA, indexB) {
    // make sure indexA represents a value that exist in the list
    if (indexA >= elements.length) return indexB;
    final value1 = elements[indexA];
    final value2 = elements[indexB];
    final firstHasHigherPriority = _firstHasHigherPriority(value1, value2);
    return firstHasHigherPriority ? indexA : indexB;
  }

  // swap two heap values that are out of order.
  // swap the child value with its parent value, since child value has higher priority than its parent value.
  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  /// add a value to the heap tree.
  // adding an element to a list takes only O(1) while sifting up takes O(log n) so the overall average and worse
  // time complexity for insertion is O(log n).
  void insert(T value) {
    elements.add(value);
    _siftUp(elements.length - 1);
  }

  // move a value up in the heap to restore heap condition / property.(child value takes the place of its parent and parent value takes the place of its child)
  // average and worse case time complexity is O(log n)
  void _siftUp(int index) {
    var childIndex = index;
    var parentIndex = _parentIndex(childIndex);
    // sift up till the value being sifted up becomes the root of the heap tree(the first value in [elements]) or
    // it satisfies the heap property.

    // As long as the value being sifted up has higher priority than its parent, you keep swapping it with the next
    // parent value. Since you're only concerned about priority, this will sift up larger values in a max heap and smaller
    // values in a min heap.
    while (childIndex > 0 && childIndex == _higherPriority(childIndex, parentIndex)) {
      // swap the child value with its parent value as long as the child value has high priority than its parent value.
      _swapValues(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = _parentIndex(childIndex);
    }
  }

  /// remove and return the root value from the heap tree.
  // removing  the last element from a list takes only O(1) while sifting down takes O(log n) so the overall average and worse
  // time complexity for removal is O(log n).
  T? remove() {
    if (isEmpty) return null;
    _swapValues(0, elements.length - 1);
    final value = elements.removeLast();
    _siftDown(0);
    return value;
  }

  // move a value down in the heap to restore heap condition / property.
  // average and worse case time complexity is O(log n)
  void _siftDown(int index) {
    var parentIndex = index;
    while (true) {
      final leftChildIndex = _leftChildIndex(parentIndex);
      final rightChildIndex = _rightChildIndex(parentIndex);
      var chosenIndex = _higherPriority(leftChildIndex, parentIndex);
      chosenIndex = _higherPriority(rightChildIndex, chosenIndex);
      if (chosenIndex == parentIndex) return;
      // swap the parent value with its child value as long as the child value has high priority than its parent value.
      _swapValues(parentIndex, chosenIndex);
      parentIndex = chosenIndex;
    }
  }

  /// remove and return an arbitrary value of the given index from the heap tree
  // the average and worse case time complexity is O(log n).
  T? removeAt(int index) {
    final lastIndex = elements.length - 1;
    if (index < 0 || index > lastIndex) return null;
    if (index == lastIndex) return elements.removeLast();
    _swapValues(index, lastIndex);
    final value = elements.removeLast();
    _siftDown(index);
    _siftUp(index);
    return value;
  }

  /// check if [value exist] in the heap tree. Return its index if it exist otherwise return -1.
  int indexOf(T value, {int index = 0}) {
    // if the index is to large(has gone out of bound), the search fails and you return -1
    if (index >= elements.length) return -1;
    // check if [value] your looking for has higher priority than the current value for index [index], if so, then the value your're
    // looking for cannot possibly be lower in the heap, so -1 is returned. This optimizes the search to immediately short
    // circuit the recursive traversal.
    if (_firstHasHigherPriority(value, elements[index])) return -1;
    // if the value your looking for is equal to the value at [index], you found it. Return [index]
    if (value == elements[index]) return index;
    // recursively search for the value starting from the left child,
    final left = indexOf(value, index: _leftChildIndex(index));
    if (left != -1) return left;
    // and then on the right child, if both searches fails, the whole search fails. Return -1;
    return indexOf(value, index: _rightChildIndex(index));
  }

  @override
  String toString() => elements.toString();
}
