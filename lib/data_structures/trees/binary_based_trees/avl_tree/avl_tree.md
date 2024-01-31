- AVL tree a.k.a **balanced binary search tree**, is a self-balancing binary search tree that guarantees a logarithmic time complexity (O(log n)) for *search*, *insertion* and *deletion* operations. Its always balanced(**perfectly balanced** or **good enough balanced**[balanced], check *trees.md file* for these illustrations).

- To keep binary tree balanced, you'll need a way to **measure the balance of a tree**. AVL tree achieves this with ***height*** property in each node. The Height of a node is the longest downwards path from that node to a leaf node. If a particular child is *null*, its height is considered to be -1.

- ***relative height*** OR ***balance factor*** is an integer key computed from the difference between the leftChild's height and rightChild's height of an AVLNode. This balance factor is used to determine whether a particular AVlNode is balanced, if the balance factor is not within the range {-1,0,1}, rotations are performed to restore balance. A balanceFactor of 2 or -2 or something more extreme indicates an unbalanced tree. By checking after each insertion or deletion, you can guarantee that it will never be more extreme than a magnitude of two.

- Although more than one AVLNode may have a bad balancing factor, balancing **procedure** only needs to be performed on the bottom most AVLNode containing the invalid balance factor. 

### Rotations
- The procedures used to balance a AVl tree are known as **rotations**. There are 4 rotations in total, one for each of the 4 diff ways that a tree can be unbalanced. They are: **left rotation**, **right rotation**, **left-right rotation** and **right-left rotation**.

#### 1. left rotation(left-left rotation): 
- A single left rotation is performed when a node is inserted into the right most side of the right subtree leading to an unbalanced tree.
- The rotation is done on the bottom most AVLNode containing the invalid balance factor and the rightChild of that AVLNode(aka pivot), where that AVLNode's rightChild is set to pivot's leftChild and the pivot's leftChild is set to that AVLNode.
- Only the height of that AVLNode and pivot are affected and will need to be updated.

    ##### left rotation illustration
    - leftmost key indicate the **balance factor** , the right most key indicates the **AVLNode height** and the center key is the **AVLNode's key.**
   
    - In this case 40 is inserted resulting to unbalanced tree. This is one way in which a tree can be unbalanced.
``` 
            2(50)3                         1(50)2           
             /  \                           /  \
       -2(25)2  0(75)0    ------>      0(37)1  0(75)0
            \                           /  \
        -1(37)1                    0(25)0  0(40)0
             \
          0(40)0      
```
#### 2. right rotation(right-right rotation):
- A single right rotation is performed when a node is inserted into the left most side of the left subtree leading to an unbalanced tree.
- The rotation is done on the bottom most AVLNode containing the invalid balance factor and the leftChild of that AVLNode(aka pivot), where that AVLNode's leftChild is set to pivot's rightChild and the pivot's rightChild is set to that AVLNode.
- Only the height of that AVLNode and pivot are affected and will need to be updated.

    ##### right rotation illustration
    - leftmost key indicate the **balance factor**, the right most key indicates the **AVLNode height** and the center key is the **AVLNode's key.**

    - In this case 15 is inserted resulting to unbalanced tree. This is second way in which a tree can be unbalanced.
```
            2(50)3                         1(50)2           
             /  \                           /  \
        2(25)2  0(75)0     ------>     0(20)1  0(75)0
         /                              /  \
     1(20)1                        0(15)0  0(25)0
       /  
   0(15)0   
```

#### 3. right-left rotation:
- Two rotations are performed, first, right rotation is performed on the rightChild of the bottom most AVLnode containing the invalid balance factor and the leftChild of that (rightChild of that bottom most AVLNode), second, left rotation is performed on that bottom most AVLNode containing the invalid balance factor and the rightChild of that AVLNode(aka pivot).

    ##### right-left rotation illustration
    - leftmost key indicate the **balance factor**, the right most key indicates the **AVLNode height** and the center key is the **AVLNode's key.**

    - In this case 35 is inserted resulting to unbalanced tree. This is third way in which a tree can be unbalanced.
  
```
    first, right rotation is performed         second, left rotation is performed     
    on 1--> and 2-->.                          on 3--> and 4-->.

               2(50)3                             2(50)3                              1(50)2
                /  \                               /  \                                /  \
          -2(25)2  0(75)0     ---->    3-->  -2(25)2  0(75)0        ------>       0(35)1  0(75)0 
               \                                  \                                /  \
    1-->    1(37)1                     4-->   -1(35)1                          0(25)0 0(37)0
             /                                      \
    2-->   0(35)0                                0(37)0   
```

#### 4. left-right rotation:
- Two rotations are performed, first, left rotation is performed on the leftChild of the bottom most AVLNode containing the invalid balance factor and the rightChild of that (leftChild of that bottom most AVLNode), second, right rotation is performed on that bottom most AVLNode containing that invalid balance factor.

    ##### left-right rotation illustration
    - leftmost key indicate the **balance factor** and the right most key indicates the **AVLNode height**, the center key is the **AVLNode's key.**

    - In this case 15 is inserted resulting to unbalanced tree. This is forth way in which a tree can be unbalanced.
