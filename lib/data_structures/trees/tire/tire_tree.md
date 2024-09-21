#### Definition:
- Trie a.k.a **prefix tree**, **digital tree** or **radix tree**, is a type of n-ary search tree used for locating specific **sequences** from within a set. These sequences can be words, ip address, phone number, DNA sequence etc. Each node in trie tree stores a **segment** of a sequence and its linked to other nodes. In order to access a sequence (to get its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each segment of the sequence.

   - **segment** -> the smallest manageable part | piece of a sequence. eg in the word, "book", the segments are 'b','o','o', and 'k'.
   - **sequence** -> a series of segments combined to form a meaningful whole. eg for segments 'b','o','o', and 'k', the sequence is "book".

##### example to illustrate sequence & segment
```
example 1: string tire

   segment segment segment segment  
      |      |       |       |       book -> sequence
      b      o       o       k

example 2: ip-address tire
   
   segment segment segment segment  
      |      |       |       |       192.168.10.5 -> sequence
     192    168     10       5  

example 3: phone-number trie

   segment segment segment segment segment segment segment segment segment segment
      |      |       |       |       |       |       |       |       |       |        +254712345678 -> sequence
    +254     7       1       2       3       4       5       6       7       8 
   
example 4: DNA trie (can be string represented or each segment can be an object storing metadata)
   
   segment segment segment segment  
      |      |       |       |       ATGCGTACGTTAGC -> sequence
     ATG    CGT     ACG     TTAGC  

```
- a boolean value in a trie node is used to indicate whether a segment represents the end of the sequence.
  
##### Note:
- In String tire, each node can have at most 26 other node references. These 26 node references represents all the 26 english alphabet characters / letters.
  
- Tries are particularly useful for tasks involving prefix matching and searching, auto-completion


##### diagrammatic illustration of a trie tree (StringTrie representation):
```
                          ( root )
                         /  /  |  \  
                      (D) (C) (T) (A)---\
                     /   /  \   \    \   \
                  (A) (A)   (U)  (O.) (D) (N.)
                 /   /         \         \   \
              (R) (T.)          (T.)      (D.)(T.)
             /                     \         \
         (T.)                       (E.)      (S.)
  
  - the dot on some of the characters indicate the end of a word.
```

#### Common operation are:
1. **contains** -> checks whether a given sequence is present / exist in the trie tree.
2. **insert** -> inserts a sequence in the trie tree. 
3. **remove** -> removes a sequence from the trie tree. There are 4 cases when removing a sequence in a trie:
   
   1. The sequence provided doesn't exist in trie tree. In this case we don't modify the trie.
   2. The collection of segments provided doesn't form a sequence. In this case we don't modify the trie.
      nb: at this stage the collection of segments provided is a sequence and it does exist in the trie tree.
   3. The last segment in sequence provided is represented by a non-leaf trieNode. In this case we just set isTerminating field of that trieNode to false.(now this is how a sequence is removed.)
   4. The last segment in sequence provided is represented by a leaf trieNode.In this case we just set isTerminating field of that trieNode to false and remove that tireNode then backtrack up while removing the parent tireNodes until you reach a trieNode whose isTerminating field is true (meaning that you have reach a leaf tireNode of another sequence).
   
4. **matchPrefix** -> returns a collection of sequences that start with the given prefix. check if the prefix exist, if it doesn't exist, just return an empty list but if it does exist, return a list with all the sequences that start with the given prefix.


##### Applications of binary tree:
1. Autocomplete feature and spell checker -> trie suggest possible completion for partially typed words, making them ideal for search bars, text editors and chat apps.
2. Pattern matching and search -> tire can quickly find patterns useful to tasks like plagiarism detection, DNA analysis and network packets filtering.
3. Data compression -> by sharing prefix among strings, trie can compress textual data more effectively than simpler data structures.
4. Longest Prefix Match in IP Address Lookup -> tries are employed to perform the longest prefix match, a crucial operation in networking when determining the next hop for a given IP address.
5. Contact Lists and PhoneBooks -> tries can be used to store and efficiently search through contact lists or phoneBooks, especially when searching for names or numbers with a common prefix.

##### key points:
1. Tires provides great performance metrics for prefix matching.
2. Trie are relatively memory efficient since individual nodes can be shared between many different values. For example, 'car', 'carbs' and 'care' can share the first three letters of the word.