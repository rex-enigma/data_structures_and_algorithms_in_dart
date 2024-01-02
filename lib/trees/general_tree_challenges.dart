import 'package:dart_data_structure_and_algorithm/queue/single_list_based_queue_implementation.dart';
import 'package:dart_data_structure_and_algorithm/trees/general_tree.dart';

// challenge 1: print a tree in level order
// print all the values in a tree in order based on there level. Nodes on the same level
// should be printed on the same line.

TreeNode _constructAGeneralTree() {
  final root = TreeNode(15);
  final level1Node1 = TreeNode(1);
  final level1Node2 = TreeNode(17);
  final level1Node3 = TreeNode(20);
  final level2Node1 = TreeNode(1);
  final level2Node2 = TreeNode(5);
  final level2Node3 = TreeNode(0);
  final level2Node4 = TreeNode(2);
  final level2Node5 = TreeNode(5);
  final level2Node6 = TreeNode(7);

  root.addAllTreeNode([level1Node1, level1Node2, level1Node3]);
  level1Node1.addAllTreeNode([level2Node1, level2Node2, level2Node3]);
  level1Node2.addTreeNode(level2Node4);
  level1Node3.addAllTreeNode([level2Node5, level2Node6]);
  return root;
}

void printTreeInLevelOrder() {
  final tree = _constructAGeneralTree();

  List<TreeNode> similarLevelNodes = [];

  tree.children.forEach(similarLevelNodes.add);

  print(tree.value);

  while (similarLevelNodes.isNotEmpty) {
    StringBuffer stringBuffer = StringBuffer();

    for (var node in similarLevelNodes) {
      stringBuffer.write('${node.value} ');
    }

    print(stringBuffer);

    final tempSimilarLevelNodes = [...similarLevelNodes];
    similarLevelNodes.clear();

    for (var node in tempSimilarLevelNodes) {
      similarLevelNodes.addAll(node.children);
    }
  }
}

// challenge 2: Widget tree
// flutter calls the nodes in its user facing tree [widgets].
// create three separate nodes with the following names and types.
/* 
  Column -> a tree node that takes multiple children.
  padding -> a tree node that takes a single child
  Text -> a tree leaf node.
*/
// use your widget nodes to build a simple widget tree.

class Widget {}

class Column extends Widget {
  Column({this.children});
  List<Widget>? children;
}

class Padding extends Widget {
  Padding({this.value = 0.0, this.child});
  double value;
  Widget? child;
}

class Text extends Widget {
  Text([this.value = '']);
  String value;
}

final tree = Column(
  children: [
    Padding(
      value: 2.0,
      child: Text(''),
    ),
    Text(''),
    Column(children: [
      Text(''),
    ]),
  ],
);