```
    first, left rotation is performed         second, right rotation is performed     
    on 1--> and 2-->.                         on 3--> and 4-->.

               2(50)3                                2(50)3                              1(50)2
                /  \                                  /  \                                /  \
           2(25)2  0(75)0     ---->     3-->     2(25)2  0(75)0        ------>       0(15)1  0(75)0 
            /                                     /                                   /  \
    1--> -1(10)1                        4-->  1(15)1                             0(10)0 0(25)0
              \                                /
    2-->   0(15)0                          0(10)0   
```
##### How will you decide which rotation to use!
- How will you decide which rotation to use! Their is a pattern when you look at those 4 different ways in which a tree can be unbalance. As stated earlier, by checking the balance of the tree after each insertion or deletion, you can guarantee that the balance factor of an AVLNode will never be more extreme than a magnitude of two if the tree is unbalanced. So, the bottom most AVLNode containing the invalid balance factor will have a balance factor of either 2 or -2.
- If the balance factor is 2,then the leftChild of that bottom most AVLNode is 'heavier'(contains more nodes) than the rightChild. This means that you will either use **right rotation** or **left-right rotation**. To further narrow down on which rotation to used from those two, you check the balance factor of the leftChild of that bottom most AVLNode containing the invalid balance factor of 2, if its 1, then we use **right rotation**, else if its -1, then we use **left right-rotation**.
- If the balance factor is -2,then, the rightChild of that bottom most AVLNode is 'heavier'(contains mor nodes) than the leftChild. This means that you will either use **left rotation** or **right-left rotation**. To further narrow down on which rotation to use from those two, you check the balance factor of the rightChild of that bottom most AVLNode containing the invalid balance factor of -2, if its -1, then we do **left rotation**, else if its 1, then we use **left-right rotation**.

##### simply: 
A -2 balance factor of an AVLNode indicates that the rightChild is heavier than the leftChild. Further, the rightChild of that AVLNode with a balance factor of -1 indicates that a **left rotation** need to be performed while 1 balance factor indicate that a **right-left rotation** need to be performed.

```
-2 : -1  --> left rotation.
-2 : 1   --> right-left rotation.
```

A 2 balance factor of an AVLNode indicates that the leftChild is heavier than the rightChild. Further, the leftChild of that AVLNode with a balance factor of 1 indicates that a **right rotation** need to be performed while -1 balance factor indicate that a **left-right rotation** need to be performed.

```
2 : 1    --> right rotation.
2 : -1   --> left-right rotation.
```

#### common operation are:
1. **fast lookup / search / contains** -> checking if a given specific key exists.
2. **insert** -> inserting a key while maintaining the balance of the AVL tree.
3. **remove / delete** -> removing a key while maintaining the balance of the AVL tree.
4. **left rotation** -> performing a left rotation when an AVLNode has a balance factor of -2 and its rightChild has a balance factor of -1.(NB: ***remember all this rotations left,right-left,right and left-right, is performed only on the bottom most AVLNode with invalid balance factor of either 2 or -2***).
5. **right-left rotation** -> performing a right-left rotation when an AVNode has a balance factor of -2 and its rightChild has a balance factor of 1.
6. **right rotation** -> performing a right rotation when an AVLNode has a balance factor of 2 and its leftChild has a balance factor of 1.
7. **left-right rotation** -> performing a left-right rotation when an AVLNode has a balance factor of 2 and its leftChild has a balance factor of -1.
8. **balance** -> balancing an AVL tree for each insertion and deletion of a key.
9. **traversal** -> traversing though the binary tree. DepthFirst(inOrder, postOrder, preOrder), except levelFirst/breathFirst traversal,are already implemented in the TraversableBinaryNode(check in traversable_binary_node.dart file) in which avl tree node is using for traversal.
   

#### applications of AVL tree:
1. Can be used to implement **set**, **map**, (even priority queue)
2. It is used to index huge records in a database and also to efficiently search in that.
3. Database applications, where insertions and deletions are less common but frequent data lookups are necessary. eg inventory system, library catalogs, customer relationship management.
4. Software that needs optimized search.
5. applied in storyline games.


#### key points:
1. A self-balancing tree avoid performance degradation by performing a balancing procedure whenever you add or remove elements in the tree.
2. AVl tree preserves balance by readjusting parts of the tree when the tree is no longer balanced.
3. Balance ia achieved by 4 types of tree rotations on node insertion and removal: **right rotation**, **left rotation**, **right-left rotation** and **left-right rotation**
4. - you can also add an operation that allow you to get a value of any type you specify stored in a node base on the given key when your data structure requirement need a AVL tree with that functionality. eg like the way map behaves

