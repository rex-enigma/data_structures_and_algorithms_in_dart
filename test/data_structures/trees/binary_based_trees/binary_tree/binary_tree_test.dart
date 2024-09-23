import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_tree/binary_tree.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/trees/binary_based_trees/binary_tree/binary_tree_based_challenges.dart';
import 'package:test/test.dart';

void main() {
  final h3Zero = BinaryNode(0);
  final h3One = BinaryNode(1);
  final h3Five = BinaryNode(5);
  final h3SevenRoot = BinaryNode(7);
  final h3Eight = BinaryNode(8);
  final h3Nine = BinaryNode(9);
  h3SevenRoot.leftChild = h3One;
  h3SevenRoot.rightChild = h3Nine;
  h3One.leftChild = h3Zero;
  h3One.rightChild = h3Five;
  h3Nine.leftChild = h3Eight;

  BinaryTree binaryTreeHeight3 = BinaryTree<int>(h3SevenRoot);

  final h5ZeroRoot = BinaryNode(0);
  final h5One = BinaryNode(1);
  final h5Two = BinaryNode(2);
  final h5Three = BinaryNode(3);
  final h5Four = BinaryNode(4);
  final h5Five = BinaryNode(5);
  final h5Six = BinaryNode(6);
  final h5Seven = BinaryNode(7);
  final h5Eight = BinaryNode(8);
  final h5Nine = BinaryNode(9);
  final h5Ten = BinaryNode(10);
  final h5Eleven = BinaryNode(11);
  h5ZeroRoot.leftChild = h5One;
  h5ZeroRoot.rightChild = h5Two;
  h5One.leftChild = h5Three;
  h5One.rightChild = h5Four;
  h5Two.leftChild = h5Five;
  h5Two.rightChild = h5Six;
  h5Four.leftChild = h5Seven;
  h5Four.rightChild = h5Eight;
  h5Six.leftChild = h5Nine;
  h5Eight.leftChild = h5Ten;
  h5Eight.rightChild = h5Eleven;

  BinaryTree binaryTreeHeight5 = BinaryTree<int>(h5ZeroRoot);

  test(" binary tree based challenge 1: calculating binary tree height", () {
    expect(binaryTreeHeight(binaryTreeHeight3), 3);
    expect(binaryTreeHeight(binaryTreeHeight5), 5);
    expect(binaryTreeHeight(BinaryTree(BinaryNode(20))), 0);
  });

  final serializeZeroRoot = BinaryNode(15);
  final serializeOne = BinaryNode(10);
  final serializeTwo = BinaryNode(25);
  final serializeThree = BinaryNode(5);
  final serializeFour = BinaryNode(12);
  final serializeFive = BinaryNode(17);
  serializeZeroRoot.leftChild = serializeOne;
  serializeZeroRoot.rightChild = serializeTwo;
  serializeOne.leftChild = serializeThree;
  serializeOne.rightChild = serializeFour;
  serializeTwo.leftChild = serializeFive;

  BinaryTree serializableBinaryTree = BinaryTree<int>(serializeZeroRoot);

  test("binary tree based challenge 2a: serialization of a binary tree", () {
    expect(serializeBinaryTreeToListRecursively(serializableBinaryTree).toString(), "[15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null]");
  });

  // this binary tree based list is from the above serialized Binary tree.
  final binaryTreeList = [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null];
  final deserializedBinaryTree = deserializeListToBinaryTree(binaryTreeList);
  test("binary tree based challenge 2b: deserialization of a binaryTree list", () {
    expect(deserializedBinaryTree?.root?.key, 15);
    expect(deserializedBinaryTree?.root?.leftChild?.key, 10);
    expect(deserializedBinaryTree?.root?.leftChild?.leftChild?.key, 5);
    expect(deserializedBinaryTree?.root?.leftChild?.leftChild?.leftChild, null);
    expect(deserializedBinaryTree?.root?.leftChild?.leftChild?.rightChild, null);
    expect(deserializedBinaryTree?.root?.leftChild?.rightChild?.key, 12);
    expect(deserializedBinaryTree?.root?.leftChild?.rightChild?.leftChild, null);
    expect(deserializedBinaryTree?.root?.leftChild?.rightChild?.rightChild, null);
    expect(deserializedBinaryTree?.root?.rightChild?.key, 25);
    expect(deserializedBinaryTree?.root?.rightChild?.leftChild?.key, 17);
    expect(deserializedBinaryTree?.root?.rightChild?.leftChild?.leftChild, null);
    expect(deserializedBinaryTree?.root?.rightChild?.leftChild?.rightChild, null);
    expect(deserializedBinaryTree?.root?.rightChild?.rightChild, null);
  });
}
