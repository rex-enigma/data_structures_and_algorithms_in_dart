#### Definition:
- AVL tree a.k.a **balanced binary search tree** / **Self-Balancing Binary Search Tree**, is a self-balancing binary search tree(self-balancing ordered tree) that guarantees a logarithmic time complexity (O(log n)) for *search*, *insertion* and *deletion* operations. Its always balanced(**perfectly balanced** or **good enough balanced** | **balanced**, check *trees.md file* for the illustrations).

- To keep binary tree balanced, you'll need a way to **measure the balance of a tree**. AVL tree achieves this with ***height*** property in each node. The Height of a node is the `number of edges` on the longest downward path from a given node to a leaf node. If a particular child is *null*, its height is considered to be -1.
- Given an AVLNode, the height of it can be gotten using the formula ***1 + math.max(leftChildHeight, rightChildHeight)***, were the`max` expression will return the larger of left and right child heights, and then 1 is added to account for the edge linking the current AVLNode to the child having the tallest height.

- ***relative height*** OR ***balance factor*** is an integer key computed from the difference between the leftChild's height and rightChild's height of an AVLNode. This balance factor is used to determine whether a particular AVlNode is balanced, if the balance factor is not within the range {-1,0,1}, **rotations** are performed to restore balance. A balanceFactor of 2 or -2 or something more extreme indicates an unbalanced tree. By checking after each insertion or deletion, you can guarantee that it will never be more extreme than a magnitude of two.

- Although more than one AVLNode may have a bad balancing factor, balancing **procedure** only needs to be performed on the bottom most AVLNode containing the invalid balance factor. 

#### Rotations:
- The procedures used to balance a AVl tree are known as **rotations**. There are 4 rotations in total, one for each of the 4 diff ways that a tree can be unbalanced. They are: **left rotation**, **right rotation**, **left-right rotation** and **right-left rotation**.

##### 1. left rotation(left-left rotation): 
- A single left rotation is performed when a node is inserted into the right most side of the right subtree leading to an unbalanced tree.
- The rotation is done on the bottom most AVLNode containing the invalid balance factor(lets call it Z) and its right child, called the pivot, where:
  
    1. The pivot's left child is relocated and set as the right child of Z,
    2. Then, the pivot replaces Z as the root of the subtree,
    3. Finally, Z is relocated and set as the left child of the pivot.
   
- Only the height of Z and pivot are affected and will need to be updated.

    ##### left rotation illustration
    - leftmost key indicate the **balance factor**, the right most key indicates the **AVLNode height** and the center key is the **AVLNode's key.**
   
    - In this case, 40 is inserted resulting to unbalanced tree. This is the first way in which a tree can be unbalanced.
``` 
            2(50)3                         1(50)2           
             /  \                           /  \
       -2(25)2  0(75)0    ------>      0(37)1  0(75)0
            \                           /  \
        -1(37)1                    0(25)0  0(40)0
             \
          0(40)0      
```
##### 2. right rotation(right-right rotation):
- A single right rotation is performed when a node is inserted into the left most side of the left subtree leading to an unbalanced tree.
- The rotation is done on the bottom most AVLNode containing the invalid balance factor (lets call it Z) and its left child, called pivot, where: 
  
   1. The pivot's right child is relocated and set as the left child of Z,
   2. Then, the pivot replaces Z as the root of the subtree,
   3. Finally, Z is relocated and set as the right child of the pivot.
   
- Only the height of Z and pivot are affected and will need to be updated.

    ##### right rotation illustration
    - leftmost key indicate the **balance factor**, the right most key indicates the **AVLNode height** and the center key is the **AVLNode's key.**

    - In this case, 15 is inserted resulting to unbalanced tree. This is the second way in which a tree can be unbalanced.
```
            2(50)3                         1(50)2           
             /  \                           /  \
        2(25)2  0(75)0     ------>     0(20)1  0(75)0
         /                              /  \
     1(20)1                        0(15)0  0(25)0
       /  
   0(15)0   
```

##### 3. right-left rotation:
- Two rotations are performed, first, right rotation is performed on the right Child of the bottom most AVLnode containing the invalid balance factor and its left child. Second, left rotation is performed on that bottom most AVLNode containing the invalid balance factor and its right child, called pivot.
    ##### right-left rotation illustration
    - leftmost key indicate the **balance factor**, the right most key indicates the **AVLNode height** and the center key is the **AVLNode's key.**

    - In this case, 35 is inserted resulting to unbalanced tree. This is the third way in which a tree can be unbalanced.
  
```
    first, right rotation is performed         second, left rotation is performed     
    on 1--> and 2-->.                          on 3--> and 4-->.

               2(50)3                             2(50)3                              1(50)2
                /  \                               /  \                                /  \
          -2(25)2  0(75)0     ---->    3-->  -2(25)2  0(75)0          ---->       0(35)1  0(75)0 
               \                                  \                                /  \
    1-->    1(37)1                     4-->   -1(35)1                          0(25)0 0(37)0
             /                                      \
    2-->   0(35)0                                0(37)0   
```

