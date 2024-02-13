void heapSort<T extends Comparable<dynamic>>(List<T> list) {
  if (list.isEmpty) return;
  final iterationNumber = list.length - 1;
  var currentHeapSize = list.length;
  for (var i = 0; i < iterationNumber; i++) {
    buildHeap(currentHeapSize);
    _swapValues(0, currentHeapSize - 1);
    currentHeapSize = currentHeapSize - 1;
  }
}

void buildHeap(int heapSize) {
  final start = (heapSize ~/ 2) - 1;
  for (var i = start; i >= 0; i--) {
    _siftDown(i, heapSize - 2);
  }
}

void _siftDown(int index, int end) {
  var parentIndex = index;
  while (parentIndex != end) {
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

int _higherPriority(indexA, indexB) {
  // make sure indexA represents a value that exist in the list
  if (indexA >= elements.length) return indexB;
  final value1 = elements[indexA];
  final value2 = elements[indexB];
  final firstHasHigherPriority = _firstHasHigherPriority(value1, value2);
  return firstHasHigherPriority ? indexA : indexB;
}

void _swapValues(int indexA, int indexB) {
  final temp = elements[indexA];
  elements[indexA] = elements[indexB];
  elements[indexB] = temp;
}
