import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_search_tree/binary_search_tree_based_challenges.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_tree/binary_tree.dart';
import 'package:test/test.dart';

void main() {
  final binarySearchTreeUnbalanced1 = BinarySearchTree<int>();
  for (var i = 0; i < 5; i++) {
    // this insertion will create unbalanced tree
    binarySearchTreeUnbalanced1.insert(i);
  }

  test('inserting values in a binary search tree, creating unbalanced search tree', () {
    expect(binarySearchTreeUnbalanced1.root?.key, 0);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.key, 1);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.key, 2);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.rightChild?.key, 3);
    expect(binarySearchTreeUnbalanced1.root?.rightChild?.rightChild?.rightChild?.rightChild?.key, 4);
  });

  final binarySearchTreeBalanced1 = BinarySearchTree<int>();
  binarySearchTreeBalanced1.insert(3);
  binarySearchTreeBalanced1.insert(1);
  binarySearchTreeBalanced1.insert(4);
  binarySearchTreeBalanced1.insert(0);
  binarySearchTreeBalanced1.insert(2);
  binarySearchTreeBalanced1.insert(5);
  test('inserting values in a binary search tree, creating balanced search tree', () {
    expect(binarySearchTreeBalanced1.root?.key, 3);
    expect(binarySearchTreeBalanced1.root?.leftChild?.key, 1);
    expect(binarySearchTreeBalanced1.root?.leftChild?.leftChild?.key, 0);
    expect(binarySearchTreeBalanced1.root?.leftChild?.rightChild?.key, 2);
    expect(binarySearchTreeBalanced1.root?.rightChild?.key, 4);
    expect(binarySearchTreeBalanced1.root?.rightChild?.rightChild?.key, 5);
  });
  test('searching / finding a value in a binary search tree', () {
    expect(binarySearchTreeBalanced1.contains(2), true);
    expect(binarySearchTreeBalanced1.contains(10), false);
  });

  final notABinarySearchTreeRoot = BinaryNode(3);
  final notABinarySearchTreeOne = BinaryNode(1);
  final notABinarySearchTreeTwo = BinaryNode(0);
  final notABinarySearchTreeThree = BinaryNode(4);
  final notABinarySearchTreeFour = BinaryNode(2);
  final notABinarySearchTreeFive = BinaryNode(5);
  notABinarySearchTreeRoot.leftChild = notABinarySearchTreeOne;
  notABinarySearchTreeRoot.rightChild = notABinarySearchTreeFour;
  notABinarySearchTreeOne.leftChild = notABinarySearchTreeTwo;
  notABinarySearchTreeOne.rightChild = notABinarySearchTreeThree;
  notABinarySearchTreeFour.rightChild = notABinarySearchTreeFive;

  BinaryTree<int> notBinarySearchTree = BinaryTree<int>(notABinarySearchTreeRoot);

  final aBinaryTreeRoot = BinaryNode(3);
  final aBinaryTreeOne = BinaryNode(1);
  final aBinaryTreeTwo = BinaryNode(0);
  final aBinaryTreeThree = BinaryNode(4);
  final aBinaryTreeFour = BinaryNode(2);
  final aBinaryTreeFive = BinaryNode(5);
  aBinaryTreeRoot.leftChild = aBinaryTreeOne;
  aBinaryTreeRoot.rightChild = aBinaryTreeThree;
  aBinaryTreeOne.leftChild = aBinaryTreeTwo;
  aBinaryTreeOne.rightChild = aBinaryTreeFour;
  aBinaryTreeFour.rightChild = aBinaryTreeFive;

  // this binary tree is ordered where the left child is less than and the right child is greater than
  // the parent, making it to have the characteristics of a binary search tree.
  BinaryTree<int> orderedBinaryTree = BinaryTree<int>(aBinaryTreeRoot);

  test('binary search tree based challenge 1: check if a binary tree is a binary search tree', () {
    expect(isBinarySearchTree(orderedBinaryTree), true);
    expect(isBinarySearchTree(notBinarySearchTree), false);
  });

  final binaryTree1IdenticalRoot = BinaryNode(3);
  final binaryTree1IdenticalOne = BinaryNode(1);
  final binaryTree1IdenticalTwo = BinaryNode(4);
  binaryTree1IdenticalRoot.leftChild = binaryTree1IdenticalOne;
  binaryTree1IdenticalRoot.rightChild = binaryTree1IdenticalTwo;

  BinaryTree<int> binaryTree1Identical = BinaryTree<int>(binaryTree1IdenticalRoot);

  final binaryTree2IdenticalRoot = BinaryNode(3);
  final binaryTree2IdenticalOne = BinaryNode(1);
  final binaryTree2IdenticalTwo = BinaryNode(4);
  binaryTree2IdenticalRoot.leftChild = binaryTree2IdenticalOne;
  binaryTree2IdenticalRoot.rightChild = binaryTree2IdenticalTwo;

  BinaryTree<int> binaryTree2Identical = BinaryTree<int>(binaryTree2IdenticalRoot);

  final binaryTree3StructureNotIdenticalRoot = BinaryNode(3);
  final binaryTree3StructureNotIdenticalOne = BinaryNode(1);
  binaryTree3StructureNotIdenticalRoot.leftChild = binaryTree3StructureNotIdenticalOne;

  BinaryTree<int> binaryTree3StructureNotIdentical = BinaryTree<int>(binaryTree3StructureNotIdenticalRoot);

  final binaryTree4ValueNotIdenticalRoot = BinaryNode(3);
  final binaryTree4ValueNotIdenticalOne = BinaryNode(1);
  final binaryTree4ValueNotIdenticalTwo = BinaryNode(5);
  binaryTree4ValueNotIdenticalRoot.leftChild = binaryTree4ValueNotIdenticalOne;
  binaryTree4ValueNotIdenticalRoot.rightChild = binaryTree4ValueNotIdenticalTwo;

  BinaryTree<int> binaryTree4ValueNotIdentical = BinaryTree<int>(binaryTree4ValueNotIdenticalRoot);

  test('binary search tree based challenge 2: check if two binary trees are equal, should be true because both binary trees have the same structure and value', () {
    expect(isBinaryTreesEqual(binaryTree1Identical, binaryTree2Identical), true);
  });
  test(
      'binary search tree based challenge 2: check if two binary trees are equal, should be false because though there structures are similar, they contain value(s) that are not equal',
      () {
    expect(isBinaryTreesEqual(binaryTree1Identical, binaryTree4ValueNotIdentical), false);
  });
  test('binary search tree based challenge 2: check if two binary trees are equal, should be false because there structures are not similar', () {
    expect(isBinaryTreesEqual(binaryTree1Identical, binaryTree3StructureNotIdentical), false);
  });

  final binarySearchSubTreeBalanced1 = BinarySearchTree<int>();
  binarySearchSubTreeBalanced1.insert(1);
  binarySearchSubTreeBalanced1.insert(0);
  binarySearchSubTreeBalanced1.insert(2);

  final binarySearchNotSubTreeBalanced1 = BinarySearchTree<int>();
  binarySearchNotSubTreeBalanced1.insert(1);
  binarySearchNotSubTreeBalanced1.insert(0);
  binarySearchNotSubTreeBalanced1.insert(6);

  test('binary search tree based challenge 3: checking if one binary search tree is a binary search subtree of another binary search tree) ', () {
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, binarySearchSubTreeBalanced1), true);
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, BinarySearchTree<int>()), false);
    expect(containsBinarySearchSubTree(BinarySearchTree<int>(), binarySearchTreeBalanced1), false);
    expect(containsBinarySearchSubTree(null, null), true);
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, null), false);
    expect(containsBinarySearchSubTree(null, binarySearchSubTreeBalanced1), false);
    expect(containsBinarySearchSubTree(binarySearchTreeBalanced1, binarySearchNotSubTreeBalanced1), false);
  });
}
