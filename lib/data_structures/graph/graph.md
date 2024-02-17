- A graph is a non-linear abstract data type consisting of a collection of vertices/nodes and edges/arcs. These edges are used to connect any two vertices in the graph. The graph is denoted by **G(V,E)**.

#### Graph terminologies:
1. **vertex** -> a fundamental unit of a graph, representing an entity. Vertices hold data associated with them and a label in this case will be an index which the indices can be used to label the rows and columns if adjacency matrix implementation is used.
2. **Edge** -> is a connection between two vertices.An edge can be:
    - ***directed***(indicating which direction the relationship flows) or ***undirected***( indicating that the relationship is bi-directional). 
    - ***weighted***( meaning an edge can have a ***weight*** value which is used to represent a certain quantifiable relationship btn the vertices it connects) or ***unweighted***(meaning an edge can lack weight value indicating that their is no 'cost' associated btn the vertices it connects).
3. **Weight** -> a value associated with an edge, indicating the 'cost' btn the connected vertices. Weighted graphs have weights assigned to their edges, while unweighted graphs do not.
4. **Adjacency** -> two vertices are adjacent if there an edge connecting them.
5. **Degree** -> the degree of a node is the number of edges incident to that node. In directed graphs, there are two degrees for each node: in-degree (number of incoming edges) and out-degree (number of outgoing edges).
6. **Path** -> a sequence of vertices connected by edges.
7. **Cycle** -> a path that starts and ends at the same vertex, without visiting any other vertex more than once(except for the start and end vertex) 

#### Graphs can be represented / implemented in various ways, common ways are:
1. **Adjacency List** -> in adjacent list representation, each vertex in the graph maintains a list of other vertices that it is connected to. This list, known as the adjacent list for that vertex, effectively stores the edges ***outgoing*** from that vertex. This can be implemented using a ***Map*** in which keys are the vertices and their corresponding values are lists whose elements are edges. other data structures can be used other than map. A visual illustration is shown below: a flight booking system example
```
                   Map
       vertices             adjacent list(stores edges)
    _______________         ________________ ________________
    |  singapore  |  -->    |src: singapore| |src: singapore|
    |_____________|         |des: tokyo    | |des: hong kong|
                            ----------------,----------------
    _______________         ________________ ________________ ____________________
    |  hong kong  |  -->    |src: hong kong| |src: hong kong| |src: hong kong    |
    |_____________|         |des: tokyo    | |des: singapore| |des: san francisco|
                            ----------------,----------------,-------------------- 
    _______________         ________________ ________________ ____________________ ____________________ 
    |    tokyo    |  -->    |src: tokyo    | |src: tokyo    | |src: tokyo        | |src: tokyo        |
    |_____________|         |des: singapore| |des: hong kong| |des: detroit      | |des: washington DC| 
                            ----------------,----------------,--------------------,--------------------
    _______________         ________________ 
    |   detroit   |  -->    |src: detroit  |   
    |_____________|         |des: tokyo    |
                            ----------------
    _______________         ____________________ ____________________
    |washington Dc| -->     |src: washington DC| |src: washington Dc| 
    |_____________|         |des: tokyo        | |des: san francisco|
                            --------------------,--------------------
    _______________         ____________________ ____________________
    |san francisco| -->     |src: san francisco| |src: san francisco|
    |_____________|         |des: hong kong    | |des: washington DC|
                            --------------------,--------------------            
```
1. **Adjacency Matrix** -> A 2D array where each cell represents the presence or absence of an edge btn two vertices. The rows represent ***source*** vertices and columns represents ***destination*** vertices. The cells where the rows and column intersect holds the edge weights. If any particular cell is empty, that is, if the weight is null, then that means there is no edge btn the row vertex and the column vertex. If their is a connection btn 2 vertices, then a weight of double value will be used. This is implemented using an ***List*** within another ***List***. A visual illustration is shown below: example
```
                      2D List  
     vertices                           destination
                                  0     1      2      3      4
  _______________             ____________________________________
0 |  singapore  |          0  |   0  | $300 | $500 |  0   |  0   |
  |_____________|             |______|______|______|______|______|  
1 |  hong kong  |          1  | $300 |  0   | $250 |  0   |  0   |     
  |_____________|             |______|______|______|______|______|    
2 |   tokyo     |   source 2  | $500 |  0   |  0   | $300 |  0   |    
  |_____________|             |______|______|______|______|______|
3 |washington DC|          3  |  0   |  0   |  0   |  0   |  0   |
  |_____________|             |______|______|______|______|______|
4 |san francisco|          4  |  0   | $600 |  0   |  0   |  0   |
  |_____________|             |______|______|______|______|______|

eg:
[0][1] is 300, so their is a flight from singapore to hong kong for $300
[2][1] is 0, so there's no flight from tokyo to hong kong
[2][2] is 0, because there cant be a flight from tokyo to tokyo in this context, in other context 0 might be a valid value eg when having a graph that represent road network and edge weights represent the amount of traffic, 0 might mean no traffic on that road.

```


#### common operation are:
1. **createVertex** -> create a vertex and add it to the graph.
2. **vertices** -> return all of the vertices in the graph.
3. **addEdge** -> connect two vertices in the graph with either directed or undirected edge. For adjacency list implementation edge objects exists but for adjacency matrix implementation, an edge objects don't exist, instead a weight of null value will be used to represent the absence of an edge btn the row vertex and the column vertex but a weight of a double value will represent the presence of edge btn the row vertex and the column.
4. **edges** -> return a list of outgoing edges from a specific vertex.
5. **weight** -> return the weight of the edge btn 2 vertices or null if the 2 vertices aren't connected.
6. **breadth-first traversal** -> (aka level-first traversal),systematically explore all vertices reachable from starting vertex, level by level.
7. **depth-first traversal** -> follow a single path as deep as possible before backtracking and exploring alternative paths.
8. **shortestPath** -> find the path with the least weight/cost btn two vertices.



#### key points: