import 'dart:math';

import 'package:dart_data_structure_and_algorithm/trees/binary_tree/binary_tree.dart';

// challenge 1: height of the tree
// given a binary tree find the height of the tree. The height of a binary tree is determined by the distance
// between the root and the furthest leaf. The height of a binary tree with a single node is zero since
// the single node is both the root and the furthest leaf.

int treeHeight(BinaryNode root) {
  if (root.leftChild == null && root.rightChild == null) return 0;

  int treeHeight = 0;
  int counter = 0;

  root.traversePreOrder((node) {
    if (node.leftChild == null && node.rightChild == null) {
      counter++;
      treeHeight = counter > treeHeight ? counter : treeHeight;
      counter--;
    } else {
      counter++;
    }

    if (node == root.rightChild) counter = 2;
  });

  return treeHeight;
}

//book's solution for challenge 1

// int height(BinaryNode? node) {
// // 1
//   if (node == null) return -1;

// // 2
//   return 1 +
//       max(
//         height(node.leftChild),
//         height(node.rightChild),
//       );
// }

// challenge 2: serialization
/* 
A common task in software development is representing a complex object using
another data type. This process is known as serialization and allows custom types to
be used in systems that only support a closed set of data types. An example of
serialization is JSON. 
*/

// Your task is to devise a way to serialize a binary tree into a list, and a way to
// deserialize the list back into the same binary tree.

// this uses pre-order technique
// List<BinaryNode?> serializeBinaryTreeToList(BinaryNode root) {
//   // BinaryNode node = root;
//   List<BinaryNode?> serializedBinaryTreeList = [];

//   root.traversePreOrder((node) {
//     if (node == root) {
//       serializedBinaryTreeList.add(node.value);
//     }
//     if (node.leftChild == null) {
//       serializedBinaryTreeList.add(null);
//       if (node.rightChild == null) {
//         serializedBinaryTreeList.add(null);
//       }
//     } else {

//     }
//   });
//   return serializedBinaryTreeList;
// }

List<BinaryNode?> serializeBinaryTreeToList(BinaryNode root) {
  return serializeBinaryTreeTListRecursively(root);
}

List<BinaryNode?> serializeBinaryTreeTListRecursively(BinaryNode? node) {
  List<BinaryNode?> serializedBinaryTreeList = [];
  if (node == null) serializedBinaryTreeList;

  serializedBinaryTreeList.add(node?.value);

  if (node?.leftChild == null) {
    serializedBinaryTreeList.add(null);
  }

  serializedBinaryTreeList.addAll(serializeBinaryTreeTListRecursively(node?.leftChild));

  if (node?.rightChild == null) {
    serializedBinaryTreeList.add(null);
  }
  serializedBinaryTreeList.addAll(serializeBinaryTreeTListRecursively(node?.rightChild));
  return serializedBinaryTreeList;
}
