#### Definition:
- A tree is an abstract data type that represent a hierarchical tree structure with a set of connect nodes.

- Each node can be connected to many children(depending on the type of tree) but must be connect to ONLY one parent, expect for the *root* node which has no parent.

- [Diagram of a typical tree](https://www.geeksforgeeks.org/introduction-to-tree-data-structure-and-algorithm-tutorials/?ref=lbp)

- Each child node can be treated like the root node of its own subtree, making recursion a useful technique for tree traversal.

#### Terminologies:
1. **Node** -> a basic unit that contains data and references to other nodes. 
2. **Parent / Internal node** -> a node in a tree that has one or more children nodes.
3. **Child node** -> a node in a tree that has only one parent node.
4. **Root node** -> the top most node in a tree. Its the starting point to traverse a tree.
5. **Leaf node / External node** -> a node in a tree that has no children.
6. **Edge** -> is a link that connects two nodes together.
7. **Level / Depth of a node** -> is the `number of edges` from the root node to a given node.
8. **Height of a node** -> is the `number of edges` on the longest downward path from a given node to a leaf node.(ie the `number of edges` from a given node to the deepest leaf).
9. **Height of a tree** -> is the `number of edges` on the longest downward path from the root of the tree to leaf node of that tree.(ie the `number of edges` from the root node to the deepest leaf).
10. **Ancestor** -> is `any node` that lies on the upward path from a given node to the root node.
11. **Descendant** -> is `any node` reachable by following child links from a given node.
12. **Sibling** -> children of the same parent node.
13. **Subtree** -> `any node` of the tree along with its descendants.
14. **Breadth** -> the `number of nodes` on a given level.
    
    
#### Types of trees:
Trees can be categories base on **the nodes' values**(ie based on the values of their nodes) eg binary search tree, AVL tree, red-back tree etc OR based on **the number of children** eg binary tree, ternary tree, N-ary tree etc OR other form of categories.

<!-- **Here am listing a mix of diff types of trees that i will be working on not based on any categories:** -->

1. **Binary tree** -> is a tree data structure where each node has at MOST two children, often referred to as **left** and **right** children. The values it holds are not ordered. It can be **unbalanced**.
   
2. **Binary search tree** -> a.k.a **BST**, **ordered / sorted binary tree**, is a specialized binary tree data structure that effectively organizes and maintains sorted / ordered data in that, the left child node's value is always less and right child node's value is always greater than the parent node's value.  It can be **unbalanced**
   
3. **AVL tree** -> a.k.a **balanced binary search tree** / **Self-Balancing Binary Search Tree**, is a self-balancing binary search tree that guarantees a logarithmic time complexity (O(log n)) for *search*,*insertion*,and *deletion* operations. Its always balanced(**perfect balanced** or **good enough balanced** / **balanced**).
   
  ##### States of balance
    
  - **perfectly balanced**: every leaf node is at the same depth in the tree, and every parent / internal node has the same number of children.
```
                            ___
                            |_|
                            / \
                           /   \
                          /     \
                        _/_     _\_
                        |_|     |_|  
                        / \     / \
                      _/_ _\_ _/_ _\_
                      |_| |_| |_| |_|
```
   - **good enough balanced** / **balanced**: is a more flexible term that doesn't necessarily imply strict adherence to perfect balance but ensures a reasonably balanced structure.
```
                            ___
                            |_|
                            / \
                           /   \
                          /     \
                        _/_     _\_
                        |_|     |_|  
                        / \     
                      _/_ _\_ 
                      |_| |_|                         
```
  - **unbalanced**: is a binary tree where the depth of the two subtrees of any node can differ significantly.
```
                            ___                  ___
                            |_|                  |_|
                            /                    / \
                           /                   _/_ _\_
                          /                    |_| |_|
                        _/_                    /
                        |_|                  _/_
                        / \                  |_|
                      _/_ _\_                /
                      |_| |_|              _/_
                                           |_|  
```
4. Trie a.k.a **prefix tree**, **digital tree** or **radix tree**, is a type of n-ary search tree used for locating specific **sequences** from within a set. These sequences can be words, ip address, phone number, DNA sequence etc. Each node in trie tree stores a **segment** of a sequence and its linked to other nodes. In order to access a sequence (to get its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each segment of the sequence.

   - **segment** -> the smallest manageable part | piece of a segment. eg in the word, "book", the segments are 'b','o','o', and 'k'.
   - **sequence** -> a series of segments combined to form a meaningful whole. eg for segments 'b','o','o', and 'k', the sequence is "book".
   
5. **Heap** -> (will be working with **binary heap** specifically), is a specialized tree based data structure that satisfies the heap property, ensuring that a value of a parent node is always greater that or equal to(in a max **heap**) or less than or equal to(in a min **heap**) the value of its children(the left and the right child). A heap is a **complete binary tree**( meaning all levels are fully filled, except possibly the last one, which is filled from left to right) that can be implemented using a **list**. It can be used to implement *priority queue*. [you can visualize it in both tree representation or list representation, check wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)#/media/File:Max-Heap-new.svg). This heap is different from **memory heap** since memory heap is diff concept.
   

#### Common operations of tree data structures are:
1. **depth-first traversal** -> visit/access every node in the tree only once in a vertical order. No value is returned (void return)
2. **level-first / breadth-first traversal** -> visit/access every node in the tree only once in a level-wise manner, horizontally, always starting from top left. No value is returned (void return)
3. **search** -> search for a target value in the tree, either of the aforementioned traversal implementation or technique can be used. Return treeNode for that target value if it exist or null if the target value doesn't exist. 

**NB:**
in my current understanding,
- **Breadth-first search(BFS) and breadth-first traversal(BFT) share the same exploration mechanism of visiting nodes level by level, but they differ in their objectives, similarly, depth-first search(DFS) and depth-first traversal(DFT) share the same exploration mechanism of exploring one path as far as possible before backtracking and exploring other branches but they differ in their objectives.** 
 - The objective of ***breadth first search or depth first search*** is to look for a given target value if it exist or to look for values which satisfy a certain condition. The return type of the search algorithm can vary depending on the problem that is being solved by the tree, but in most cases, the return type can be ome of the following other than ***void***:
   1. the node/value being searched for.
   2. index/position of the node/value being searched for.
   3. boolean of either true if the node/value exist or false if the node/value don't exist.
   4. list of nodes/values that satisfy certain condition.
   
 - **Traversal** is the process of visiting/accessing ***every*** node exactly once in a tree in specific order.(pre-order, in-order and post-order).
 - The objective of ***breadth first traversal or depth first traversal*** is to visit every node exactly once in the tree(All the nodes must be visited/accessed) in order to perform some action on each node. In "most cases", their is no return value in this case (void return).

##### Applications of trees:
1. representing hierarchical data eg file systems, organization charts, xml / html / flutter widgets.
2. used for efficient searching and sorting -> binary search trees arrange elements in sorted order enabling faster lookup, insertion and deletion of data. B- Trees & B+ Trees are widely used to index data in databases, allowing faster retrieval of records based on key values.
3. parsing -> eg syntax trees, compilers and interpreters constructs syntax trees to represent the structure of code or documents enabling code analysis and translation.
4. Artificial intelligence -> decision trees model decision making processes, commonly used in machine learning algorithms for classification and prediction. Game trees, used in game AI to explore possible moves and their outcomes, aiding in strategy development.
5. network routing -> routing trees represent network topologies determining optimal paths for data transmission.

##### Key points:
1. Trees share some similarities to linked lists, but, whereas linked-list nodes may
only link to one successor node, a tree node can link to many child nodes.
2. Every tree node, except for the root node, has exactly one parent node.
3. A root node has no parent node.
4. Leaf nodes have no child nodes.
5. Traversals, such as depth-first and level-first/breath-first traversals, work on multiple types
of trees. However, the implementation will be slightly different based on how the
tree is structured.

