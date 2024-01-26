import 'package:dart_data_structure_and_algorithm/data_structures/stack/single_list_based_stack_implementation.dart';
// solve the following challenges using stacks

// Challenge 1: Reverse a list.
// create a function that prints the contents of a list in reverse order.
void printReverseList(List list) {
  print(reverseList(list));
}

List reverseList(List list) {
  StackList stack = StackList.fromIterable(list);

  List reverseOrderList = [];

  for (var i = 0; i < list.length; i++) {
    reverseOrderList.add(stack.pop());
  }

  reverseOrderList.join(',');
  return reverseOrderList;
}

// Challenge 2: Balance the parenthesis
// Given a string, check if there are ( and ) characters, and return true if for every '(' opening parenthesis
// there is an equivalent ')' closing parenthesis, hence making the parenthesis balanced.
// For example:
// 1: h((e))llo(world)()  // balanced parenthesis.
// 2: (hello world // unbalanced parenthesis.

// for every opening parenthesis that is pushed into the stack, gets popped out if there is an equivalent
// closing parenthesis that exits in the string.
bool isParenthesisBalanced(String string) {
  StackList charsStack = StackList();

  for (var i = 0; i < string.length; i++) {
    String char = string[i];
    if (string[i] == '(') {
      charsStack.push(char);
    } else if (string[i] == ')') {
      if (charsStack.isEmpty) return false;
      charsStack.pop();
    }
  }
  // if the stack is empty at this point, then we know that an opening parenthesis had an equivalent closing
  // parenthesis.
  return charsStack.isEmpty;
}
