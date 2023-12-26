import 'package:dart_data_structure_and_algorithm/linked_list/linked_list.dart';

class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> $next'; // $next is a short hand for ${next.toString()}
  }
}

class SinglyLinkedList<T> extends Iterable<T> implements LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  @override
  bool get isEmpty => head == null;

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  void push(T value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  void append(T value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  // average case time complexity: O(1) | worse case time complexity: O(n)
  @override
  Node<T>? nodeAt(int index) {
    Node<T>? currentNode = head;
    int currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  Node<T> insertAfter(Node<T> node, T value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  T? pop() {
    T? value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  // average case time complexity: O(1) | worse case time complexity: O(n)
  @override
  T? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail!.value; // or current.next!.value
    tail = current;
    current.next = null;

    return value;
  }

  // average case time complexity: O(1) | worse case time complexity: O(1)
  @override
  T? removeAfter(Node<T> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty linked list';
    return '$head'; // $head is a short hand for ${next.toString()}, this will recursively iterate through all the nodes from the 1st one until it reaches the last node whose 'next' is null
  }

  @override
  Iterator<T> get iterator => _SinglyLinkedListIterator<T>(this);
}

class _SinglyLinkedListIterator<E> implements Iterator<E> {
  _SinglyLinkedListIterator(SinglyLinkedList<E> linkedList) : _linkedList = linkedList;
  final SinglyLinkedList<E> _linkedList;
  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_linkedList.isEmpty) return false;

    /// allow to access the head of the linked list only once
    ///  any subsequent moveNext call will use the node store in currentNode variable to move to the next node
    if (_firstPass) {
      _currentNode = _linkedList.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;

    /* 
     _currentNode != null; is a short syntax for

      if (_currentNode != null) {
      return true;
    } else {
      return false;
    }
      */
  }
}
