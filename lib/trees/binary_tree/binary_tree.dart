// decided to write the traversal techniques directly in BinaryNode so that other binary based trees can be traversed easily
// without duplicating this functionality on each binary based trees.
class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  void traversePreOrder(void Function(BinaryNode<T> node) action) {
    action(this);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void traverseInOrder(void Function(BinaryNode<T> node) action) {
    leftChild?.traverseInOrder(action);
    action(this);
    rightChild?.traverseInOrder(action);
  }

  void traversePostOrder(void Function(BinaryNode<T> node) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(this);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}

BinaryNode<int> createBinaryTreeHeight3() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  seven.rightChild = nine;
  one.leftChild = zero;
  one.rightChild = five;
  nine.leftChild = eight;

  return seven;
}
