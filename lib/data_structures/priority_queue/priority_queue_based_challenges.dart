import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';

// challenge 1: prioritize a waitList
// Your favorite concert was sold out. Fortunately there's is a waitList for people who still want to go.
// However, ticket sales will first prioritize someone with military background, followed by seniority.
// Use a priority queue to prioritize the order of people on the waitList. Start by making a Person class
// that you can instantiate like so: final person = Person(name: 'Josh', age: 21, isMilitary: true);

class Person implements Comparable<Person> {
  String name;
  int age;
  bool isMilitary;
  Person({required this.name, required this.age, required this.isMilitary});

  @override
  int compareTo(other) {
    // if [this] person has a military background and the [other] person compared with doesn't have a military background
    //,you give priority to [this] person first.
    if (isMilitary && !(other.isMilitary)) {
      return 1;
      // if both [this] person and the [other] person compared with have a military background, prioritize the older military person first.
    } else if (isMilitary && other.isMilitary) {
      return age.compareTo(other.age);
      // if [this] person has no military background and the [other] person has military background, prioritize the [other] person
      // that has a military background.
    } else if (!isMilitary && other.isMilitary) {
      return -1;
    }
    // if both [this] and [other] person have no military background, then make the older(senior) person(either [this] or [other]) to have a higher priority(ie
    // if [this] person is older than [other] person then return 1 indicating [this] person has higher priority, if [this] person
    // has the same age as the [other] person then return 0 indicating than [this] person have the same level of priority
    // as the [other] person and lastly if [this] person is younger than the [other] person then return -1 indicating than the
    // [other] person has higher priority than [this] person).
    else {
      return age.compareTo(other.age);
    }
  }

  @override
  String toString() {
    return '{name: $name, age: $age, isMilitary: $isMilitary}';
  }
}

//
class TicketWaitList {
  late PriorityQueueHeap<Person> _priorityQueueTicketWaitList;
  TicketWaitList({List<Person>? waitList}) {
    _priorityQueueTicketWaitList = (waitList == null) ? PriorityQueueHeap() : PriorityQueueHeap(elements: waitList);
  }

  // return a reference of the highest priority person without removing the person.
  Person? peekHighestPriorityPeron() => _priorityQueueTicketWaitList.peek;
  // remove and return the highest priority person or null.
  Person? getHighestPriorityPerson() => _priorityQueueTicketWaitList.dequeue();
  // add a person to the waitList.
  void addPersonToWaitList(Person person) {
    _priorityQueueTicketWaitList.enqueue(person);
  }
}

// book's solution for challenge 1 is the same as mine but if two people don't have a military background,
// it prioritized the person that came first.

// @override
// int compareTo(other) {
// if (isMilitary == other.isMilitary) {
// return age.compareTo(other.age);
// }
// return isMilitary ? 1 : -1;
// }

// challenge 2: list-based priority queue.

class PriorityQueueList<T extends Comparable<dynamic>> implements Queue<T> {
  late List<T> _sortedList;
  final Priority priority;
  PriorityQueueList({List<T>? unsortedList, this.priority = Priority.max}) {
    _sortedList = unsortedList ?? [];
    _sortList();
  }

  void _sortList() {
    switch (priority) {
      case Priority.max:
        // sort the [_sortedList] values from the greatest value to the smallest value from right to left.
        // this is beneficial when dequeue high priority value since the operation will be O(1)
        _sortedList.sort((a, b) => a.compareTo(b));
      case Priority.min:
        // sort the [_sortedList] values from the smallest value to the greatest value from right to left.
        // this is beneficial when dequeue high priority value since the operation will be O(1)
        _sortedList.sort((a, b) => b.compareTo(a));
    }
  }

  /// remove and return the element with the highest priority. Return null if the priority queue is empty
  @override
  T? dequeue() => isEmpty ? null : _sortedList.removeLast();

  /// insert an element into priority queue and return true if the operation is successful.
  @override
  bool enqueue(element) {
    for (var i = 0; i < _sortedList.length; i++) {
      if (priority == Priority.max) {
        if (_sortedList[i].compareTo(element) >= 0) {
          _sortedList.insert(i, element);
          return true;
        }
      }
      if (priority == Priority.min) {
        if (element.compareTo(_sortedList[i]) >= 0) {
          _sortedList.insert(i, element);
          return true;
        }
      }
    }
    // add value at the end of the _sortedList if its the smallest or the largest in a min priority queue and
    // max priority queue respectively.
    _sortedList.add(element);
    return true;
  }

  @override
  bool get isEmpty => _sortedList.isEmpty;

  //return a reference of the element with the highest priority without removing it. Return null is the priority queue is empty.
  @override
  T? get peek => isEmpty ? null : _sortedList.last;

  @override
  String toString() => _sortedList.toString();
}

// book's solution for challenge 2
// class PriorityQueueList<E extends Comparable<dynamic>> implements Queue<E> {
//   late List<E> _elements;
//   late Priority _priority;

//   PriorityQueueList({List<E>? elements, Priority priority = Priority.max}) {
//     _priority = priority;
//     _elements = elements ?? [];
//     _elements.sort((a, b) => _compareByPriority(a, b));
//   }
//   int _compareByPriority(E a, E b) {
//     if (_priority == Priority.max) {
//       return a.compareTo(b);
//     }
//     return b.compareTo(a);
//   }

//   @override
//   bool get isEmpty => _elements.isEmpty;
//   @override
//   E? get peek => (isEmpty) ? null : _elements.last;

//   @override
//   bool enqueue(E element) {
//     for (int i = 0; i < _elements.length; i++) {
//       if (_compareByPriority(element, _elements[i]) < 0) {
//         _elements.insert(i, element);
//         return true;
//       }
//     }

//     _elements.add(element);
//     return true;
//   }

//   @override
//   E? dequeue() => isEmpty ? null : _elements.removeLast();

//   @override
//   String toString() => _elements.toString();
// }
