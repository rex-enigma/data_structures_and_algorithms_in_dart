 Binary search tree a.k.a **BST**, **ordered / sorted binary tree**, is a specialized binary tree data structure that **effectively organizes and maintains sorted data**. The left child is smaller and right child is greater than the parent node.  It can be **unbalanced**( **unbalanced**: is a kind of binary tree where the depth of the two subtrees of any node can differ significantly.)
 
 Binary search tree data structure facilitates **fast lookup / search / contains**, **insert** and **removal / delete** operations with average case time complexity of O(log n), and worse case time complexity of O(n)


 #### A binary search tree imposes the following rules:
 1. Binary search tree may contain duplicate values/keys or not. If duplicate value/key is allowed, it should be placed either on the right child OR left child of the parent node whose having similar value/key.
 2. All values on the left side(left subtree) of a node are less than the value of the node itself. If duplicate values are allowed on a BST, then in this case ONLY the left child of a node should contain a value which is less than or equal to the value of node itself.
 3. All values on the right side(right subtree) of a node are greater than the value of the node itself. If duplicate values are allowed on a BST, then in this case ONLY the right child of a node should contain a value which is greater than or equal to the value of node itself.
 4. Binary search tree can only hold values that are comparable.

#### Note:
If duplicate values are allows in BST, the duplicate value should be placed either on the left child or right child of the parent node whose having similar value/key BUT not on both side.
In the binary search tree implementation, i have chosen NOT to allow duplicate values to reduce complexity.

#### diagrammatic illustration
                         10
                       /    \
                      /      \
               ______/_____  _\____
              |     5      || 15  |
              |    / \     || / \ |
              |   3   7    ||12 19|
              |  /\  /\    ||_____|  
              | 1 2 6  9   |  / \
              |____________|   |_ all values in this right subtree should be greater than 10
                   / \
all values in this _|
left subtree should be less that 10


#### common operation are:
1. **fast lookup / search / contains** -> Searching in a binary search tree for a specific key/value  if it exists, it can be programmed **recursively** or **iteratively**. Searching begins by examining the root node. If the tree is null, the key/value being searched for does not exist in the tree. Otherwise, if the key/value equals that of the root, the search is successful and the node is returned. If the key/value is less than that of the root, the search proceeds by examining the left subtree. Similarly, if the key/value is greater than that of the root, the search proceeds by examining the right subtree. This process is repeated until the key/value is found or not found.
   
2. **insert** -> New nodes are inserted as leaf nodes.
   
3. **remove / delete** -> deletion of a node, say Z ,from the binary search tree BST has three cases:
   1. **if Z is a leaf node:** the parent node of Z's leftChild or rightChild (depending on which side Z was on) gets replaced by *null* and consequently Z is removed from The BST.
   
   2. **if Z has one child:** the child node of Z gets elevated by modifying the parent node of Z to point to the child node(Z's child node), consequently taking Z's position in the tree.
   

   3. **if Z has both left and right child:** these are the steps:
      1. get the inOrder successor(the node with the smallest value in the right subtree of Z) of Z. It guarantee to not have a left child (but might have a right child).
      2. if the inOrder successor is Z's immediate right child, replace the value of Z with the value of inOrder successor and modify Z's right child to point to inOrder successor's right child.
      3. if the inOrder successor lies within Z's right subtree but is not Z's immediate right child, replace the value of Z with the value of inOrder successor and modify inOrder successor's parent's left child to point to inOrder successor's right child.

4. **traversal** -> depthFirst(inOrder, postOrder, preOrder), except levelFirst/breadthFirst traversal,are already implemented in the BinaryNode(check in binary_tree.dart file) in which binary search tree can use for node traversal. (you can also implement levelFirst/breathFirst Traversal directly in BinaryNode if you want to add that functionality in Binary search tree {port it from TreeNode in general_tree.dart file}).
   

##### applications of binary search tree:
1. BSTs can be used in encryption algorithms such as RSA, which is a public-key encryption algorithm used in secure communication protocols. RSA uses a BST to generate public and private keys.
2. BSTs can be used to compress data by storing frequently occurring values in a smaller space and less frequently occurring values in a larger space. This technique is used in many applications, including image and audio compression, data transmission, and file compression.
3. BSTs can be used to implement decision trees, which are used in machine learning and artificial intelligence to model decisions and predict outcomes. Decision trees are used in many applications, including medical diagnosis, financial analysis, and marketing research.
4. BSTs are used for indexing in databases.


##### key points:
1. BST is a powerful data structure for holding sorted data.
2. Elements of the binary search tree must be comparable. You can achieve this using a generic constraint or by supplying a closure to perform the comparison.
3. The time complexity for insert, remove and contains methods in a BST is O(log n).
4. Performance will degrade to O(n) as the tree becomes unbalanced. This is undesirable, but self-balancing trees such as the AVL tree can overcome the problem.


