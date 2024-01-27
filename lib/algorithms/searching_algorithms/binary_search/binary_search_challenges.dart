// challenge 1: Binary search as a free function
// Since binary search only works on sorted lists, exposing binarySearch for every list
// (including unsorted ones) opens it up to being misused. Implement binary search as a free function.

/// Search for the index of [value] in [orderedList]. Make sure [orderedList] is ordered.
/// If duplicate [value]s exist in [orderedList], one of any index of [value] will be returned. Otherwise
/// -1 get returned if [value] doesn't exist.
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

// book's solution of challenge 1 is similar to the above implementation.

// challenge 2: Non-recursive binary search
// re-implement binarySearch using a while loop

int nonRecursiveBinarySearch<T extends Comparable<dynamic>>(T value, List<T> orderedList, [int? start, int? end]) {
  int startIndex = start ?? 0;
  int endIndex = end ?? orderedList.length;

  while (!(startIndex == endIndex)) {
    final size = endIndex - startIndex;
    final middleIndex = startIndex + (size ~/ 2);

    if (orderedList[middleIndex] == value) {
      return middleIndex;
    }
    // if the [value] is less than the middleIndex value, check for the index of [value] on the left half.
    else if (value.compareTo(orderedList[middleIndex]) < 0) {
      // notice that: when the value is on the left half, the startIndex will remain to be constant(0 or [start]) while the endIndex moves toward the startIndex
      endIndex = middleIndex;
    }
    // if the value is greater than the middleIndex value, check for the index of [value] on the right half.
    else {
      // notice that: when the value is on the right half, the endIndex will remain to be constant(0 or [end]) while the startIndex moves toward the endIndex
      startIndex = middleIndex + 1;
    }
  }

  // this part is only executed if index of [value] wasn't found within the while block
  return -1;
}

// book's solution for challenge 2
// books solution returns null if the value doesn't exit in the list instead of -1

// int? binarySearch<E extends Comparable<dynamic>>(List<E> list, E value) {
//   var start = 0;
//   var end = list.length;
//   while (start < end) {
//     final middle = start + (end - start) ~/ 2;
//     if (value == list[middle]) {
//       return middle;
//     } else if (value.compareTo(list[middle]) < 0) {
//       end = middle;
//     } else {
//       start = middle + 1;
//     }
//   }
//   return null;
// }

// challenge 3: Searching for a Range
// Write a function that searches a sorted list and find the range of indices for that particular element.
// you can start by creating a class named Range that holds the start and end indices.
// for example:
/*
final list = [1, 2, 3, 3, 3, 4, 5, 5]; 
final range = findRange(list, value: 3);

findRange should return Range(2, 5) since those are the start and end indices for
the value 3.
*/

class Range {
  Range(this.startIndex, this.endIndex);
  // this is inclusive (meaning that the startIndex is exactly the index in a list that we want to include its corresponding value)
  final int startIndex;
  // this is exclusive (meaning the endIndex will always be greater than the index it refer to in a list,{mostly its greater just by 1, meaning for us to get
  // the corresponding value for this endIndex, we need to subtract 1 from it})
  final int endIndex;

  @override
  bool operator ==(Object other) {
    return (other is Range && startIndex == other.startIndex && endIndex == other.endIndex);
  }

  @override
  int get hashCode => startIndex.hashCode ^ endIndex.hashCode;

  @override
  String toString() {
    return 'Range($startIndex, $endIndex)';
  }
}

// has a time complexity of O(n).
/// find the range of indices for a particular value.
Range? findRange<T extends Comparable<dynamic>>({required T value, required List<T> orderedList}) {
  final valueIndex = binarySearch(value, orderedList);
  int startIndex = valueIndex;
  int endIndex = valueIndex;
  // if value don't exist in [orderedList] return null
  if (valueIndex == -1) return null;

  // 1st, loop to left of the [orderedList] to search for the first index of the [value]
  // [startIndex > 0] makes sure we don't go out of bound on the right side of [orderedList]
  while (startIndex > 0 && orderedList[startIndex - 1] == value) {
    startIndex--;
  }

  // 2nd, loop to right of the [orderedList] to search for the last index of the [value]
  // [endIndex < orderedList.length] makes sure we don't go out of bound on the right side of [orderedList]
  while (endIndex < orderedList.length && orderedList[endIndex] == value) {
    endIndex++;
  }

  return Range(startIndex, endIndex);
}

// book solution for challenge 3:
// solution a:
// used dart list's indexOf and lastIndexOf methods, this solution has a time complexity of O(n)

// Range? findRange(List<int> list, int value) {
//   final start = list.indexOf(value);
//   if (start == -1) return null;
//   final end = list.lastIndexOf(value) + 1;
//   return Range(start, end);
// }

// solution b:
// this solution first finds the startIndex and endIndex of a given value in a sorted list, which
// makes finding range easier with a time complexity of O(log n)

// 1st, find the startIndex of [value]

// int? _startIndex(List<int> list, int value) {
//   if (list[0] == value) return 0;
//   var start = 1;
//   var end = list.length;
//   while (start < end) {
//     var middle = start + (end - start) ~/ 2;
//     if (list[middle] == value && list[middle - 1] != value) {
//       return middle;
//     } else if (list[middle] < value) {
//       start = middle + 1;
//     } else {
//       end = middle;
//     }
//   }
//   return null;
// }

// 2nd, find the endIndex of [value]

// int? _endIndex(List<int> list, int value) {
//   if (list[list.length - 1] == value) return list.length;
//   var start = 0;
//   var end = list.length - 1;
//   while (start < end) {
//     var middle = start + (end - start) ~/ 2;
//     if (list[middle] == value && list[middle + 1] != value) {
//       return middle + 1;
//     } else if (list[middle] > value) {
//       end = middle;
//     } else {
//       start = middle + 1;
//     }
//   }
//   return null;
// }

// finally, find the range of indices of [value]
// time complexity of O(log n)

// Range? findRange(List<int> list, int value) {
//   if (list.isEmpty) return null;
//   final start = _startIndex(list, value);
//   final end = _endIndex(list, value);
//   if (start == null || end == null) return null;
//   return Range(start, end);
// }
