A tree is an abstract data type that represent a hierarchical tree structure with a set of connect nodes.

**Traversal** -> in a non-linear data structure like a tree is the process of visiting / accessing each node in a tree in specific order.

Each node can be connected to many children(depending on the type of tree) but must be connect to ONLY one parent, expect for the *root* node which has no parent.

Each child node can be treated like the root node of its own subtree, making recursion a useful technique for tree traversal.

#### Terminologies
1. perfect balanced -> every leaf node is as the same depth in the tree, and every internal node has the same number of children.
2. good enough balanced -> 
3. unbalanced

#### Properties

#### Types of trees:
Trees can be categories base on **the nodes' values** eg binary search tree, AVL tree, red-back tree etc OR  based on **the number of children** eg binary tree, ternary tree, N-ary tree etc OR other forms categories.

**Here am listing a mix of diff types of trees that i will be working on not based on any category:**

1. **Binary tree** -> is a tree data structure where each node has at MOST two children, often referred to as **left** and **right** children. It can be **unbalanced**.
   
2. **Binary search tree** -> a.k.a **BST**, **ordered / sorted binary tree**, is a specialized binary tree data structure that effectively organizes and maintains sorted data. The left child is smaller and right child is greater than the parent node.  It can be **unbalanced**
   
3. **AVL tree** -> a.k.a balanced binary search tree, is a self-balancing binary search that guarantees a logarithmic time complexity (O(log n)) for search,insertion,and deletion operations. Its always balanced(perfect balanced or good enough balanced[balanced]).

    - **perfectly balance**: every leaf node is as the same depth in the tree, and every    internal node has the same number of children.
                            ___
                            |_|
                            / \
                           /   \
                          /     \
                        _/_     _\_
                        |_|     |_|  
                        / \     / \
                      _/_  \_ _/_ _\_
                      |_| |_| |_| |_|

    - **good enough balance** / **balanced**:   is a more flexible term that doesn't necessarily imply strict adherence to perfect balance but ensures a reasonably balanced structure.
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

    - **unbalanced**: is a binary tree where the depth of the two subtrees of any node can differ significantly.
                            ___                  ___
                            |_|                  |_|
                            /                    /
                           /                   _/_
                          /                    |_|
                        _/_                    /
                        |_|                  _/_
                        / \                  |_|
                      _/_ _\_                /
                      |_| |_|              _/_
                                           |_|  
4. **Tries** -> a.k.a prefix tree or digital tree, is a type of n-ary search tree used for locating specific keys from within a set. These keys are most often **strings**, with links between nodes defined not by the entire key, but by individual characters. In order to access a key (to recover its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each character in the key.
   
5. **Heap** -> a.k.a binary heap, is a specialized tree based data structure that satisfies the heap property, ensuring that a value of a parent node is always greater that or equal to(in a max **heap**) or less that or equal to(in a min **heap**) the value of its children. A heap is a **complete binary tree**( meaning all levels are fully filled, except possibly the last one, which is filled from left to right) that can be implemented using a **list**. [you can look at it in both tree representation or list representation, check wikipedia](https://en.wikipedia.org/wiki/Heap_(data_structure)#/media/File:Max-Heap-new.svg)
   

#### common operation are:

##### applications of trees:

##### key points


resume from this thoughts:
 even though a binary search tree maintains sorted data, it can be unbalanced. That why a more specialized binary search tree was created to make sure the structure is awlays balanced(perfect balanced or good enough balanced), this tree is called AVL tree.

