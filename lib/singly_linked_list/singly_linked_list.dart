// a linked list is a collection of values arranged in a linear sequence.

// a linked list is a chain of 'Nodes' that hold a value and a reference to the next Node. A null reference
// indicates the end of the list.
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

class SinglyLinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  /// add an element at the front of the linked list
  // average case time complexity: O(1) | worse case time complexity: O(1)
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// add an element at the end of the linked list or at the front if the linked list is empty.
  // average case time complexity: O(1) | worse case time complexity: O(1)
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  /// returns a node at a particular index.
  /// Returns null if linked list is empty or if the index is out-of-bound.
  // average case time complexity: O(1) | worse case time complexity: O(n)
  Node<E>? nodeAt(int index) {
    Node<E>? currentNode = head;
    int currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  /// adds a value after a particular node in the list.
  // average case time complexity: O(1) | worse case time complexity: O(1)
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  /// removes and return a value at the front of a linked list.
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? pop() {
    E? value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  /// removes and return the last value from the linked list.
  // average case time complexity: O(1) | worse case time complexity: O(n)
  E? removeLast() {
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

  /// removes and returns the value after a particular node in the linked list.
  // average case time complexity: O(1) | worse case time complexity: O(1)
  E? removeAfter(Node<E> node) {
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
  Iterator<E> get iterator => _SinglyLinkedListIterator<E>(this);
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
