#### Definition:
- Binary tree is a tree data structure where each node has at MOST two children, often referred to as **left** and **right** children. It can be **unbalanced**(is a kind of binary tree where the depth of the two subtrees of any node can differ significantly.).

- Binary trees serve as the basis for many tree structures and algorithms.
- 
- Pre-order, post-order and in-order are types of **depth-first traversal** used in a binary tree.

#### Traversal algorithms(Types of depth-first traversal):
 pre-order, post-order and in-order traversal algorithms are best described by a tree image check [visual representation of the traversal algorithms in Baeldung website](https://www.baeldung.com/cs/depth-first-traversal-methods).

#### Common operation are:
1. **insert** -> adds a new key to the binary tree. Deciding which side to insert a key in binary tree is a little bit tricky since it doesn't maintain any order, different strategies need to be employed to make it possible,eg. using level/breath first traversal to insert keys in empty position from the left to right going downward each level or through special requirements.(*Haven't implemented it yet*).
2. **delete** -> deletes an existing key from the binary tree. Deleting a leaf node or internal node/parent node (containing the key) with one child isn't hard, what is hard is deleting an internal node with two children, in this case diff strategies need to be employed since the nodes don't maintain any order.(*Haven't implemented it yet*).
3. **traverse** -> traverses though the binary tree. These depth-first traversal methods are inherited from TraversableBinaryNode abstract class from traversal_binary_node.dart file
   1. **pre-order traversal** -> action → left → right. 
   2. **in-order traversal** -> left → action → right. 
   3. **post-order traversal** -> left → right → action.
   

#### Applications of binary tree:
1. Can be used to implement **binary search tree**, **heap(a.k.a binary heap)**
2. Huffman Coding Trees -> Binary trees are employed in Huffman coding, a compression algorithm. Huffman trees are used to create variable-length codes for characters, with frequently used characters having shorter codes, resulting in more efficient compression.
3. Syntax Trees -> In compilers and parsing, binary trees are used to represent the hierarchical structure of the syntax of programming languages. Each node in the tree corresponds to a syntactic element, and the children represent its components.

#### Key points:
1. All the first 3 traversal algorithms have both time and space complexity of O(n).
2. A binary tree is a tree where each node has at most two children, often referred to
as the left and right children.
3. Tree traversal algorithms visit/access each node in the tree once.
4. InOrder traversal recursively visits the left child first(performing an action to it first), then the current parent node, and finally the right child.
5. PreOrder traversal visits the parent node first(performing an action to it first), followed by the child nodes.
6. PostOrder traversal visits the children nodes first(performing an action to them first) before the parent nodes.