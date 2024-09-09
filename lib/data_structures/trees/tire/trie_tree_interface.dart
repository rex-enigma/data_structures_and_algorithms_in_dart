class TrieNode<T> {
  TrieNode({this.segment, this.parent});
  // this segment represents a single character which when put together with
  // other characters held in TireNodes forms a meaningful sequence
  // eg a word, phone number, ip address, DNA sequence etc.

  // is nullable because the TrieNode root doesn't have a segment.
  T? segment;

  // this will simplify removing method.
  // is nullable because the TireNode root doesn't have a parent.
  TrieNode<T>? parent;

  Map<T, TrieNode<T>> children = {};

  // it marks the end of a sequence(of a word,ip address, DNA sequence etc)
  bool isTerminating = false;
}

abstract class Tire<T> {
  // average and worse time complexity for insert is O(n) where n is the number of segments in the sequence(length of the sequence).
  // this sequence can be a word, ip address, phone number, DNA etc
  /// inserts a sequence of characters in a trie tree. (reminder: the sequence should be meaningful as a whole)
  void insert(T sequence);

  // average and worse time complexity for contain is O(n) where n is the number of segments in the sequence(length of the sequence).
  /// checks whether a given sequence exist in the trie tree.
  bool contains(T sequence);

  // average and worse time complexity is O(n), where n represent the length of the number of segments in the sequence(length of the sequence).
  /// removes a sequence from trie tree. If the argument provided is not a sequence or doesn't exist, no
  /// modification is done to the trie tree.
  void remove(T sequence);

  // worse case time complexity is O(n * m) where n represent the longest sequence matching the prefix and m represents
  // the number of sequences that match the prefix.
  /// returns a collection of sequences that start with the given prefix.
  List<T> matchPrefix(T prefix);
}
