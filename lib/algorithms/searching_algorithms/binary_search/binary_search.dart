extension SortedList<E extends Comparable<dynamic>> on List {
  int binarySearch(E value, [int? start, int? end]) {
    final startIndex = start ?? 0;
    final endIndex = end ?? length;

    // if startIndex and endIndex are equal it means [value] is not in this list(this is the base case for the recursion)
    // just return -1
    if (startIndex == endIndex) return -1;

    final size = endIndex - startIndex;
    final middleIndex = startIndex + (size ~/ 2);

    if (this[middleIndex] == value) {
      return middleIndex;
    }
    // if the [value] is less than the middleIndex value, check for the index of [value] on the left half
    else if (value.compareTo(this[middleIndex]) < 0) {
      binarySearch(value, startIndex, middleIndex);
    }
    // if the value is greater than the middleIndex value, check for the index of
    else if (value.compareTo(this[middleIndex]) > 0) {}
  }
}
