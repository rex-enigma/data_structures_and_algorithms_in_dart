import 'package:dart_data_structure_and_algorithm/algorithms/sorting_algorithms/swap.dart';

// 1. Insertion sort requires you to iterate from left to right once, which is the job of
//    this outer for loop. At the beginning of the loop, current is the index of the element
//    you want to sort in this pass.

// 2. Here, you run backward from the current index so you can shift left as needed.

// 3. Keep shifting the element left as long as necessary. As soon as the element is in
//    position, break the inner loop and start with the next element.

void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
// 1
  for (var current = 1; current < list.length; current++) {
// 2
    for (var shifting = current; shifting > 0; shifting--) {
// 3
      if (list[shifting].compareTo(list[shifting - 1]) < 0) {
        list.swap(shifting, shifting - 1);
      } else {
        break;
      }
    }
  }
}
