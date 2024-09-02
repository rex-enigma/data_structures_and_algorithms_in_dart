import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/breadth-first_search/breadth-first_search.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/queue/double_list_based_queue_implementation.dart';

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

// if you use vertex A as the root, and start traversing from it, the tree representation might look as
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
  List<Vertex<T>> breadthFirstSearchRecursive(Vertex<T> source, {Set<Vertex<T>>? verticesSet, QueueDoubleList<Vertex<T>>? verticesQueue}) {
    final QueueDoubleList<Vertex<T>> queue = verticesQueue ?? QueueDoubleList<Vertex<T>>();
    final Set<Vertex<T>> enqueued = verticesSet ?? {};
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
      final visitedVertices = breadthFirstSearchRecursive(queue.peek()!, verticesSet: enqueued, verticesQueue: queue);
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

// challenge 3: disconnected graph
// add a method to graph to detect if a graph is disconnected. An example of a disconnected graph is shown
// below:
/* 
                  H
                  |
          B       E-------F
           \               \
            \               \
             A-------C       G 
             |
             D
 
*/

extension Connected<T> on Graph<T> {
  /// return true if graph is connected, otherwise, it return false.
  bool isConnected() {
    if (vertices.isEmpty) return true;
    // running breadth-first search will return all the vertices in the graph in the order in which they were
    // constructed,
    final visitedVertices = breadthFirstSearch(vertices.first);
    // if the graph is connected, the number of visited vertices should equal the number of vertices
    // in the graph.
    return visitedVertices.length == vertices.length;
  }
}
// below is a visual representation of how a connected graph looks like and how a disconnected graph looks like
// based on my 'isConnected' implementation using the example diagram above on challenge 3.
/* 
  CONNECTED GRAPH

  vertices = [A, B, C, D, E, F, G, H]
  visitedVertices = [A, B, C, D, E, F, G, H]

  both of the lists' length end up being the same, it does't matter which vertex is used to start the exploration.

  DISCONNECTED GRAPH

  vertices = [A, B, C, D, E, F, G, H]
  visitedVertices = [A, B, C, D]

  if you start exploring the graph from vertex A, visitedVertices will only contain the neighbors of A and itself
  and the exploration will terminate since their isn't any connection from vertex (A,B,C,D) connecting to 
  any vertex(E,F,G,H). Making the lists' length not to be equal.

*/

// book's solution for challenge 3

// a graph is said to be disconnected if no path exists btn 2 vertices.
// extension Connected<T> on Graph<T> {
//   bool isConnected() {
//     // if their are no vertices, treat the graph as connected
//     if (vertices.isEmpty) return true;
//     // Perform a breadth-first search starting from the first vertex. This process will return all the visited nodes.
//     final visited = breadthFirstSearch(vertices.first);
//     // Go through every vertex in the graph and check if it has been visited before.
//     for (final vertex in vertices) {
//       if (!visited.contains(vertex)) {
//         return false;
//       }
//     }
//     return true;
//   }
// }
