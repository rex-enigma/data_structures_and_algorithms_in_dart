// Your traversal technique depends on the problem that your're trying to solve.There are multiple techniques for
// different trees and different problems.

import 'package:dart_data_structure_and_algorithm/queue/double_list_based_queue_implementation.dart';

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
  // i like to think of it as vertical traversal
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (var child in children) {
      child.forEachDepthFirst((performAction));
    }
  }

  // level-first traversal
  // i like to think of it as horizontal traversal
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

// we can use any traversal technique to implement searching depending on the problem you what to solve
  /// if there are multiple matches, the last match will be returned.
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
