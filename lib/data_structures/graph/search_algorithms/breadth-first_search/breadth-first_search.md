breadth-first search(aka level-first search), given a starting vertex, the algorithm explores all neighbors of that starting vertex before traversing the neighbors' neighbors and so forth. The return type depends on the purpose of the search/what you want the search to accomplish:
   1. if you want BFS to look for a specific vertex, the BFS implementation will return only that vertex if found or null if not found.
   2. if you want BFS to look for vertices with specific properties, the BFS implementation will return a list of vertices that meet that condition.
   3. if you want BFS to get all vertices visited, the BFS implementation will return a list of vertices in the order they were visited.
In the implementation, the breadth-first search will return a list of visited vertices in the graph. Have in mind that, the order in which vertices are visited so that they can be added in list to be returned, is determined by how you constructed your graph.

- Queue data structure is used to keep track of which vertex to visit next in a level-wise manner. The FIFO approach of queue guarantees that all of a vertex's neighbors are visited before you traverse one level deeper.

- In breadth-first search, each vertex is enqueued once. This process has a linear time complexity of O(V). During this exploration, you also visit all edges. The time it takes to visit all edges is O(E). Adding the two together means the overall time complexity for breadth-first search is O(V + E).
- The space complexity of BFS is O(V) since you have to store the vertices in three separate structures: queue, set(which will remember if a vertex has been enqueued before in queue) and list(stores the visited vertices).


#### key points: