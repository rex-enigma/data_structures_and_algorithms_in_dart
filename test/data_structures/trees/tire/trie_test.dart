import 'package:dart_data_structure_and_algorithm/data_structures/trees/tire/string_trie_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/tire/trie_tree_challenges.dart';
import 'package:test/test.dart';

void main() {
  final stringTrieTree = StringTire();
  stringTrieTree.insert('car');
  stringTrieTree.insert('card');
  stringTrieTree.insert('care');
  stringTrieTree.insert('cared');
  stringTrieTree.insert('cars');
  stringTrieTree.insert('carbs');
  stringTrieTree.insert('carapace');
  stringTrieTree.insert('cargo');
  stringTrieTree.insert('cut');
  stringTrieTree.insert('cute');
  test('insert a word in stringTrieTree', () {
    expect(stringTrieTree.contains('car'), true);
    expect(stringTrieTree.contains('cart'), false);
  });

  stringTrieTree.remove('cute');
  test('removing a word from stringTrieTree', () {
    expect(stringTrieTree.contains('cute'), false);
    expect(stringTrieTree.contains('cut'), true);
  });

  test("prefix matching, collection of words that start with 'car' ", () {
    expect(stringTrieTree.matchPrefix('car').toString(), "[car, card, care, cared, cars, carbs, carapace, cargo]");
  });

  test("prefix matching, collection of words that start with 'care' ", () {
    expect(stringTrieTree.matchPrefix('care').toString(), "[care, cared]");
  });
  test("prefix matching, collection of words that start with 'cu' ", () {
    expect(stringTrieTree.matchPrefix('cu').toString(), "[cut]");
  });
  test('return all words that exist in stringTrieTree', () {
    expect(stringTrieTree.allWords.toString(), "[car, card, care, cared, cars, carbs, carapace, cargo, cut]");
  });
  test('return the total number of words that exist in the stringTrieTree', () {
    expect(stringTrieTree.wordCount, 9);
  });
}
