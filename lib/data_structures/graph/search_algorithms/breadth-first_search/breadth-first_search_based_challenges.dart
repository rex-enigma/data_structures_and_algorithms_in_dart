import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/double_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/queue.dart';

// challenge 1: maximum queue size.
// for the following undirected graph, list the maximum number of items ever in the queue. Assume
// that starting vertex is A
/* 
                        H
                        |
                B       E---------F
                 \                |\
                  \               | \
                   A-----------C  |  G
                   |            \ | /
                   |             \|/
                   D--------------I--J  
*/

// if you use vertex A as the root, and start traversing from it, the tree representation will look as
// follows:
/* 
                      A
                    / | \ 
                   B  C  D
                      |
                      I
                    / | \ 
                   F  G  J
                  /
                 E
                /
               H   
*/
// the maximum queue size / maximum number of items ever in the queue will be 3.

// book's solution for challenge 1 was: maximum queue size = 3, same as mine.

// challenge 2: recursive BFS
// write a recursive solution for BFS

extension BreadthFirstSearchRecursive<T> on Graph<T> {
  /// returns all the vertices that were visited (the order in which the vertices are visited depends on how you
  /// constructed the graph)
  List<Vertex<T>> breadthFirstSearchRecursive(Vertex<T> source, {Set<Vertex<T>>? vertexSet, QueueDoubleList<Vertex<T>>? vertexQueue}) {
    final QueueDoubleList<Vertex<T>> queue = vertexQueue ?? QueueDoubleList<Vertex<T>>();
    final Set<Vertex<T>> enqueued = vertexSet ?? {};
    final List<Vertex<T>> visited = [];

    if (!enqueued.contains(source)) {
      queue.enqueue(source);
      enqueued.add(source);
    }

    final vertex = queue.dequeue();
    visited.add(vertex!);

    final neighborEdges = edges(source);
    for (var edge in neighborEdges) {
      if (!enqueued.contains(edge.destination)) {
        queue.enqueue(edge.destination);
        enqueued.add(edge.destination);
      }
    }

    if (!queue.isEmpty) {
      final visitedVertices = breadthFirstSearchRecursive(queue.peek!, vertexSet: enqueued, vertexQueue: queue);
      visited.addAll(visitedVertices);
    }

    // this is the base case when [queue] becomes empty.
    return visited;
  }
}

// book's solution for challenge 2:

// extension RecursiveBfs<E> on Graph<E> {
//   void _bfs(QueueDoubleList<Vertex<E>> queue, Set<Vertex<E>> enqueued, List<Vertex<E>> visited) {
//     final vertex = queue.dequeue();

//     if (vertex == null) return;

//     visited.add(vertex);
//     final neighborEdges = edges(vertex);

//     for (final edge in neighborEdges) {
//       if (!enqueued.contains(edge.destination)) {
//         queue.enqueue(edge.destination);
//         enqueued.add(edge.destination);
//       }
//     }

//     _bfs(queue, enqueued, visited);
//   }

//   List<Vertex<E>> bfs(Vertex<E> source) {
//     final queue = QueueDoubleList<Vertex<E>>();
//     final Set<Vertex<E>> enqueued = {};
//     List<Vertex<E>> visited = [];

//     queue.enqueue(source);
//     enqueued.add(source);

//     _bfs(queue, enqueued, visited);
//     return visited;
//   }
// }

//