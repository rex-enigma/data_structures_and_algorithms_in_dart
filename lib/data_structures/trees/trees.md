A tree is an abstract data type that represent a hierarchical tree structure with a set of connect nodes.

Each node can be connected to many children(depending on the type of tree) but must be connect to ONLY one parent, expect for the *root* node which has no parent.

[Diagram of a typical tree](https://www.geeksforgeeks.org/introduction-to-tree-data-structure-and-algorithm-tutorials/?ref=lbp)

Each child node can be treated like the root node of its own subtree, making recursion a useful technique for tree traversal.

#### Terminologies
1.**node** -> the basic unit may contain data and references to other nodes. 
2. **parent node / internal node** -> a node in a tree that has one or more children nodes.
3. **child node** -> a node in a tree that has only one parent node.
4. **root node** -> the top most node in a tree. Its the starting point to traverse a tree.
5. **leaf node / external node** -> a node in a tree that has no children.
6. **edge** -> is a link that connects two nodes together.
7. **level of a node / depth of a node** -> is the number of edges from the root node to that node.
8. **height of a node** -> is the length of the longest downward path to a leaf from that node.
9. **height of a tree** -> is the length of the longest downward path from the root of the tree to leaf node of the tree.
10. **Ancestor** -> is any node that lies on the path from the root node to another node.
11. **Descendant** -> is any node reachable by following child links from a particular node.
12. **sibling** -> children of the same parent node.
13. **subtree** -> any node of the tree along with its descendants.
14. **breadth** -> the number of leaves.
    
    
#### Types of trees:
Trees can be categories base on **the nodes' values** eg binary search tree, AVL tree, red-back tree etc OR  based on **the number of children** eg binary tree, ternary tree, N-ary tree etc OR other forms categories.

**Here am listing a mix of diff types of trees that i will be working on not based on any category:**

1. **Binary tree** -> is a tree data structure where each node has at MOST two children, often referred to as **left** and **right** children. It can be **unbalanced**.
   
2. **Binary search tree** -> a.k.a **BST**, **ordered / sorted binary tree**, is a specialized binary tree data structure that effectively organizes and maintains sorted data. The left child is smaller and right child is greater than the parent node.  It can be **unbalanced**
   
3. **AVL tree** -> a.k.a **balanced binary search tree**, is a self-balancing binary search tree that guarantees a logarithmic time complexity (O(log n)) for *search*,*insertion*,and *deletion* operations. Its always balanced(**perfect balanced** or **good enough balanced**[balanced]).
   
    ##### states of balance
    
    - **perfectly balanced**: every leaf node is at the same depth in the tree, and every internal node has the same number of children.
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
4. **Trie** -> a.k.a prefix tree or digital tree, is a type of n-ary search tree used for locating specific keys from within a set. These keys are most often **strings**, with links between nodes defined not by the entire key, but by individual characters. In order to access a key (to recover its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each character in the key.
   
5. **Heap** ->  (will be working with binary heap specifically), is a specialized tree based data structure that satisfies the heap property, ensuring that a value of a parent node is always greater that or equal to(in a max **heap**) or less that or equal to(in a min **heap**) the value of its children(the left and the right child). A heap is a **complete binary tree**( meaning all levels are fully filled, except possibly the last one, which is filled from left to right) that can be implemented using a **list**. It can be used to implement *priority queue*. [you can look at it in both tree representation or list representation, check wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)#/media/File:Max-Heap-new.svg). This heap is different from **memory heap** since memory heap is diff concept.
   

#### common operation are:
1. **depth-first traversal** -> visiting nodes in a vertical order.
2. **level-first / breath-first traversal** -> visiting nodes in a level order, horizontally, always starting from top left.
3. **search** -> searching for a specific value in the tree, using either of the above traversal technique.

**NB:**
- **Breath-first search is not similar to breath-first traversal, also, depth-first search is not similar to depth-first traversal.** 
 - The aim of ***search*** is to find a specific node/value within the graph, the return types can be any of the following rather than void: 
   1. the node/value itself.
   2. index/position of the node/value being searched for.
   3. boolean of either true if the node/value exist or false if the node/value don't exist.
   4. collection of nodes/values that are being searched for.
 - **Traversal** is the process of visiting/accessing every node exactly once in a tree in specific order. 
 - The aim of **traverse** is to just visit all the vertices in the graph. In most cases, their is no return type in this case(void return).


##### applications of trees:
1. representing hierarchical data eg file systems, organization charts,xml / html / flutter widgets.
2. used for efficient searching and sorting -> binary search trees arrange elements in sorted order enabling faster lookup, insertion and deletion of data. B- Trees / B+ Trees are widely used to index data in databases, allowing faster retrieval of records based on key values.
3. parsing -> eg syntax trees, compilers and interpreters constructs syntax trees to represent the structure of code or documents enabling code analysis and translation.
4. Artificial intelligence -> decision trees model decision making processes, commonly used in machine learning algorithms for classification and prediction. Game trees, used in game AI to explore possible moves and their outcomes, aiding in strategy development.
5. network routing -> routing trees represent network topologies determining optimal paths for data transmission.

##### key points:
1. Trees share some similarities to linked lists, but, whereas linked-list nodes may
only link to one successor node, a tree node can link to many child nodes.
2. Every tree node, except for the root node, has exactly one parent node.
3. A root node has no parent nodes.
4. Leaf nodes have no child nodes.
5. Traversals, such as depth-first and level-first/breath-first traversals, work on multiple types
of trees. However, the implementation will be slightly different based on how the
tree is structured.


