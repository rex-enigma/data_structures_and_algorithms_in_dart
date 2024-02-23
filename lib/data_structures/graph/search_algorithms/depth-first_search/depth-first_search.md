- Depth-first search given a starting vertex, the algorithm explores a single path as far as possible until it reach a dead end which then it backtracks and explores the next available path. The return type depends on the purpose of the search/what you want the search to accomplish:
   1. if you want DFS to look for a specific vertex, the DFS implementation will return only that vertex if found or null if not found.
   2. if you want DFS to look for vertices with specific properties, the DFS implementation will return a list of vertices that meet that condition.
   3. if you want DFS to get all vertices visited, the DFS implementation will return a list of vertices in the order they were visited.   
- In the implementation, the depth-first search will return a list of visited vertices in the graph.

-  **Stack data structure** is used is used to keep track of which vertex to visit next in a depth-wise manner. The stack LIFO approach helps in backtracking. Every ***push*** on the stack means that you move one level deep. You can ***pop*** to return to previous level if you reach a dead end.
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
branches you’ve visited. if you start traversing the graph from vertex A, a tree representation might look as follows:

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

