import 'package:dart_data_structure_and_algorithm/data_structures/linked_list/singly_linked_list.dart';

abstract class LinkedList<T> {
  /// adds a value at the front of the linked list.
  void push(T value);

  /// adds a value at the end of the linked list.
  void append(T value);

  /// adds a value after a particular node in the linked list.
  Node<T> insertAfter(Node<T> node, T value);

  /// removes and returns the value at the front of the linked list.
  T? pop();

  /// removes and returns the value at the end of the linked list.
  T? removeLast();

  ///removes and returns the value after a particular node in the linked list.
  T? removeAfter(Node<T> node);

  /// returns a node at a particular index, without removing it.
  /// Returns null if linked list is empty or if the index is out-of-bound.
  Node<T>? nodeAt(int index);
}
