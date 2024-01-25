import 'package:dart_data_structure_and_algorithm/trees/tire/trie_tree.dart';

// challenge 1: Additional properties
// some notable operations are missing in StringTrie, argument the current implementation of the StringTrie by
// adding the following properties:
/* 
1. An 'allWords' property that returns all the collections/words in the StringTrie.
2. A 'WordCount' property that tells you how many words are currently in the StringTrie
3. An 'isEmpty' property that returns true if the StringTrie is empty, false otherwise.
*/

extension AdditionalProperties on StringTire {
  /// Check whether StringTire is empty(doesn't have any word).
  bool get isEmpty => root.children.isEmpty;

  /// Returns all words from this StringTrie
  List<String> get allWords {
    List<String> allWords = [];
    if (isEmpty) return allWords;

    for (var child in root.children.values) {
      allWords.addAll(_moreWords(String.fromCharCode(child.keyPart!), child));
    }

    return allWords;
  }

  List<String> _moreWords(String text, TrieNode<int> trieNode) {
    List<String> results = [];
    if (trieNode.isTerminating) results.add(text);

    for (var child in trieNode.children.values) {
      final codeUnit = child.keyPart;
      results.addAll(
        _moreWords('$text${String.fromCharCode(codeUnit!)}', child),
      );
    }
    return results;
  }

  /// The total number of words in the StingTrie
  int get wordCount => allWords.length;
}

/* 
the above solution has a performance cost in terms of time when getting allWords and when getting wordCount since the StingTrie has
to be traversed every time we want to get any of those two values. The better options it to keep track of any word
when inserted or removed in a separate data structure such as set or List and also keeping track of the wordCount in
the same way. The advantage of the above solution is that since we haven't used a those separate additional data structures, memory
space is saved.
*/

// book's solution for challenge 1
// modifies both insert and remove operation and adds a set / list to keep track of the words when inserted or removed.
// the wordCount value would be gotten from getting the length of the set / list and checking if  StringTrie is empty would be gotten from
// checking if the set / list is empty.
/* 
final Set<String> _allStrings = {};
Set<String> get allStrings => _allStrings;

// find the line current.isTerminating = true and the following just below the that line:
_allStrings.add(text);

// find the line current.isTerminating = false and add the following just below that line:
_allStrings.remove(text);

int get length => _allStrings.length;
bool get isEmpty => _allStrings.isEmpty;

*/

// challenge 2: Generic Trie
// Make a new class named Trie that handles any iterable collection. Implement the 'insert', 'contains' and
// 'remove' methods

// The generic type 'collectionT' must be a concrete type that is a either a type or subtype of Iterable<keyPartE>
// this ensures that the keyPart field type of TireNode is similar to a collection's element type.
class Trie<KeyPartT, CollectionT extends Iterable<KeyPartT>> {
  TrieNode<KeyPartT> root = TrieNode(keyPart: null, parent: null);

  // add a collection to this trie tree.
  void insert(CollectionT collection) {
    var current = root;
    for (KeyPartT element in collection) {
      current.children[element] ??= TrieNode<KeyPartT>(keyPart: element, parent: current);
      current = current.children[element]!;
    }
    current.isTerminating = true;
  }

  /// check if a collection exist in this trie tree.
  bool contain(CollectionT collection) {
    var current = root;
    for (KeyPartT element in collection) {
      final child = current.children[element];
      if (child == null) return false;
      current = child;
    }
    // if all the code units exist in the trie but don't form a 'complete' word, current.isTerminating for that last TireNode will be false
    // and we would like to return that otherwise if all code units exist in the trie and forms a 'complete' word, current.isTerminating for that
    // last TrieNode will be true and we would like to return that.
    return current.isTerminating;
  }

  /// remove a collection from this trie tree.
  void remove(CollectionT collection) {
    var current = root;
    for (KeyPartT element in collection) {
      final child = current.children[element];
      // handles the first case.
      if (child == null) return;
      current = child;
    }
    // handles the second case.
    if (!current.isTerminating) return;

    // handles the third and partly the forth case.
    current.isTerminating = false;

    // handles the forth case.
    while (current.parent != null && current.children.isEmpty && !current.isTerminating) {
      current.parent!.children.remove(current.keyPart);
      current = current.parent!;
    }
  }
}
