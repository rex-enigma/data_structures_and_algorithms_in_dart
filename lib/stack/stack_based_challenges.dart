import 'package:dart_data_structure_and_algorithm/stack/stack.dart';
// solve the following challenges using stacks

// Challenge 1: Reverse a list.
// create a function that prints the contents of a list in reverse order.
void printReverseList(List list) {
  Stack stack = Stack.fromIterable(list);

  List reverseOrderList = [];

  for (var i = 0; i < list.length; i++) {
    reverseOrderList.add(stack.pop());
  }

  print(reverseOrderList.join(','));
}

// Challenge 2: Balance the parenthesis
// Given a string, check if there are ( and ) characters, and return true if the parenthesis in the string are balanced
// For example:
// 1: h((e))llo(world)()  // balanced parenthesis
// 2: (hello world // unbalanced parenthesis

bool isParenthesisBalanced(String string) {
  List charsList = [];

  for (var i = 0; i < string.length; i++) {
    charsList.add(string[i]);
  }

  Stack charsStack = Stack.fromIterable(charsList);

  Map<String, int> charsMap = {'(': 0, ')': 0};

  while (charsStack.isNotEmpty) {
    if (charsStack.peek() == '(') {
      charsMap['('] = charsMap[charsStack.pop()]! + 1;
    } else if (charsStack.peek() == ')') {
      charsMap[')'] = charsMap[charsStack.pop()]! + 1;
    } else {
      charsStack.pop();
    }
  }

  return charsMap['('] == charsMap[')'];
}
