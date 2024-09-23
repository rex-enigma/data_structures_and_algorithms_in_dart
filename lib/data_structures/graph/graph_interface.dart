enum EdgeType { directed, undirected }

class Vertex<T> {
  final int index;
  final T data;
  const Vertex({required this.index, required this.data});

  @override
  String toString() => data.toString();
}

// This concrete Edge is mostly used by map_based_graph_implementation, to represent a connection between
// the source vertex and destination vertex.
// Two_dimensional_list_based_graph_implementation, don't use explicit concrete Edge to represent connection
// btn source and destination, but rather, the cells themself act as 'edges' holding null as weight to indicated the
// absence of a connection or type double value as weight to indicate the presence of a connection btn source and
// destination.
class Edge<T> {
  // represent the [source] vertex connecting to [destination]. The connection flow is from
  // source --> destination
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;

  const Edge(this.source, this.destination, [this.weight]);
}

abstract class Graph<T> {
  /// returns a collection of the vertices in the graph.
  Iterable<Vertex<T>> get vertices;

  /// creates a vertex and add it to the graph.
  Vertex<T> createVertex(T data);

  /// connects two vertices in the graph with either directed or undirected edge.
  void addEdge(Vertex<T> source, Vertex<T> destination, {EdgeType edgeType, double? weight});

  /// returns a list of outgoing edges from [source] vertex.
  List<Edge<T>> edges(Vertex<T> source);

  /// returns the weight of the edge btn [source] and [destination] vertices or null if [source] and [destination] vertices aren't connected.
  double? weight(Vertex<T> source, Vertex<T> destination);
}
