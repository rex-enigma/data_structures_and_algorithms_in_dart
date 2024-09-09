// Your traversal technique depends on the problem that your're trying to solve.There are multiple techniques for
// different trees and different problems.

import 'package:dart_data_structure_and_algorithm/data_structures/queue/double_list_based_queue_implementation.dart';

class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void addTreeNode(TreeNode<T> treeNode) {
    children.add(treeNode);
  }

  void addAllTreeNode(List<TreeNode<T>> nodes) {
    children.addAll(nodes);
  }

  // Depth-first traversal
  // i like to think of it as vertical traversal(it has its own specific variation ie.
  // postOrder, inOrder and preOrder implementations{they are implemented in
  // TraversableBinaryNode which is traversable_binary_node.dart file}).
  // this is a preOrder depth-first traversal implementation.
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (var child in children) {
      child.forEachDepthFirst((performAction));
    }
  }

  // Level-first/breadth-first traversal
  // i like to think of it as horizontal traversal
  // this is a preOrder depth-first traversal implementation.
  void forEachLevelFirst(void Function(TreeNode<T> node) performAction) {
    final queue = QueueDoubleList<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  // You can use any traversal method that is already implemented above to implement searching depending on the
  // problem you what to solve but this is not ideal because, even though you will encounter the value you are
  // searching for, it will be impossible to short-circuit/stop the algorithm at that time, because the delegated traversal
  // method used in the search implementation will have to visit all the nodes.
  // The best approach would be not to use the already implemented traversal method but to embed the traversal technique
  // inside the search implementation so that you can write a custom code for short-circuiting/stopping the
  // algorithm when the desired value is found.

  /// returns the last match if their are multiple matches, otherwise null is returned if the value does't
  /// exist in the tree.
  TreeNode<T>? searchLevelFirst(T value) {
    TreeNode<T>? result;
    forEachLevelFirst((node) {
      if (node.value == value) result = node;
    });
    return result;
  }
}

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.addTreeNode(hot);
  tree.addTreeNode(cold);
  hot.addTreeNode(tea);
  hot.addTreeNode(coffee);
  hot.addTreeNode(chocolate);
  cold.addTreeNode(soda);
  cold.addTreeNode(milk);
  tea.addTreeNode(blackTea);
  tea.addTreeNode(greenTea);
  tea.addTreeNode(chaiTea);
  soda.addTreeNode(gingerAle);
  soda.addTreeNode(bitterLemon);
  return tree;
}
