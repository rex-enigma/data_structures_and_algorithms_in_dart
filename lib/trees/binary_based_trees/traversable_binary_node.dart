abstract class TraversableBinaryNode<T> {
  T get key;
  TraversableBinaryNode<T>? get leftChild;
  TraversableBinaryNode<T>? get rightChild;

  void traversePreOrder(void Function(TraversableBinaryNode<T> node) action) {
    action(this);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void traverseInOrder(void Function(TraversableBinaryNode<T> node) action) {
    leftChild?.traverseInOrder(action);
    action(this);
    rightChild?.traverseInOrder(action);
  }

  void traversePostOrder(void Function(TraversableBinaryNode<T> node) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(this);
  }

  // add breath-first/level-first traversal implementation.

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    TraversableBinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.key}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.key}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}
