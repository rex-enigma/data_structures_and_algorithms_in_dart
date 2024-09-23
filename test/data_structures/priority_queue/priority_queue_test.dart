import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/heap_based_priority_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/heap/heap_interface.dart';
import 'package:test/test.dart';

void main() {
  final maxPriorityQueue = PriorityQueueHeap();
  maxPriorityQueue.enqueue(1);
  maxPriorityQueue.enqueue(12);
  maxPriorityQueue.enqueue(3);
  maxPriorityQueue.enqueue(4);
  maxPriorityQueue.enqueue(1);
  maxPriorityQueue.enqueue(6);
  maxPriorityQueue.enqueue(8);
  maxPriorityQueue.enqueue(7);
  test('enqueueing values out of order, expecting the values to be ordered based on max priority(larger values have higher priority)', () {
    expect(maxPriorityQueue.dequeue(), 12);
    expect(maxPriorityQueue.dequeue(), 8);
    expect(maxPriorityQueue.dequeue(), 7);
    expect(maxPriorityQueue.dequeue(), 6);
    expect(maxPriorityQueue.dequeue(), 4);
    expect(maxPriorityQueue.dequeue(), 3);
    expect(maxPriorityQueue.dequeue(), 1);
    expect(maxPriorityQueue.dequeue(), 1);
  });

  final ticketWaitList = TicketWaitList();
  ticketWaitList.addPersonToWaitList(Person(name: 'Mark', age: 21, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Amos', age: 23, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Josh', age: 27, isMilitary: true));
  ticketWaitList.addPersonToWaitList(Person(name: 'Einstein', age: 21, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Ben', age: 25, isMilitary: true));
  test('priority queue challenge 1: add persons in a ticket waitList, prioritizing first persons with military background follows by seniority(older)', () {
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Josh, age: 27, isMilitary: true}');
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Ben, age: 25, isMilitary: true}');
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Amos, age: 23, isMilitary: false}');
    // even though Mark was added before Einstein, Einstein will be the first to be removed before Mark, this is because
    // of the internal implementation of _firstHasHigherPriority method in heap class.
    // the order in which Mark and Einstein are added is not the same order in which they are be removed because
    // there age are the same.
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Einstein, age: 21, isMilitary: false}');
    expect(ticketWaitList.getHighestPriorityPerson().toString(), '{name: Mark, age: 21, isMilitary: false}');
  });

  final maxPriorityQueueList1 = PriorityQueueList(unsortedList: [1, 12, 3, 4, 1, 6, 8, 7]);
  test('priority queue challenge 2: sort a list of unsortedList in max order where the last value is the greatest', () {
    expect(maxPriorityQueueList1.toString(), '[1, 1, 3, 4, 6, 7, 8, 12]');
  });

  final maxPriorityQueueList2 = PriorityQueueList<int>();
  maxPriorityQueueList2.enqueue(7);
  maxPriorityQueueList2.enqueue(4);
  maxPriorityQueueList2.enqueue(1);
  maxPriorityQueueList2.enqueue(7);
  maxPriorityQueueList2.enqueue(10);
  maxPriorityQueueList2.enqueue(5);
  test('priority queue challenge 2: testing priorityQueueList enqueue method', () {
    expect(maxPriorityQueueList2.toString(), '[1, 4, 5, 7, 7, 10]');
    expect(maxPriorityQueueList2.dequeue(), 10);
    expect(maxPriorityQueueList2.dequeue(), 7);
  });

  final minPriorityQueueList3 = PriorityQueueList<int>(unsortedList: [1, 12, 3, 4, 1, 6, 8, 7], priority: Priority.min);
  test('priority queue challenge 2: sort a list of unsortedList in min order where the last value is the smallest', () {
    expect(minPriorityQueueList3.toString(), '[12, 8, 7, 6, 4, 3, 1, 1]');
  });
}
