import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack_based_challenges.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  Stack stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  test('stack implementation', () {
    expect(stack.peek(), 4);
  });

  String unbalancedParenthesis = '(hello world';
  String balancedParenthesis = 'h((e))llo(world)()';
  test('check for balanced parenthesis', () {
    expect(isParenthesisBalanced(unbalancedParenthesis), false);
    expect(isParenthesisBalanced(balancedParenthesis), true);
  });
}
