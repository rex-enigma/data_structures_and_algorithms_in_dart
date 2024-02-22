import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/double_list_based_queue_implementation.dart';

extension BreadthFirstSearch<T> on Graph<T> {
  // the root vertex is any vertex chosen to serve as the entry point.
  /// returns all the vertices that were visited (the order in which the vertices are visited depends on how you
  /// constructed the graph)
  List<Vertex<T>> breadthFirstSearch(Vertex<T> root) {
    // keeps track of the neighboring/adjacent vertices to visit next.
    final QueueDoubleList queue = QueueDoubleList<Vertex<T>>();
    // set will remember which vertices have been enqueued in [queue] before, so thy don't get enqueued
    // twice. set is used for the lookup operation since the operation has a constant time complexity
    // of O(1) since set is implemented using a map, making the operation cheap as compared to list
    // lookup time which has a linear time complexity of O(n).
    final Set<Vertex<T>> enqueued = {};
    // stores vertices in the order in which they were visited.
    final List<Vertex<T>> visitedVertices = [];

    queue.enqueue(root);
    enqueued.add(root);

    while (true) {
      final vertex = queue.dequeue();
      // break out of this while loop when [queue] is empty.
      if (vertex == null) break;
      visitedVertices.add(vertex);
      // get all outgoing edges of the current vertex
      final neighborEdges = edges(vertex);
      for (var edge in neighborEdges) {
        // for each edge check if its destination vertex has been enqueued before, and if not add it to
        // the [queue].
        if (!enqueued.contains(edge.destination)) {
          queue.enqueue(edge.destination);
          enqueued.add(edge.destination);
        }
      }
    }

    return visitedVertices;
  }
}
