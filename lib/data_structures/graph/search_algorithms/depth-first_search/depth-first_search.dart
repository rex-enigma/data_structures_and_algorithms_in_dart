import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/stack/single_list_based_stack_implementation.dart';

extension DepthFirstSearch<T> on Graph<T> {
  // the root vertex is any vertex chosen to serve as the entry point to the graph.
  /// returns all the vertices that were visited depth-wise
  List<Vertex<T>> depthFirstSearch(Vertex<T> root) {
    // stores your path through the grap
    final StackList<Vertex<T>> stack = StackList();
    // set will remember which vertices have been pushed in [stack] before, so thy don't get pushed
    // twice. set is used for the lookup operation since the operation has a constant time complexity
    // of O(1) since set is implemented using a map, making the operation cheap as compared to list
    // lookup time which has a linear time complexity of O(n).
    final Set<Vertex<T>> pushed = {};
    // stores vertices in the order they were visited.
    final List<Vertex<T>> visited = [];

    stack.push(root);
    pushed.add(root);
    visited.add(root);

    outerLoop:
    while (stack.isNotEmpty) {
      final vertex = stack.peek()!;
      final neighborEdges = edges(vertex);
      for (var edge in neighborEdges) {
        if (!pushed.contains(edge.destination)) {
          stack.push(edge.destination);
          pushed.add(edge.destination);
          visited.add(edge.destination);

          continue outerLoop;
        }
      }
      stack.pop();
    }
    return visited;
  }
}

/*  */
extension CyclicGraph<T> on Graph<T> {
  bool _hasCycle(Vertex<T> root, Set<Vertex<T>> pushed) {
    // Initialize the algorithm by adding the root vertex.
    pushed.add(root);
    // Visit every neighboring edge
    final neighbors = edges(root);
    for (final edge in neighbors) {
      // If the adjacent vertex has not been visited before, recursively dive deeper down a
      // branch to check for a cycle.
      if (!pushed.contains(edge.destination)) {
        if (_hasCycle(edge.destination, pushed)) {
          return true;
        }
        // If the adjacent vertex has been visited before, you’ve found a cycle
      } else {
        return true;
      }
    }
    // Remove the source vertex so you can continue to find other paths with a potential cycle.
    pushed.remove(root);
    // If you’ve reached this far, then no cycle was found.
    return false;
  }

  bool hasCycle(Vertex<T> source) {
    Set<Vertex<T>> pushed = {};
    return _hasCycle(source, pushed);
  }
}
