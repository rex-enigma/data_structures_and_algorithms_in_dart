import 'package:dart_data_structure_and_algorithm/algorithms/searching_algorithms/binary_search/binary_search.dart';
import 'package:dart_data_structure_and_algorithm/algorithms/searching_algorithms/binary_search/binary_search_based_challenges.dart';
import 'package:test/test.dart';

void main() {
  final orderedList = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  test("recursive binarySearch returns the index of a given / targeted element in the sorted list if it exit, else return -1 if it don't exit", () {
    expect(orderedList.indexOf(31), 7);
    expect(orderedList.binarySearch(31), 7);
    expect(orderedList.binarySearch(10), -1);
  });

  final freeFunctionBinarySearch31 = binarySearch(31, orderedList);
  test("recursive binarySearch returns the index of a given / targeted element in the sorted list if it exit, else return -1 if it don't exit", () {
    expect(freeFunctionBinarySearch31, 7);
    expect(binarySearch<int>(10, orderedList), -1);
  });

  final nonRecursiveBinarySearch24 = nonRecursiveBinarySearch(24, orderedList);
  test("non-recursive binarySearch returns the index of a given / targeted element in the sorted list if it exit, else return -1 if it don't exit", () {
    expect(nonRecursiveBinarySearch24, 6);
    expect(nonRecursiveBinarySearch<int>(15, orderedList), 2);
  });

  final orderedDuplicatedValueList = [1, 1, 2, 3, 3, 3, 4, 5, 5];
  test('binary search challenge 3: find the range of indices of a particular element', () {
    expect(findRange(value: 3, orderedList: orderedDuplicatedValueList), Range(3, 6));
    expect(findRange(value: 5, orderedList: orderedDuplicatedValueList), Range(7, 9));
    expect(findRange(value: 1, orderedList: orderedDuplicatedValueList), Range(0, 2));
    expect(findRange(value: 2, orderedList: orderedDuplicatedValueList), Range(2, 3));
    expect(findRange(value: 7, orderedList: orderedDuplicatedValueList), null);
  });
}
