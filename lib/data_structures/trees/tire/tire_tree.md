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
3. **deletion** -> delete a word from the trie tree. There are 4 cases when deleting a word in a trie:
   1. The word provided doesn't exist in trie tree. In this case we don't modify the trie.
   2. The text provide is not a word. In this case we don't modify the trie.
      nb: at this stage the text provided is a word and it does exist in the trie tree.
   3. The last letter of the word provided is represented by a non-leaf trieNode. In this case we just set isTerminating field of that trieNode to false. 
   4. The last letter of the word provided is represented by a leaf trieNode.In this case we just set isTerminating field of that trieNode to false and remove that tireNode then backtrack up while removing the parent tireNodes until you reach a trieNode whose isTerminating field is true (meaning that you have reach a leaf tireNode of another word).
4. **prefix matching** -> returns a collection of words that start with the given prefix. check if the prefix exist, if it doesn't exist, just return an empty list but if it does exist, return a list with all the word that start with the given prefix.

NB: trie can also be used to contain any type of character including special characters and numbers. Here am focusing on storing strings specifically words.

##### applications of binary tree:
1. Autocomplete feature and spell checker -> trie suggest possible completion for partially typed words, making them ideal for search bars, text editors and chat apps.
2. Pattern matching and search -> tire can quickly find patterns useful to tasks like plagiarism detection, DNA analysis and network packets filtering.
3. Data compression -> by sharing prefix among strings, trie can compress textual data more effectively than simpler data structures.
4. Longest Prefix Match in IP Address Lookup -> tries are employed to perform the longest prefix match, a crucial operation in networking when determining the next hop for a given IP address.
5. Contact Lists and PhoneBooks -> tries can be used to store and efficiently search through contact lists or phoneBooks, especially when searching for names or numbers with a common prefix.

##### key points:
1. Tires provides great performance metrics for prefix matching.
2. Trie are relatively memory efficient since individual nodes can be shared between many different values. For example, 'car', 'carbs' and 'care' can share three letters of the word.