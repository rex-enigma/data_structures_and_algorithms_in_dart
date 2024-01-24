- Trie a.k.a **prefix tree**, **digital tree** or **radix tree**, is a type of n-ary search tree used for locating specific keys from within a set. These keys are most often **strings**, with links between nodes defined not by the entire key, but by individual characters. In order to access a key (to recover its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each character in the key.

- In simple words: A trie is a tree data structure that is used to store a **string** character value in each node. A Node in a trie do not store the entire key, instead, it stores a part of the key usually a *string character* and by traversing down from the root node to a particular node n, we can build the key from those small parts of the key in which a common prefix of characters can be formed.

- a boolean value in a trie node is used to implement whether a string character represents the end of the word.
- Each node can have at most 26 other node references. These 26 node references represents all the 26 english alphabet characters / letters.
- Tries are particularly useful for tasks involving prefix matching and searching, auto-completion

##### diagrammatic illustration:

                           ( root )
                         /  /  |  \  \ 
                      (D) (C) (T) (A) (A)
                     /   /  \   \    \   \
                  (A) (A)   (U)  (O.) (D) (N.)
                 /   /         \         \   \
              (R) (T.)          (T.)      (D.)(T.)
             /                     \         \
         (T.)                       (E.)      (S.)
  
  - the dot on some of the characters indicate the end of a word.

#### common operation are:
1. **search / contains** -> check whether a given word / full key is present / exist in the trie tree.(The text provided MUST be a word not just any collection of text that doesn't form a word, because if its word false will alway be returned).
2. **insertion** -> insert a word in the trie tree. 
3. **deletion** -> delete a word from the trie tree. There are 3 cases when deleting a word in a trie:
   1. The word to be deleted is a prefix of other words. eg if we are to delete ***AN*** in the tree above, we have to be careful because is a prefix of anther word , ***ANT***.
   2. The word to be deleted share a common prefix with other words. eg if we are to delete ***CUTE*** in the tree above, we have to be careful because 'CUTE' shares ***CU*** prefix with the word ***CUT***.
   3. The word to be deleted does not share any common prefix with other words. eg if we are to delete ***DART***, we can just delete all the trieNodes holding the corresponding letters, since we are sure no multiple collections/words are sharing the trieNodes.
4. **prefix matching** -> returns a collection of words that start with the given prefix.

NB: trie can also be used to contain any type of character including special characters and numbers. Here am focusing on storing strings specifically words

##### applications of binary tree:

##### key points:
