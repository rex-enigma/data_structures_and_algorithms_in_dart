#### Definition:
- Binary search tree a.k.a **BST**, **ordered / sorted binary tree**, is a specialized binary tree data structure that **effectively organizes and maintains ordered / sorted data** in that, the left child node's value is always less and right child node's value is always greater than the parent node's value. It can be **unbalanced**( **unbalanced**: is a kind of binary tree where the depth of two subtrees of any node can differ significantly.)
 
 Binary search tree data structure facilitates **fast lookup / search / contains**, **insert** and **removal / delete** operations with average case time complexity of O(log n), and worse case time complexity of O(n)


 #### A binary search tree imposes the following rules:
 1. Binary search tree may contain duplicate keys or not. If duplicate key is allowed, it should be placed either on the left child OR right child of the parent node whose having similar key.
 2. All keys on the left side(left subtree) of a node are less than the key of the node itself. If duplicate keys are allowed on a BST, then in this case ONLY the left child of a node should contain a key which is less than or equal to the key of node itself.
 3. All keys on the right side(right subtree) of a node are greater than the key of the node itself. If duplicate keys are allowed on a BST, then in this case ONLY the right child of a node should contain a key which is greater than or equal to the key of node itself.
 4. Binary search tree can only hold keys that are comparable.

#### Note:
If duplicate keys are allows in BST, the duplicate key should be placed either on the left child or right child of the parent node whose having similar key BUT not on both side.
In the binary search tree implementation, i have chosen NOT to allow duplicate keys to reduce complexity.

#### Diagrammatic Illustration
```
                         10
                       /    \
                      /      \
               ______/_____  _\____
              |     5      || 15  |
              |    / \     || / \ |
              |   3   7    ||12 19|
              |  /\  /\    ||_____|  
              | 1 2 6  9   |   ^
              |____________|   |_ all keys in this right subtree should always be greater than 10
                   ^
all keys in this  _|
left subtree should always be less that 10
```

#### Common operation are:
1. **contains** -> checks if a given specific key exists. It can be programmed **recursively** or **iteratively**: Searching begins by examining the root node. If the tree is null, the key being searched for does not exist in the tree. Otherwise, if the key equals that of the root, the search is successful and the node is returned. If the key is less than that of the root, the search proceeds by examining the left subtree. Similarly, if the key is greater than that of the root, the search proceeds by examining the right subtree. This process is repeated until the key is found or not.
   
2. **insert** -> new key is inserted as leaf.
   
3. **remove** -> removes an existing key. Removal of a node that contains the key that we want to remove, say Z, from the binary search tree BST has three cases:
   
   1. **if Z is a leaf node:** these are the steps:
      1. If Z is the left child of its parent, set the parent's left child to point to null.
      2. If Z is the right child of its parent, set the parent's right child to point to null.
   
   2. **if Z has one child:** the child node of Z gets elevated by modifying the parent node of Z to point to the child Z's child node, consequently taking Z's position in the tree.
   
   3. **if Z has both left and right child:** these are the steps:
      1. get the inOrder successor(this is the node with the smallest key located in the leftMost node of the right subtree of Z) of Z. It guarantee to not have a left child (but might have a right child).
      2. if the inOrder successor is Z's immediate right child, replace the key of Z with the key of inOrder successor and modify Z's right child to point to inOrder successor's right child.
      3. if the inOrder successor lies within Z's right subtree but is not Z's immediate right child, replace the key of Z with the key of inOrder successor and modify inOrder successor's parent's left child to point to inOrder successor's right child.

4. **traversal** -> traverses though the binary tree. DepthFirst(inOrder, postOrder, preOrder), are already implemented in the TraversableBinaryNode(check in traversable_binary_node.dart file) which can be used for traversing functionality. LevelFirst/breathFirst traversal isn't yet implemented.
   

##### Applications of binary search tree:
1. BSTs can be used to compress data by storing frequently occurring keys in a smaller space and less frequently occurring keys in a larger space. This technique is used in many applications, including image and audio compression, data transmission, and file compression.
2. BSTs can be used to implement decision trees, which are used in machine learning and artificial intelligence to model decisions and predict outcomes. Decision trees are used in many applications, including medical diagnosis, financial analysis, and marketing research.
3. BSTs are used for indexing in databases.


##### key points:
1. BST is a powerful data structure for holding sorted data.
2. Elements of the binary search tree must be comparable. You can achieve this using a generic constraint or by supplying a closure to perform the comparison.
3. The time complexity for insert, remove and contains methods in a BST is O(log n).
4. Performance will degrade to O(n) as the tree becomes unbalanced. This is undesirable, but self-balancing trees such as the AVL tree can overcome the problem.