##### 4. left-right rotation:
- Two rotations are performed, first, left rotation is performed on the left child of the bottom most AVLNode containing the invalid balance factor and its right Child of that. Second, right rotation is performed on that bottom most AVLNode containing the invalid balance factor and its left child, called pivot.

    ##### left-right rotation illustration
    - leftmost key indicate the **balance factor** and the right most key indicates the **AVLNode height**, the center key is the **AVLNode's key.**

    - In this case, 15 is inserted resulting to unbalanced tree. This is the forth way in which a tree can be unbalanced.
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
##### How to decide which rotation to use:
- Their is a pattern when you look at those 4 different ways in which a tree can be unbalance. As stated earlier, by checking the balance of the tree after each insertion or deletion, you can guarantee that the balance factor of an AVLNode will never be more extreme than a magnitude of 2 if the tree is unbalanced. So, the bottom most AVLNode containing the invalid balance factor will always have a balance factor of either 2 or -2.
  
- If the balance factor is 2, then the left child of that bottom most AVLNode is 'heavier'(contains more nodes) than the right child. This means that you will either use **right rotation** or **left-right rotation**. To further narrow down on which rotation to used from those two, you check the balance factor of the left child of that bottom most AVLNode containing the invalid balance factor of 2, if its 1, then you use **right rotation**, else if its -1, then you use **left-right rotation**.
  
- If the balance factor is -2, then the right child of that bottom most AVLNode is 'heavier'(contains mor nodes) than the left child. This means that you will either use **left rotation** or **right-left rotation**. To further narrow down on which rotation to use from those two, you check the balance factor of the right child of that bottom most AVLNode containing the invalid balance factor of -2, if its -1, then you do **left rotation**, else if its 1, then you use **left-right rotation**.

##### simply: 
A `-2` balance factor of an AVLNode indicates that the right child is heavier than the left child. Further, the right child of that AVLNode with a balance factor of -1 indicates that a **left rotation** need to be performed while 1 balance factor indicate that a **right-left rotation** need to be performed.

```
-2 : -1  --> left rotation.
-2 : 1   --> right-left rotation.
```

A` 2` balance factor of an AVLNode indicates that the left child is heavier than the right child. Further, the left child of that AVLNode with a balance factor of 1 indicates that a **right rotation** need to be performed while -1 balance factor indicate that a **left-right rotation** need to be performed.

```
2 : 1    --> right rotation.
2 : -1   --> left-right rotation.
```

#### Common operation are:
1. **contains** -> checks if a given specific key exists. Returns true if the key exists otherwise, false is returned.
2. **insert** -> inserts a key while maintaining the balance of the AVL tree.(In my implementation, duplicate keys will be discarded).
3. **remove** -> removes a key while maintaining the balance of the AVL tree. Removal of a node that contains the key that we want to remove, say Z, from the AVL tree has three cases:
   
   1. **if Z is a leaf node:** these are the steps:
      1. If Z is the left child of its parent, set the parent's left child to point to null.
      2. If Z is the right child of its parent, set the parent's right child to point to null.
   
   2. **if Z has one child:** the child node of Z gets elevated by modifying the parent node of Z to point to the child Z's child node, consequently taking Z's position in the tree.
   
   3. **if Z has both left and right child:** these are the steps:
      1. get the inOrder successor(this is the node with the smallest key located in the leftMost node of the right subtree of Z) of Z. It guarantee to not have a left child (but might have a right child).
      2. if the inOrder successor is Z's immediate right child, replace the key of Z with the key of inOrder successor and modify Z's right child to point to inOrder successor's right child.
      3. if the inOrder successor lies within Z's right subtree but is not Z's immediate right child, replace the key of Z with the key of inOrder successor and modify inOrder successor's parent's left child to point to inOrder successor's right child.
   
- After applying removal procedure for a specific case, rotation is applied if the subtree including its root becomes unbalanced.
   
4.  **traversal** -> traverses though the AVL tree. DepthFirst(inOrder, postOrder, preOrder), are already implemented in the TraversableBinaryNode(check in traversable_binary_node.dart file) which can be used for traversing functionality. LevelFirst/breathFirst traversal isn't yet implemented.

#### Internal private helper operations:
1. **leftRotate** -> performs a left rotation when an AVLNode has a balance factor of -2 and its right child has a balance factor of -1.(NB: ***remember all this rotations: left,right-left,right and left-right, are performed only on the bottom most AVLNode with invalid balance factor of either 2 or -2***).
2. **rightLeftRotate** -> performs a right-left rotation when an AVNode has a balance factor of -2 and its right child has a balance factor of 1.
3. **rightRotate** -> performs a right rotation when an AVLNode has a balance factor of 2 and its left child has a balance factor of 1.
4. **leftRightRotate** -> performs a left-right rotation when an AVLNode has a balance factor of 2 and its lef cChild has a balance factor of -1.
5. **balance** -> balances an AVL tree for each insertion and deletion of a key. (inspects the balance factor of an AVLNode to determine whether a rotation needs to be performed.)

#### Applications of AVL tree:
1. Can be used to implement **set**, **map**, (even priority queue)
2. It is used to index huge records in a database and also to efficiently search in that.
3. Database applications, where insertions and deletions are less common but frequent data lookups are necessary. eg inventory system, library catalogs, customer relationship management.
4. Software that needs optimized search.
5. Applied in storyline games.


#### Key points:
1. A self-balancing tree avoid performance degradation by performing a balancing procedure whenever you add or remove elements in the tree.
2. AVl tree preserves balance by readjusting parts of the tree when the tree is no longer balanced.
3. Balance ia achieved by 4 types of tree rotations on node insertion and removal: **right rotation**, **left rotation**, **right-left rotation** and **left-right rotation**
4. You can enhance your AVL tree implementation by adding an operation that retrieves a value of any specified type stored in a node based on a given key. This functionality would make your AVL tree behave like a map, allowing for efficient access to values associated with unique keys when your data structure requirements necessitate it.

