- Depth-first search, given a starting vertex, the algorithm explores a single path as far as possible until it reaches a dead end which then it backtracks and explores the next available path. The return type depends on the purpose of the search/what you want the search to accomplish:
   1. if you want DFS to look for a specific vertex, the DFS implementation will return only that vertex if found or null if not found.
   2. if you want DFS to look for vertices with specific properties, the DFS implementation will return a list of vertices that meet that condition.
   3. if you want DFS to get all vertices visited, the DFS implementation will return a list of vertices in the order they were visited.   
- In the implementation, the depth-first search will return a list of visited vertices in the graph.

-  **Stack data structure** is used to keep track of which vertex to visit next in a depth-wise manner. The stack LIFO approach helps in backtracking. Every ***push*** on the stack means that you move one level deep. You can ***pop*** to return to previous level if you reach a dead end.
The visual illustration below will show you what it means by visiting vertices in a depth-wise manner.
```
    an example of a graph

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

When exploring the vertices, you can construct a tree-like structure, showing the
branches you’ve visited. If you start traversing the graph from vertex A, a tree representation might look as follows:

1st level ----------------A------
                         / \
2nd level --------------B---D----
                       /
3rd level ------------E----------
                     / \ 
4th level ----------F-- H--------
                  /
5th level -------G---------------
                /
6th level -----C-----------------   

DFS explores a branch as far as possible before backtracking to the next branch. In our example dfs will start at vertex A, you pushing it to the stack then moves one level deep and push vertex B to the stack, you move another level deep and push vertex E, you move another level deep and push vertex F, you move another level deep and push vertex G, you go deeper into the last level and push vertex C, since you have reached dead end because you cant push vertex A since it was pushed in the stack before, you backtrack and pop the vertices that you pushed, do whatever you want with each one of them, until you reach vertex E, and you start pushing another vertex going deeper into levels exploring a diff path and so fort.

```
- **Set data structure** is also used to remember which vertices have been pushed in the stack before, so you don’t push the same vertex twice and end up visiting it again. set is used for the lookup operation since the operation has a constant time complexity of O(1) since set is implemented using a map, making the operation cheap as compared to list lookup time which has a linear time complexity of O(n).


#### performance:
- Depth-first search will visit every vertex at least once. This process has a linear time complexity of O(V).Dfs checks all neighbouring vertices to find one available/unvisited vertex to visit. The time complexity of this is O(E) because you have to visit every edge in the graph in the worse case. The overall time complexity for depth-first search is O(V + E).
-  The space complexity of depth-first search is O(V) since you have to store the vertices in three separate structures: stack, set(which will remember if a vertex has been pushed before in stack) and list(stores the visited vertices).
  
#### cycle:
- A depth-first search is useful for finding whether a graph contains **cycles**. A
graph is said to have a cycle when a path of edges and vertices leads back to the
same source.
- At least **three** vertices are needed in an undirected graph to make a cycle.

   
#### application of depth-first search:
1. Topological sorting -> DFS can be employed to perform topological sorting of a Directed Acyclic Graph (DAG). Topological sorting orders the vertices of a graph in such a way that for every directed edge uv from vertex u to vertex v, u comes before v in the ordering. This is useful in scheduling tasks that have dependencies.
2. Detecting cycle -> depth-first search can be used to detect the presence of cycles in a graph.
3. path-finding, such as in maze puzzles.
4. Finding connected component in a sparse graph.


#### key points:
1. Depth-first search (DFS) is an algorithm for searching(or traversing a graph, if its implemented to only traverse) a graph.
2. DFS explores a branch as far as possible before backtracking to the next branch.
3. A graph is said to be a cycle when a path of edges and vertices lead back to the source vertex.
4. Stack data structure allows you to backtrack
5. Set data structure is also used to remember which vertices have been pushed in the stack before, so you don’t push the same vertex twice and end up visiting it again. Which might result to an infinity loop.