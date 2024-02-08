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
  Person? peekHighestPriorityPeron() => _priorityQueueTicketWaitList.peek();
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

// priority.max means a list with descending values(greatest to the smallest from left to right if the list).
class PriorityQueueList<T extends Comparable<dynamic>> implements Queue {
  late List _sortedList;
  final Priority priority;
  PriorityQueueList({List<T>? unsortedList, this.priority = Priority.max}) {
    _sortedList = unsortedList == null ? 
  }

  /// remove and return the element with the highest priority. Return null if the priority queue is empty
  @override
  T? dequeue() => _heap.remove();

  /// insert an element into priority queue and return true if the operation is successful.
  @override
  bool enqueue(element) {
    _heap.insert(element);
    return true;
  }

  @override
  bool get isEmpty => _heap.isEmpty;

  //return a reference of the element with the highest priority without removing it. Return null is the priority queue is empty.
  @override
  T? peek() => _heap.peek;
}
