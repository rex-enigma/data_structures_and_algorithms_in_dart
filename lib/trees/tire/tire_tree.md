- Trie a.k.a **prefix tree**, **digital tree** or **radix tree**, is a type of n-ary search tree used for locating specific keys from within a set. These keys are most often **strings**, with links between nodes defined not by the entire key, but by individual characters. In order to access a key (to recover its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each character in the key.

- In simple words: A trie is a tree data structure that is used to store a **string** character value in each node. a Node in a trie do not store the entire key, instead, it stores a part of the key usually a *string character* and by traversing down from the root node to a particular node n, we can build the key from those small parts of the key in which a common prefix of characters can be formed.

- a boolean value in a trie node is used to implement whether a string character represents the end of the word.
  
- a prefix matching can be done efficiently in trie tree data structure.

##### diagrammatic illustration:

                           ( root )
                         /  /  |  \  \ 
                      (D) (C) (T) (A) (Z)
                     /   /  \   \    \   \
                  (A) (A)   (U)  (o.) (D.)(o)
                 /   /         \         \   \
              (R) (T.)          (T.)      (D.)(o.)
             /                     \         \
         (T.)                       (E.)      (S.)
  
  - the dot on some of the characters indicate the end of a word.

#### common operation are:
1. search / contains ->
2. insertion ->
3. deletion -> 
4. prefix matching ->
5. traversal ->


##### applications of binary tree:

##### key points:
