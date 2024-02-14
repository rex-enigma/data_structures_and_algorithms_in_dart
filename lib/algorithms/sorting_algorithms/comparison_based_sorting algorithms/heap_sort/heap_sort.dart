extension HeapSort<T extends Comparable<dynamic>> on List<T> {
  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }

  // [start] is the index of the element that you want to sift down and [end] marks the end of the heap
  void _siftDown({required int start, required int end}) {
    var parentIndex = start;
    while (true) {
      final leftChildIndex = _leftChildIndex(parentIndex);
      final rightChildIndex = _rightChildIndex(parentIndex);
      var chosenIndex = parentIndex;
      // check if the left child is within the bound of the heap and is larger than the parent. we assume a max-heap
      // an element can go out of bound if its already sorted
      if (leftChildIndex < end && this[leftChildIndex].compareTo(this[chosenIndex]) > 0) {
        chosenIndex = leftChildIndex;
      }
      // chick if the right child is within the bound of the heap and is larger than the parent.
      if (rightChildIndex < end && this[rightChildIndex].compareTo(this[chosenIndex]) > 0) {
        chosenIndex = rightChildIndex;
      }
      if (chosenIndex == parentIndex) return;
      _swapValues(parentIndex, chosenIndex);
      parentIndex = chosenIndex;
    }
  }

  /// will sort this list is ascending order
  void heapSortInPlace() {
    if (isEmpty) return;
    // first heapify this list
    final start = (length ~/ 2) - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(start: i, end: length);
    }

    //sort this list in ascending order
    for (var end = length - 1; end > 0; end--) {
      // swap the max value which will be at the front of this list with the smaller element at the end of the heap
      _swapValues(0, end);
      // sift that smaller value down to its proper location, each time moving the heap's end index by 1 to preserve
      // the sorted elements at the end of this list.

      _siftDown(start: 0, end: end);
    }
  }
}
