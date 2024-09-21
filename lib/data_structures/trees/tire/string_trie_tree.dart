import 'package:dart_data_structure_and_algorithm/data_structures/trees/tire/trie_tree_interface.dart';

// small Note:
// Code Point: A code point is a unique number assigned to each character in the Unicode standard.It's an abstract
// concept representing a character's identity, regardless of how it's encoded. For example, the code
// point for the letter 'A' is U+0041.

// Code Unit: A code unit is a specific value used by an encoding scheme to represent a code point. It's a part
// of the encoding process, where the code point is translated into one or more code units.

// so characters are stored in memory as code units not code points

class StringTire implements Tire<String> {
  // in dart a String is a collection of UTF-16 code units( each code unit is a 16-bit number that represents a character). Therefore
  // you can only iterate on the String characters in their numerical form (which in this case the string characters will be of int type). Each
  // TireNode will hold an integer number that represent a character, that's why we are using int type for segment.
  TrieNode<int> root = TrieNode(segment: null, parent: null);

  // average and worse time complexity for insert is O(n) where n is the length of the string
  /// insert a word (collection of characters that is meaningful as a whole) in a trie tree.
  @override
  void insert(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      current.children[codeUnit] ??= TrieNode(segment: codeUnit, parent: current);
      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }

  // average and worse time complexity for contain is O(n) where n is the length of the string
  /// check whether a given word exist in the trie tree.
  @override
  bool contains(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) return false;
      current = child;
    }
    // if all the code units exist in the trie but don't form a 'complete' word, current.isTerminating for that last TireNode will be false
    // and we would like to return that otherwise if all code units exist in the trie and forms a 'complete' word, current.isTerminating for that
    // last TrieNode will be true and we would like to return that.
    return current.isTerminating;
  }

  // average and worse time complexity is O(n), where n represent the length of the string(# of the code units) that you are trying to remove
  /// removes a word from trie tree. If the argument provided is not a word or doesn't exist, no
  /// modification is done on the trie tree.
  @override
  void remove(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      final child = current.children[codeUnit];

      // handles the case where the word provided doesn't exist in this trie tree.
      if (child == null) return;
      current = child;
    }
    // handles the case where text provided is not a word.
    if (!current.isTerminating) return;

    // handles the case where the argument provided is a word, it exist in this trie tree and
    // the last letter in the word provided is represented by a non-leaf trieNode.
    current.isTerminating = false;

    // handles the case where the argument provided is a word, it exist in this trie tree and
    // the last letter in the word provided is represented by a leaf trieNode.
    while (current.parent != null && current.children.isEmpty && !current.isTerminating) {
      current.parent!.children.remove(current.segment);
      current = current.parent!;
    }
  }

  // worse case time complexity is O(n * m) where n represent the longest sequence matching the prefix and m represents
  // the number of sequences that  match the prefix
  /// returns a collection of words that start with the given prefix.
  @override
  List<String> matchPrefix(String prefix) {
    var current = root;
    for (var codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];

      // handles the case where the prefix doesn't exist in the tire tree.
      if (child == null) return [];
      current = child;
    }
    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> trieNode) {
    List<String> results = [];

    if (trieNode.isTerminating) results.add(prefix);

    for (final child in trieNode.children.values) {
      final codeUnit = child.segment!;
      results.addAll(
        _moreMatches('$prefix${String.fromCharCode(codeUnit)}', child),
      );
    }
    return results;
  }
}
