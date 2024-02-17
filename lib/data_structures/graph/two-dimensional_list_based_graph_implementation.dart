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

    // to help you visualize the matrix, imagine _vertices list in a vertical position and each element since its a
    // list visualize it as projecting horizontally from left to right

    // append a null value at the end of every row. This will create a destination column in the matrix
    for (var i = 0; i < _weights.length; i++) {
      _weights[i].add(null);
    }

    // add a new row to the matrix, filled with null values.
    final row = List<double?>.filled(_vertices.length, null, growable: true);
    _weights.add(row);
    return vertex;
  }

  @override
  void addEdge(Vertex<T> source, Vertex<T> destination, {EdgeType edgeType = EdgeType.undirected, double? weight = 0}) {
    _weights[source.index][destination.index] = weight;
    if (edgeType == EdgeType.undirected) {
      _weights[destination.index][source.index] = weight;
    }
  }

  @override
  List<Edge<T>> edges(Vertex<T> source) {
    List<Edge<T>> edges = [];
    for (var column = 0; column < _weights.length; column++) {
      final weight = _weights[source.index][column];
      if (weight == null) continue;
      final destination = _vertices[column];
      edges.add(Edge(source, destination, weight));
    }
    return edges;
  }

  @override
  double? weight(Vertex<T> source, Vertex<T> destination) {
    return _weights[source.index][destination.index];
  }

  @override
  String toString() {
    final output = StringBuffer();

    for (final vertex in _vertices) {
      output.writeln('${vertex.index}: ${vertex.data}');
    }

    for (int i = 0; i < _weights.length; i++) {
      for (int j = 0; j < _weights.length; j++) {
        final value = (_weights[i][j] ?? '.').toString();
        output.write(value.padRight(6));
      }
      output.writeln();
    }
    return output.toString();
  }
}
