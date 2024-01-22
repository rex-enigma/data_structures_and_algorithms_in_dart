class TrieNode<T> {
  // this keyPart represents a single character in a word or any character which when put together with other characters held in TireNodes forms a meaningful collection eg a word, ip address etc
  // is nullable because the TrieNode root doesn't have a keyPart
  T? keyPart;

  // this will simplifies removing method.
  //is nullable because the TireNode root doesn't have a parent.
  TrieNode<T>? parent;

  Map<T, TrieNode<T>> children = {};

  // it marks the end of a collection( of a word,ip address etc)
  bool isTerminating = false;
}
