Binary tree is a tree data structure where each node has at MOST two children, often referred to as **left** and **right** children. It can be **unbalanced**(is a kind of binary tree where the depth of the two subtrees of any node can differ significantly.).

Binary trees serve as the basis for many tree structures and algorithms.

#### Traversal algorithms(Types of depth-first traversal):
 pre-order, post-order and in-order traversal algorithms are best described by a tree image check [visual representation of the traversal algorithms in Baeldung website](https://www.baeldung.com/cs/depth-first-traversal-methods).

#### common operation are:
1. **pre-order traversal** -> action → left → right. 
2. **in-order traversal** -> left → action → right. 
3. **post-order traversal** -> left → right → action.
   

##### applications of binary tree:
1. Used to implement binary search tree, heap(a.k.a binary heap)
2. Huffman Coding Trees -> Binary trees are employed in Huffman coding, a compression algorithm. Huffman trees are used to create variable-length codes for characters, with frequently used characters having shorter codes, resulting in more efficient compression.
3. Syntax Trees -> In compilers and parsing, binary trees are used to represent the hierarchical structure of the syntax of programming languages. Each node in the tree corresponds to a syntactic element, and the children represent its components.

##### key points:
1. all the first 3 traversal algorithm have both time and space complexity of 0(n).
2. A binary tree is a tree where each node has at most two children, often referred to
as the left and right children.
3. Tree traversal algorithms visit each node in the tree once.
4. In-order traversal recursively visits the left child first, then the current parent
node, and finally the right child.
5. Pre-order traversal visits the parent node first, followed by the child nodes.
6. Post-order traversal visits the child nodes before the parent nodes.