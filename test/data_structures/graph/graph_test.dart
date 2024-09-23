import 'package:dart_data_structure_and_algorithm/data_structures/graph/map_based_graph_implementation.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/breadth-first_search/breadth-first_search_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/depth-first_search/depth-first_search.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/graph/search_algorithms/depth-first_search/depth-first_search_based_challenges.dart';
import 'package:test/test.dart';

void main() {
  final graphMapBased2 = AdjacencyList<String>();
  final a = graphMapBased2.createVertex('A');
  final b = graphMapBased2.createVertex('B');
  final c = graphMapBased2.createVertex('C');
  final d = graphMapBased2.createVertex('D');
  final e = graphMapBased2.createVertex('E');
  final f = graphMapBased2.createVertex('F');
  final g = graphMapBased2.createVertex('G');
  final h = graphMapBased2.createVertex('H');

  graphMapBased2.addEdge(a, b, weight: 1);
  graphMapBased2.addEdge(a, c, weight: 1);
  graphMapBased2.addEdge(a, d, weight: 1);
  graphMapBased2.addEdge(b, e, weight: 1);
  graphMapBased2.addEdge(c, f, weight: 1);
  graphMapBased2.addEdge(c, g, weight: 1);
  graphMapBased2.addEdge(e, h, weight: 1);
  graphMapBased2.addEdge(e, f, weight: 1);
  graphMapBased2.addEdge(f, g, weight: 1);
  final vertices = graphMapBased2.breadthFirstSearchRecursive(a);

  test('graph breadth-first search challenge 2: testing breadthFirstSearchRecursive method. Return all vertices in the order in which they were added', () {
    expect(vertices.map((vertex) => vertex.data).toList().toString(), '[A, B, C, D, E, F, G, H]');
  });

  final graphMapBased3 = AdjacencyList<String>();
  final A = graphMapBased3.createVertex('A');
  final B = graphMapBased3.createVertex('B');
  final C = graphMapBased3.createVertex('C');
  final D = graphMapBased3.createVertex('D');
  final E = graphMapBased3.createVertex('E');
  final F = graphMapBased3.createVertex('F');
  final G = graphMapBased3.createVertex('G');
  final H = graphMapBased3.createVertex('H');
  graphMapBased3.addEdge(A, B, weight: 1);
  graphMapBased3.addEdge(A, C, weight: 1);
  graphMapBased3.addEdge(A, D, weight: 1);
  // not adding an edge btn b-f,c-f and c-g from the graph makes the graph to be disconnected.
  /*  
  graphMapBased3.addEdge(B, E, weight: 1);
  graphMapBased3.addEdge(C, F, weight: 1);
  graphMapBased3.addEdge(C, G, weight: 1); 
  */
  graphMapBased3.addEdge(E, H, weight: 1);
  graphMapBased3.addEdge(E, F, weight: 1);
  graphMapBased3.addEdge(F, G, weight: 1);
  test('graph breadth-first search challenge 3: check if a graph is connected', () {
    expect(graphMapBased3.isConnected(), false);
  });

  final graphMapBased4 = AdjacencyList<String>();
  final aa = graphMapBased4.createVertex('A');
  final bb = graphMapBased4.createVertex('B');
  final cc = graphMapBased4.createVertex('C');
  final dd = graphMapBased4.createVertex('D');
  final ee = graphMapBased4.createVertex('E');
  final ff = graphMapBased4.createVertex('F');
  final gg = graphMapBased4.createVertex('G');
  final hh = graphMapBased4.createVertex('H');

  graphMapBased4.addEdge(aa, bb, weight: 1);
  graphMapBased4.addEdge(aa, cc, weight: 1);
  graphMapBased4.addEdge(aa, dd, weight: 1);
  graphMapBased4.addEdge(bb, ee, weight: 1);
  graphMapBased4.addEdge(cc, gg, weight: 1);
  graphMapBased4.addEdge(ee, ff, weight: 1);
  graphMapBased4.addEdge(ee, hh, weight: 1);
  graphMapBased4.addEdge(ff, gg, weight: 1);
  graphMapBased4.addEdge(ff, cc, weight: 1);
  test('graph depth-first search method test', () {
    expect(graphMapBased4.depthFirstSearch(aa).toString(), '[A, B, E, F, G, C, H, D]');
  });
  test('graph depth-first search challenge 2: testing depthFirstSearchRecursive method', () {
    expect(graphMapBased4.depthFirstRecursive(aa).toString(), '[A, B, E, F, G, C, H, D]');
  });
}
