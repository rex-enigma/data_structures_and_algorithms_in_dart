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

  /// insert a word (collection of characters) in a trie tree.
  void insert(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      current.children[codeUnit] ??= TrieNode(keyPart: codeUnit, parent: current);
      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }
}
