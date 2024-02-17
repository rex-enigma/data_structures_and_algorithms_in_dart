import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph.dart';

class AdjacencyList<T> implements Graph<T> {
  final Map<Vertex<T>, List<Edge<T>>> _connections = {};
  // _nextIndex is used to assign a unique index to each new vertex
  int _nextIndex = 0;

  @override
  // TODO: implement vertices
  Iterable<Vertex<T>> get vertices => _connections.keys;

  @override
  Vertex<T> createVertex(T data) {
    final vertex = Vertex(index: _nextIndex, data: data);
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  @override
  void addEdge(Vertex<T> source, Vertex<T> destination, {EdgeType edgeType = EdgeType.undirected, double? weight}) {
    // since source is vertex, check if it exist first in _connection map. If it does, create a new directed Edge from
    // source to the destination, then add it to the source vertex's list of edges.
    _connections[source]?.add(Edge(source, destination, weight));
    // if this is a directed graph, then also add an edge going on the other direction.
    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(Edge(destination, source));
    }
  }

  @override
  List<Edge<T>> edges(Vertex<T> source) => _connections[source] ?? [];

  // for adjacency list implementation, two vertices can be connected with an edge but thy can have a weight of
  // null value, indicating there is no weight associate with connection, but a weight of any double value will
  // indicate their is a weight associated with the connection.
  @override
  double? weight(Vertex<T> source, Vertex<T> destination) {
    final match = edges(source).where((edge) => edge.destination == destination);
    if (match.isEmpty) return null;
    return match.first.weight;
  }

  @override
  String toString() {
    final result = StringBuffer();
    // loop through every key-value pair in _connections.
    _connections.forEach((vertex, edges) {
      // for every vertex, find all the destinations and join them into a single, comma-separated string
      final destinations = edges.map((edge) => edge.destination).join(', ');
      // put each vertex and its destination on a new line
      result.writeln("$vertex --> $destinations");
    });
    return result.toString();
  }
}
