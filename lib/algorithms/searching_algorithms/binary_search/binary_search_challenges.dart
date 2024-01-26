// challenge 1: Binary search as a free function
// Since binary search only works on sorted lists, exposing binarySearch for every list
// (including unsorted ones) opens it up to being misused. Implement binary search as a free function.

int binarySearch<T extends Comparable<dynamic>>(T value, List<T> orderedList, [int? start, int? end]) {
  final startIndex = start ?? 0;
  final endIndex = end ?? orderedList.length;

  // if startIndex and endIndex are equal, it means [value] is not in this list(this is the base case for the recursion)
  // just return -1
  if (startIndex == endIndex) return -1;

  final size = endIndex - startIndex;
  final middleIndex = startIndex + (size ~/ 2);

  if (orderedList[middleIndex] == value) {
    return middleIndex;
  }
  // if the [value] is less than the middleIndex value, check for the index of [value] on the left half.
  else if (value.compareTo(orderedList[middleIndex]) < 0) {
    return binarySearch(value, orderedList, startIndex, middleIndex);
  }
  // if the value is greater than the middleIndex value, check for the index of [value] on the right half.
  else {
    return binarySearch(value, orderedList, middleIndex + 1, endIndex);
  }
}
