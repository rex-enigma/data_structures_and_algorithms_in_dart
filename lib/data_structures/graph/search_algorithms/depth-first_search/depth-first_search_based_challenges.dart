import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph_interface.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/stack/single_list_based_stack_implementation.dart';

// challenge 1: breadth-first search or depth-first search
// For each of the following two examples, which traversal, depth-first or breadth-first,
// is better for discovering if a path exists between the two nodes? Explain why.
/* 
      A----B----C----D----F----H
      |
      G
*/

// 1. path from A to F: Use depth-first search -> because the path you’re looking for is deeper in the graph
// 2. path from A to G: Use breadth-first search -> because the path you’re looking for is near the root.

// challenge 2:recursive DFS
// write a recursive solution for BFS

extension DepthFirstSearchRecursive<T> on Graph<T> {
  void _dfs(Vertex<T> source, Set<Vertex<T>> pushed, StackList<Vertex<T>> stack, List<Vertex<T>> visited) {
    if (!pushed.contains(source)) {
      stack.push(source);
      pushed.add(source);
      visited.add(source);
    }

    final vertex = stack.peek()!;
    final neighborEdges = edges(vertex);
    for (var edge in neighborEdges) {
      if (!pushed.contains(edge.destination)) {
        stack.push(edge.destination);
        pushed.add(edge.destination);
        visited.add(edge.destination);
        _dfs(stack.peek()!, pushed, stack, visited);
      }
    }
    stack.pop();
  }

  List<Vertex<T>> depthFirstRecursive(Vertex<T> source) {
    final StackList<Vertex<T>> stack = StackList();
    final Set<Vertex<T>> pushed = {};
    final List<Vertex<T>> visited = [];
    _dfs(source, pushed, stack, visited);
    return visited;
  }
}

// in my solution i used an explicit stack 🤦‍♂️ forgetting that recursion utilizes stack internally
// which is seen in the solution provided by the book.

// book's solution for challenge 2:

extension RecursiveDfs<E> on Graph<E> {
  void _dfs(Vertex<E> source, List<Vertex<E>> visited, Set<Vertex<E>> pushed) {
    pushed.add(source);
    visited.add(source);
    final neighbors = edges(source);
    for (final edge in neighbors) {
      if (!pushed.contains(edge.destination)) {
        _dfs(edge.destination, visited, pushed);
      }
    }
  }

  List<Vertex<E>> dfs(Vertex<E> start) {
    List<Vertex<E>> visited = [];
    Set<Vertex<E>> pushed = {};
    _dfs(start, visited, pushed);
    return visited;
  }
}
