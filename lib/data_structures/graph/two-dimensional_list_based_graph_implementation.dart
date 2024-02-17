import 'package:dart_data_structure_and_algorithm/data_structures/graph/graph.dart';

class AdjacencyMatrix<T> implements Graph<T> {
  final List<Vertex<T>> _vertices = [];
  final List<List<double?>> _weights = [];

  @override
  Iterable<Vertex<T>> get vertices => _vertices;

  // _nextIndex is used to assign a unique index to each new vertex. The index will represent a vertex in both the
  // row and column direction.
  int _nextIndex = 0;

  @override
  Vertex<T> createVertex(T data) {
    final vertex = Vertex(index: _nextIndex, data: data);
    _nextIndex++;
    _vertices.add(vertex);

    // add a new column to the matrix and fill it will null weight values
    final column = List.filled(_vertices.length, null, growable: true);
    _weights.add(column);

    // add a new row to the matrix and append null values on that row
    for (var i = 0; i < _weights.length - 1; i++) {
      _weights[i].add(null);
    }
    return vertex;
  }

  @override
  void addEdge(Vertex<T> source, Vertex<T> destination, {EdgeType edgeType = EdgeType.undirected, double? weight}) {
    _weights[source.index][destination.index] = weight;
    if (edgeType == EdgeType.undirected) {
      _weights[destination.index][source.index] = weight;
    }
  }

  @override
  List<Edge<T>> edges(Vertex<T> source) {
    // TODO: implement edges
    throw UnimplementedError();
  }

  @override
  double? weight(Vertex<T> source, Vertex<T> destination) {
    // TODO: implement weight
    throw UnimplementedError();
  }
}
