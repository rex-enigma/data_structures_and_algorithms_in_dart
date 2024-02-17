enum EdgeType { directed, undirected }

class Vertex<T> {
  final int index;
  final T data;
  const Vertex({required this.index, required this.data});

  @override
  String toString() => data.toString();
}

class Edge<T> {
  // represent the [source] vertex connecting to [destination]. The connection flow is from
  // source --> destination
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;

  const Edge(this.source, this.destination, [this.weight]);
}

abstract class Graph<T> {
  /// return all of the vertices in the graph.
  Iterable<Vertex<T>> get vertices;

  /// create a vertex and add it to the graph.
  Vertex<T> createVertex(T data);

  /// connect two vertices in the graph with either directed or undirected edge.
  void addEdge(Vertex<T> source, Vertex<T> destination, {EdgeType edgeType, double? weight});

  /// return a list of outgoing edges from [source] vertex.
  List<Edge<T>> edges(Vertex<T> source);

  /// return the weight(double value) of the edge btn [source] and [destination] vertices or null if [source] and [destination] vertices aren't connected.
  double? weight(Vertex<T> source, Vertex<T> destination);
}
