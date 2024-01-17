- AVL tree a.k.a **balanced binary search tree**, is a self-balancing binary search tree that guarantees a logarithmic time complexity (O(log n)) for *search*, *insertion* and *deletion* operations. Its always balanced(**perfectly balanced** or **good enough balanced**[balanced], check *trees.md file* for these illustrations).

- To keep binary tree balanced, you'll need a way to **measure the balance of a tree**. AVL tree achieves this with ***height*** property in each node. The Height of a node is the longest downwards path from that node to a leaf node. If a particular child is *null*, its height is considered to be -1.

- ***relative height*** OR ***balance factor*** is an integer value computed from the difference between the leftChild's height and rightChild's height of an AVLNode. This balance factor is used to determine whether a particular AVlNode is balanced, if the balance factor is not within the range {-1,0,1}, rotations are performed to restore balance. A balanceFactor of 2 or -2 or something more extreme indicates an unbalanced tree. By checking after each insertion or deletion, you can guarantee that it will never be more extreme than a magnitude of two.

- Although more than one AVLNode may have a bad balancing factor, balancing **procedure** only needs to be performed on the bottom most AVLNode containing the invalid balance factor. 

- The procedures used to balance a AVl tree are known as **rotations**. There are 4 rotations in total, one for each of the 4 diff ways that a tree can be unbalanced. They are: **left rotation**, **right rotation**, **left-right rotation** and **right-left rotation**.

#### left rotation(left-left rotation):
- A single left rotation is performed when a node is inserted into the right most side of the right subtree leading to an unbalanced tree.
- The rotation is done on the bottom most AVLNode containing the invalid balance factor and the rightChild of that AVLNode(aka pivot), where that AVLNode's rightChild is set to pivot's leftChild and the pivot's leftChild is set to that AVLNode.
- Only the height of that AVLNode and pivot are affected and will need to be updated.

    ##### left rotation illustration
    - leftmost value indicate the **balance factor** and the right most value indicates the **AVLNode height**, the center value is the **AVLNode's value.**

    in this case 40 is inserted
    resulting to unbalanced tree

            2(50)3                         1(50)2           
             /  \                           /  \
       -2(25)2  0(75)0    ------>      0(37)1  0(75)0
            \                           /  \
        -1(37)1                    0(25)0  0(40)0
             \
          0(40)0      
  
#### right rotation(right-right rotation):
- A single right rotation is performed when a node is inserted into the left most side of the left subtree leading to an unbalanced tree.
- The rotation is done on the bottom most AVLNode containing the invalid balance factor and the leftChild of that AVLNode(aka pivot), where that AVLNode's leftChild is set to pivot's rightChild and the pivot's rightChild is set to that AVLNode.
- Only the height of that AVLNode and pivot are affected and will need to be updated.

    ##### right rotation illustration
    - leftmost value indicate the **balance factor** and the right most value indicates the **AVLNode height**, the center value is the **AVLNode's value.**

    in this case 15 is inserted
    resulting to unbalanced tree

            2(50)3                         1(50)2           
             /  \                           /  \
       -2(25)2  0(75)0     ------>     0(20)1  0(75)0
         /                              /  \
     1(20)1                        0(15)0  0(25)0
       /  
   0(15)0   

#### right-left rotation:
- Two rotations are performed, first, right rotation is performed on the rightChild of the bottom most AVLnode containing the invalid balance factor and the leftChild of that (rightChild of that bottom most AVLNode), second, left rotation is performed on that bottom most AVLNode containing the invalid balance factor and the rightChild of that AVLNode(aka pivot).

    ##### right-left rotation illustration
    - leftmost value indicate the **balance factor** and the right most value indicates the **AVLNode height**, the center value is the **AVLNode's value.**

    in this case 35 is inserted
    resulting to unbalanced tree

    first, right rotation is performs         second, left rotation is performed     
    on 1--> and 2-->.                         on 3--> and 4-->.

               2(50)3                             2(50)3                              1(50)2
                /  \                               /  \                                /  \
          -2(25)2  0(75)0     ---->    3-->  -2(25)2  0(75)0        ------>       0(35)1  0(75)0 
               \                                  \                                /  \
    1-->    1(37)1                     4-->   -1(35)1                          0(25)0 0(37)0
             /                                      \
    2-->   0(35)0                                0(37)0   

#### left-right rotation:
- Two rotations are performed, first, left rotation is performed on the leftChild of the bottom most AVLNode containing the invalid balance factor and the rightChild of that (leftChild of that bottom most AVLNode), second, right rotation is performed on that bottom AVLNode containing that invalid balance factor.

    ##### left-right rotation illustration
    - leftmost value indicate the **balance factor** and the right most value indicates the **AVLNode height**, the center value is the **AVLNode's value.**

    in this case 15 is inserted
    resulting to unbalanced tree

    first, left rotation is performs         second, right rotation is performed     
    on 1--> and 2-->.                         on 3--> and 4-->.

               2(50)3                                2(50)3                              1(50)2
                /  \                                  /  \                                /  \
          -2(25)2  0(75)0     ---->     3-->     2(25)2  0(75)0        ------>       0(15)1  0(75)0 
            /                                     /                                   /  \
    1-->  1(10)1                        4-->  1(15)1                             0(10)0 0(25)0
              \                                /
    2-->   0(15)0                          0(10)0   


#### common operation are:
1. **fast lookup / search / contains** -> 
2. **insert** -> 
   
3. **remove / delete** ->

4. **traversal** -> depthFirst(inOrder, postOrder, preOrder), except levelFirst/breathFirst traversal,are already implemented in the TraversableBinaryNode(check in traversable_binary_node.dart file) in which avl tree node is using for traversal.
   

##### applications of AVL tree:


##### key points:


