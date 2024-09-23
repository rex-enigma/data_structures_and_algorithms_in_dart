#### Definition:
- Breadth-first search(aka level-first search), given a starting vertex, the algorithm explores all neighbours of that starting vertex before traversing the neighbours' neighbours and so forth. The return type depends on the purpose of the search/what you want the search to accomplish:
   1. if you want BFS to search for a specific vertex, the BFS implementation will return only that vertex if found or null if not found.
   2. if you want BFS to search for vertices with specific properties, the BFS implementation will return a list of vertices that meet that condition.
   3. if you want BFS to get all vertices visited, the BFS implementation will return a list of vertices in the order they were visited.
- In the implementation, the breadth-first search will return a list of visited vertices in the graph. Have in mind that, the order in which vertices are visited so that they can be added in list to be returned, is determined by how you construct your graph.

#### Data structures used to enable breadth-first search:
1. **Queue data structure** is used to keep track of which vertex to visit next in a level-wise manner. The queue FIFO approach guarantees that all of a vertex's neighbours are visited before you traverse one level deeper. The visual illustration below will show you what it means by visiting vertices in a level-wise manner.

 ##### an example of a graph:
```
            H
            |
            E---------F
           /          |\
          /           | \
         B            |  G
          \           | /
           \          |/
            A---------C
            |
            D
```
- When exploring the vertices, you can construct a tree-like structure, having vertices at each level. If you start traversing the graph from vertex `A`, a tree representation might look as follows:

```
level 0 --------------A----------
                    / | \ 
level 1 -----------B--D--C-------
                  /     / \
level 2 ---------E-----F---G-----
                /   
level 3 -------H-----------------

```

##### Simplified description of how breath-first search works:
BFS explores all the current vertex’s neighbors before traversing the next level of vertices. In the example above, you will start at level zero queueing vertex A, you will then dequeue vertex A, perform an action on it then move down to 1st level and queue the adjacent neighbours of vertex A which are B, D and C. You will then dequeue vertex B, perform an action on it then queue the neighbours of vertex B which is only vertex E which is on the 3rd level. You will then dequeue vertex D, perform an action on it, and since vertex D doesn't have adjacent neighbours, you move to vertex C and dequeue it, perform an action on it then queue adjacent neighbours of vertex C which are F and G which are on the 3rd level. You will work on the vertices on the 2nd level which are E,F and G before exploring on to the levels below.

2. **Set data structure** is also used to remember which vertices have been enqueued in the queue before, so you don’t enqueue the same vertex twice and end up visiting it again. set is used for the lookup operation since the operation has a constant time complexity of O(1) since set is implemented using a map, making the operation cheap as compared to list lookup time which has a linear time complexity of O(n).

#### Performance:
- In breadth-first search, each vertex is enqueued once. This process has a linear time complexity of O(V). During exploration, you also visit all edges. The time it takes to visit all edges is O(E). Adding the two together means the overall time complexity for breadth-first search is O(V + E).
- The space complexity of breadth-first search is O(V) since you have to store the vertices in three separate structures: queue, set(which will remember if a vertex has been enqueued before in queue) and list(stores the visited vertices).

#### Application of breadth-first search:
1. Generating a minimum-spanning tree -> BFS serves as a building block for algorithms like Prim's algorithm, which finds a minimum spanning tree in a weighted graph, connecting all vertices with the least total edge weight.
2. Finding potential paths between vertices.
3. Finding the shortest path between two vertices.

#### Key points:
1. Breadth-first search (BFS) is an algorithm for searching(or traversing a graph, if its implemented to only traverse) a graph. 
2. BFS explores all the current vertex’s neighbours before traversing the next level of vertices.
3. It’s generally good to use this algorithm when your graph structure has many neighbouring vertices or when you need to find out every possible outcome.
4. The queue data structure is used to prioritize traversing a vertex’s edges before diving down to a level deeper.
5. A set is used to remember which vertices have been enqueued in the queue before, so you don’t enqueue the same vertex twice and end up visiting it again. Which might result to an infinity loop.
