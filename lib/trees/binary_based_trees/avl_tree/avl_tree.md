AVL tree a.k.a **balanced binary search tree**, is a self-balancing binary search tree that guarantees a logarithmic time complexity (O(log n)) for *search*, *insertion* and *deletion* operations. Its always balanced(**perfectly balanced** or **good enough balanced**[balanced], check *trees.md file* for these illustrations).

To keep binary tree balanced, you'll need a way to **measure the balance of a tree**. AVL tree achieves this with ***height*** property in each node. The Height of a node is the longest downwards path from that node to a leaf node.

***relative height*** OR ***balance factor*** is an integer value computed from the difference between the leftChild's height and rightChild's height of an AVLNode. This balance factor is used to determine whether a particular AVlNode is balanced, if the balance factor is not within the range {-1,0,1}, rotations are performed to restore balance. If a particular child is *null*, its height is considered to be -1.

Although more than one AVLNode may have a bad balancing factor, balancing **procedure** only needs to be performed on the bottom most AVLNode containing the invalid balance factor.                    

The procedures used to balance a AVl tree are known as **rotations**. There are 4 rotations in total, one for each of the 4 diff ways that a tree can be unbalanced. They are: **left rotation**, **right rotation**, **left-right rotation** and **right-left rotation**.

#### left rotation(left-left rotation):
A single left rotation is performed when an AVLnode is inserted into the right subtree leading to an unbalanced tree.

#### right rotation(right-right rotation):




#### common operation are:
1. **fast lookup / search / contains** -> 
2. **insert** -> 
   
3. **remove / delete** ->

4. **traversal** -> depthFirst(inOrder, postOrder, preOrder), except levelFirst/breathFirst traversal,are already implemented in the TraversableBinaryNode(check in traversable_binary_node.dart file) in which avl tree node is using for traversal.
   

##### applications of AVL tree:


##### key points:


