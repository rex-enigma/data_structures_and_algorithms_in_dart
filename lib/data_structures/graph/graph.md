#### Definition:
- A graph is a non-linear abstract data type consisting of a collection of vertices/nodes and edges/arcs. These edges are used to connect any two vertices in the graph. The graph is denoted by **G(V,E)**.

#### Graph terminologies:
1. **vertex** -> a fundamental unit of a graph, representing an entity. Vertices hold `data` associated with them and a `label` in this case can be an index which can be used to label the rows and columns if adjacency matrix implementation is used.
2. **Edge** -> is a connection between two vertices.An edge can be:
    - ***directed***(indicating which direction the relationship flows) or ***undirected***( indicating that the relationship is bi-directional). 
    - ***weighted***( meaning an edge can have a ***weight*** value which is used to represent a certain quantifiable relationship btn the vertices it connect) or ***unweighted***(meaning an edge can lack weight value indicating that their is no 'cost' associated btn the vertices it connects).
3. **Weight** -> a value associated with an edge, indicating the 'cost' btn the connected vertices. Weighted graphs have weights assigned to their edges, while unweighted graphs do not.
4. **Adjacency** -> two vertices are adjacent if there is an edge connecting them.
5. **Degree** -> the degree of a vertex is the number of edges incident to that vertex. In directed graphs, there are two degrees for each vertex: in-degree (number of incoming edges) and out-degree (number of outgoing edges).
6. **Path** -> a sequence of vertices connected by edges.
7. **Cycle** -> a path that starts and ends at the same vertex, without visiting any other vertex more than once(except for the start and end vertex) 

#### Graphs can be represented / implemented in various ways, common ways are:
1. **Adjacency List** -> in adjacency list representation, each vertex in the graph maintains a list of other vertices that it is connected to. This list, known as the adjacency list for that vertex, effectively stores the edges ***outgoing*** from that vertex. This can be implemented using a ***Map*** in which keys are the vertices and their corresponding values are lists whose elements are edges. Other data structures can be used other than map. A visual illustration is shown below: a flight booking system example
```
                   Map
       vertices             adjacency list(stores edges)
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
1. **Adjacency Matrix** -> A 2D array where each cell represents the presence or absence of an edge btn two vertices. The rows represent ***source*** vertices and columns represents ***destination*** vertices. The cells where the rows and column intersect holds the edge weights. If any particular cell is empty, that is, the weight is ***null***, then that means there is no edge connecting the source and destination. If their is a connection btn 2 vertices, then a weight of ***double value*** will be used. This is implemented using an ***List*** within another ***List***. A visual illustration is shown below: example
```
                      2D List  
     vertices                           destination
                                  0     1      2      3      4
  _______________             ____________________________________
0 |  singapore  |          0  | null | $300 | $500 |  0   |  0   |
  |_____________|             |______|______|______|______|______|  
1 |  hong kong  |          1  | $300 | null | $250 |  0   |  0   |     
  |_____________|             |______|______|______|______|______|    
2 |   tokyo     |   source 2  | $500 |  0   | null | $300 |  0   |    
  |_____________|             |______|______|______|______|______|
3 |washington DC|          3  |  0   |  0   |  0   | null |  0   |
  |_____________|             |______|______|______|______|______|
4 |san francisco|          4  |  0   | $600 |  0   |  0   | null |
  |_____________|             |______|______|______|______|______|

Exp:
[0][1] is 300, so their is a flight from singapore to hong kong for $300
[2][1] is 0, so there's no flight from tokyo to hong kong
[2][2] is null, because there cant be a flight from tokyo to tokyo.
s
```

#### Graph analysis
```
    V represents the number of vertices and E represents the number of edges
  __________________________________________________________________________
  |             operation              | adjacency List | adjacency Matrix |
  |____________________________________|________________|__________________|
  |          storage space             |    0(V + E)    |       0(V²)      |
  |____________________________________|________________|__________________|
  |           Add vertex               |      0(1)      |       0(V²)      |
  |____________________________________|________________|__________________|
  |            Add edge                |      0(1)      |       0(1)       |
  |____________________________________|________________|__________________|
  | finding specific edges and weights |      0(V)      |       0(1)       |
  |____________________________________|________________|__________________|

 ```
 ##### A: Space complexity:
 1. **storage space** -> Adjacency list takes less space than adjacency matrix, this is because adjacency list stores the number of vertices and edges needed while adjacency Matrix has a quadratic space complexity because the number of rows and columns equal the number of vertices.
 ##### B: Time complexity:  
 1. **Adding a Vertex** -> adding a vertex is efficient in adjacency list as compared to adding it in adjacency matrix, this is because with map base graph implementation for adjacency list, creating a vertex and setting its key-value pair has amortized time complexity of 0(1) but when adding a vertex to a adjacency matrix, you must add a column to very row and create a new row for the new vertex which is at least 0(v), and when you choose to represent the matrix with a contiguous block of memory, it can be 0(V²).
 2. **Adding an edge** -> adding an edge is efficient in both implementations. The adjacency list appends to the list of outgoing edges and the adjacency matrix sets a value in the two-dimensional list.
 3. **Finding a specific edge or weight btn 2 vertices** -> this is more efficient in adjacency matrix as compared to adjacency list, this is because finding an edge or weight is a constant time lookup in the two-dimensional list while for adjacency list you have to obtain the list of outgoing edges and loop through every edge to find a matching destination.

#### How to choose which implementation to use:
- If there are **few edges** in you graph, it's considered a **sparse graph** and **adjacency list** would be a good fit. adjacency matrix wont be a good choice because a lot of memory would be wasted since there aren't many edges.
- If there are **a lot of edges** in your graph, it's considered a **dense graph** and **adjacency matrix** would be a better fit, since you will be able to access your edges and weights for more quickly.


#### Common operation are:
1. **createVertex** -> creates a vertex and adds it to the graph.
2. **vertices** -> returns all of the vertices in the graph.
3. **addEdge** -> connects two vertices in the graph with either directed or undirected edge. For adjacency list implementation, edge objects exists but for adjacency matrix implementation, an edge objects don't exist, instead a weight of null value will be used to represent the absence of an edge btn the row vertex (source) and the column vertex (destination) and a weight of a double value will represent the presence of edge btn the row vertex and the column vertex (if weight is 0 then it means 2 vertices are connected with a 0 weight in weight graph or no weight at all in a unweighted graph).
4. **edges** -> returns a list of outgoing edges from a specific vertex.
5. **weight** -> returns the weight of the edge btn 2 vertices or null if the 2 vertices aren't connected.
6. **breadth-first search** -> (aka level-first search), given a starting vertex, the algorithm explores all neighbours of that starting vertex before traversing the neighbours' neighbours and so forth. The return type depends on the purpose of the search/what you want the search to accomplish:
   1. if you want BFS to search for a specific vertex, the BFS implementation will return only that vertex if found or null if not found.
   2. if you want BFS to search for vertices with specific properties, the BFS implementation will return a list of vertices that meet that condition.
   3. if you want BFS to get all vertices visited, the BFS implementation will return a list of vertices in the order they were visited.
In the implementation, the breadth-first search will return a list of visited vertices in the graph. Have in mind that, the order in which vertices are visited so that they can be added in list to be returned, is determined by how you constructed your graph. Queue data structure is used to keep track of which vertex to visit next in a level-wise manner.
7. **depth-first search** -> given a starting vertex, the algorithm explores a single path as far as possible until it reach a dead end which then it backtracks and explores the next available path. The return type depends on the purpose of the search/what you want the search to accomplish:
   1. if you want DFS to look for a specific vertex, the DFS implementation will return only that vertex if found or null if not found.
   2. if you want DFS to look for vertices with specific properties, the DFS implementation will return a list of vertices that meet that condition.
   3. if you want DFS to get all vertices visited, the DFS implementation will return a list of vertices in the order they were visited.   
In the implementation, the depth-first search will return a list of visited vertices in the graph.
8. **shortestPath** -> finds the path with the least weight/cost btn two vertices. ***// update this operation before implementing Dijkstra’s algorithm .***
   
**Note:**
- A dense graph in which every vertex has an edge to every other vertex is called a **complete graph**.

##### in my current understanding,
- **Breadth-first search(BFS) and breadth-first traversal(BFT) share the same exploration mechanism of visiting vertices level by level, but they differ in their objectives, similarly, depth-first search(DFS) and depth-first traversal(DFT) share the same exploration mechanism of exploring one path as far as possible before backtracking and exploring other branches but they differ in their objectives.** 
 - The objective of ***breadth first / depth first search*** is to look for a given target value if it exist or to look for values which satisfy a certain condition. The return type of the search algorithm can vary depending on the problem that is being solved by the graph, but in most cases, the return type can be any of the following other than ***void***:
   1. the vertex/value being searched for.
   2. index/position of the vertex/value being searched for.
   3. boolean of either true if the vertex/value exist or false if the vertex/value don't exist.
   4. list of vertices/values that satisfy certain condition.
 - **Traversal** is the process of visiting/accessing ***every*** vertex exactly once in a graph in specific order. 
 - The objective of ***breadth first / depth first traversal*** is to visit every vertices exactly once in the graph(All the vertices must be visited/accessed), maybe in order to perform some action in every vertex. In "most cases", their is no return value in this case(void return).

#### Applications of graph:
1. Circuit design and Analysis ->  Electrical engineers use graphs to analyze circuits. Nodes represent components like resistors and capacitors, and edges represent the connections between them. This allows them to simulate circuit behaviour, calculate currents and voltages, and identify potential problems.
2. Scientific Research -> Scientists use graphs to model complex systems in various fields like biology, chemistry, and physics. Nodes can represent molecules, genes, or other entities, and edges represent interactions or relationships between them. This allows them to analyze data, identify patterns, and make new discoveries
3. Transportation Network -> Transportation systems like airlines and railways use graphs to model their networks. Nodes represent cities or stations, and edges represent flight routes or train tracks. This allows them to optimize schedules, identify bottlenecks, and manage resources efficiently.
4. Navigation and Maps -> GPS navigation apps like Google Maps use graphs to represent roads and intersections as vertices and the connections between them as edges. This allows them to find the shortest route between two points, considering factors like traffic and road closures.
5. Recommendation Systems -> Online retailers like Amazon and Netflix use graphs to recommend products or shows to users based on their past purchases or viewing history. They analyze the relationships between users and items to identify similar preferences and suggest relevant options.
6. Social Networks -> Social media platforms like Facebook, Twitter, and Instagram use graphs to represent users as vertices and connections between them as edges. This allows them to recommend friends, show relevant content, and analyze the spread of information.

#### Key points:
1. You can represent a real world relationship through vertices and edges.
2. Think of vertices as entities and edges as relationship btn the entities.
3. Weighted graph associate a number with every edge.
4. Directed graphs have edges that traverse in one direction.
5. Undirected graphs have edges that point both ways.
6. An adjacency list is a graph that can use map to store vertices as keys and a list of outgoing edges as value for every vertex.
7. An adjacency matrix uses a two-dimensional list to represent a graph.
8. An adjacency list is generally good for sparse graphs, which have a low number of edges.
9. An adjacency matrix is generally suitable for dense graphs, which have lots of edges.
