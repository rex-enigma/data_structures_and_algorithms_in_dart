import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/priority_queue/priority_queue_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/avl_tree/avl_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/general_tree_based_challenges.dart';

void main(List<String> arguments) {
  /*******************general tree*********************/

  // printing a tree in level order
  printTreeInLevelOrder();

  // removing a value from a binary search tree.
  final binarySearchTreeBalanced1 = BinarySearchTree<int>();
  binarySearchTreeBalanced1.insert(3);
  binarySearchTreeBalanced1.insert(1);
  binarySearchTreeBalanced1.insert(4);
  binarySearchTreeBalanced1.insert(0);
  binarySearchTreeBalanced1.insert(2);
  binarySearchTreeBalanced1.insert(5);

  print('before removing value 3 from BST: \n $binarySearchTreeBalanced1');
  binarySearchTreeBalanced1.remove(3);
  print('After removing value 3 from BST: \n $binarySearchTreeBalanced1');

  // testing AVL tree balancing mechanism (insertion operation)
  final avlTreeInsert = AVLTree<int>();
  for (var i = 0; i < 15; i++) {
    avlTreeInsert.insert(i);
  }
  print(avlTreeInsert);

  // testing AVL tree balancing mechanism (remove operation)
  final avlTreeRemove = AVLTree<int>();
  avlTreeRemove.insert(15);
  avlTreeRemove.insert(10);
  avlTreeRemove.insert(16);
  avlTreeRemove.insert(18);
  print(avlTreeRemove);
  avlTreeRemove.remove(10);
  print(avlTreeRemove);

  // final priorityQueue = PriorityQueue();
  // priorityQueue.enqueue(Person(name: 'Ben', age: 23));
  // priorityQueue.enqueue(Person(name: 'Mark', age: 21));
  // priorityQueue.enqueue(Person(name: 'Einstein', age: 21));
  // print(priorityQueue.dequeue());
  // print(priorityQueue.dequeue());
  // print(priorityQueue.dequeue());
  final ticketWaitList = TicketWaitList();
  ticketWaitList.addPersonToWaitList(Person(name: 'Mark', age: 21, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Amos', age: 23, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Josh', age: 27, isMilitary: true));
  ticketWaitList.addPersonToWaitList(Person(name: 'Einstein', age: 21, isMilitary: false));
  ticketWaitList.addPersonToWaitList(Person(name: 'Ben', age: 25, isMilitary: true));
  print(ticketWaitList.getHighestPriorityPerson());
  print(ticketWaitList.getHighestPriorityPerson());
  print(ticketWaitList.getHighestPriorityPerson());
  print(ticketWaitList.getHighestPriorityPerson());
  print(ticketWaitList.getHighestPriorityPerson());
}

class Person implements Comparable<Person> {
  String name;
  int age;
  Person({required this.name, required this.age});
  @override
  int compareTo(Person other) {
    return age.compareTo(other.age);
  }

  @override
  String toString() {
    return '{name:$name, age:$age}';
  }
}
