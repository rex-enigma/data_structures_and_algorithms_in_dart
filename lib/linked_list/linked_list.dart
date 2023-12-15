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

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  /// add an element at the front of the linked list
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// add an element at the end of the linked list or at the front if the linked list is empty
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  /// returns a node that you want to insert a value after OR
  /// return null if linked list is empty or if the index is out-of-bound
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
  // Node<E> insertAfter(Node<E> node, E value) {
  //   if (tail == node) {
  //     append(value);
  //     return tail!;
  //   }
  // }

  @override
  String toString() {
    if (isEmpty) return 'Empty linked list';
    return '$head'; // $head is a short hand for ${next.toString()}, this will recursively iterate through all the nodes from the 1st one until it reaches the last node whose 'next' is null
  }
}
