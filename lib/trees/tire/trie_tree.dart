class TrieNode<T> {
  TrieNode({this.keyPart, this.parent});
  // this keyPart represents a single character in a word or any character which when put together with other characters held in TireNodes forms a meaningful collection eg a word, ip address etc
  // is nullable because the TrieNode root doesn't have a keyPart.
  T? keyPart;

  // this will simplifies removing method.
  // is nullable because the TireNode root doesn't have a parent.
  TrieNode<T>? parent;

  Map<T, TrieNode<T>> children = {};

  // it marks the end of a collection( of a word,ip address etc)
  bool isTerminating = false;
}

class TrieTree {
  // in dart a String is a collection of UTF-16 code units( each code unit{should be code point} is a number that represent a character). Therefore
  // you can only iterate on the String characters in their numerical form (which in this case the string characters will be of int type). Each
  // TireNode will hold a number that represent a character, thats why we are using int type for keyPart.
  TrieNode<int> root = TrieNode(keyPart: null, parent: null);

  // average and worse time complexity for insert is O(n) where n is the length of the string
  /// insert a word (collection of characters) in a trie tree.
  void insert(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      current.children[codeUnit] ??= TrieNode(keyPart: codeUnit, parent: current);
      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }

  // average and worse time complexity for contain is O(n) where n is the length of the string
  /// check whether a given word exist in the trie tree.
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

  // Average and worse time complexity is O(n), where n represent the length of the string(# of the code units) that you are trying to remove
  /// Remove a word from trie tree. If the argument provided is not a word or doesn't exist, no
  /// modification is done on the trie tree.
  void remove(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      final child = current.children[codeUnit];
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

  // worse case time complexity is O(n * m) where n represent the longest collection matching the prefix and m represents
  // the number of collections that  match the prefix
  /// returns a collection of words that start with the given prefix.
  List<String> matchPrefix(String prefix) {
    var current = root;
    for (var codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      // handles the case where the prefix doesn't exist in the tire tree
      if (child == null) return [];
      current = child;
    }
    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> trieNode) {
    List<String> results = [];
    // handles the case where the prefix is a word by itself.
    if (trieNode.isTerminating) results.add(prefix);

    for (final child in trieNode.children.values) {
      final codeUnit = child.keyPart!;
      results.addAll(
        _moreMatches('$prefix${String.fromCharCode(codeUnit)}', child),
      );
    }
    return results;
  }
}
