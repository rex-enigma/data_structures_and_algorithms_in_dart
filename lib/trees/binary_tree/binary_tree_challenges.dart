import 'package:dart_data_structure_and_algorithm/queue/queue.dart';
import 'package:dart_data_structure_and_algorithm/queue/singly_linked_list_based_queue_implementation.dart';
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

// challenge 2a: serialization
/* 
A common task in software development is representing a complex object using
another data type. This process is known as serialization and allows custom types to
be used in systems that only support a closed set of data types. An example of
serialization is JSON. 
*/

// Your task is to devise a way to serialize a binary tree into a list, and a way to
// deserialize the list back into the same binary tree.

// this uses pre-order technique with recursion
List<T?> serializeBinaryTreeToListRecursively<T>(BinaryNode<T>? node) {
  List<T?> serializedBinaryTreeList = [];
  if (node == null) return serializedBinaryTreeList;

  serializedBinaryTreeList.add(node.value);

  if (node.leftChild == null) {
    serializedBinaryTreeList.add(null);
  }

  serializedBinaryTreeList.addAll(serializeBinaryTreeToListRecursively(node.leftChild));

  if (node.rightChild == null) {
    serializedBinaryTreeList.add(null);
  }
  serializedBinaryTreeList.addAll(serializeBinaryTreeToListRecursively(node.rightChild));
  return serializedBinaryTreeList;
}

//book's solution for challenge 2a: serialization
// extension Serializable<T> on BinaryNode<T> {
//   void traversePreOrderWithNull(void Function(T? value) action) {
//     action(value);
//     if (leftChild == null) {
//       action(null);
//     } else {
//       leftChild!.traversePreOrderWithNull(action);
//     }
//     if (rightChild == null) {
//       action(null);
//     } else {
//       rightChild!.traversePreOrderWithNull(action);
//     }
//   }
// }

// List<T?> serialize<T>(BinaryNode<T> node) {
//   final list = <T?>[];
//   node.traversePreOrderWithNull((value) => list.add(value));
//   return list;
// }

// challenge 2b: deserialization
// deserializing a list of binary tree nodes back into a binary tree.
// an example of a list of binary tree nodes that you can use as a reference:
// [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null]

BinaryNode<T>? deserializeListToBinaryTree<T>(List<T?> binaryNodes) {
  final binaryNodesReveredList = binaryNodes.reversed.toList();
  return _buildBinaryTreeFromListRecursively(binaryNodesReveredList);
}

// this uses pre-order technique with recursion
BinaryNode<T>? _buildBinaryTreeFromListRecursively<T>(List binaryNodes) {
  if (binaryNodes.isEmpty) return null;

  BinaryNode<T> node;

  if (binaryNodes.last != null) {
    node = BinaryNode(binaryNodes.removeLast());
    node.leftChild = _buildBinaryTreeFromListRecursively(binaryNodes);
  } else {
    return binaryNodes.removeLast();
  }

  if (binaryNodes.last != null) {
    node.rightChild = _buildBinaryTreeFromListRecursively(binaryNodes);
  } else {
    node.rightChild = binaryNodes.removeLast();
  }
  return node;
}

//book's solution for challenge 2b: deserialization
BinaryNode<T>? deserialize<T>(List<T?> list) {
// 2
  if (list.isEmpty) return null;
  final value = list.removeAt(0);
  if (value == null) return null;
// 3
  final node = BinaryNode<T>(value);
  node.leftChild = deserialize(list);
  node.rightChild = deserialize(list);
  return node;
}
