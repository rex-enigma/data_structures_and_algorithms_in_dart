import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart';
import 'package:dart_data_structure_and_algorithm/ring_buffer/ring_buffer.dart';
import 'package:dart_data_structure_and_algorithm/singly_linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack.dart';
import 'package:dart_data_structure_and_algorithm/stack/stack_based_challenges.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

/*********************STACK*********************/

  Stack stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  test('stack implementation', () {
    expect(stack.peek(), 4);
  });

  List list = ['q', 'w', 'e', 't', 'y'];
  Stack letters = Stack.fromIterable(list);
  test('returning the element at the top of the stack without removing it', () {
    expect(letters.peek(), 'y');
  });

  List ordered = ['one', 'two', 'three', 'four'];
  test('stacked based challenge 1: reverse a list', () {
    expect(reverseList(ordered), ['four', 'three', 'two', 'one']);
  });

  String unbalancedParenthesis = '(hello world';
  String balancedParenthesis = 'h((e))llo(world)()';
  test('stacked based challenge 2: check for balanced parenthesis', () {
    expect(isParenthesisBalanced(unbalancedParenthesis), false);
    expect(isParenthesisBalanced(balancedParenthesis), true);
  });

  /********************LINKED LIST*****************************/

  Node<int> node1 = Node(value: 1);
  Node<int> node2 = Node(value: 2);
  Node<int> node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;

  test('creating node with values', () {
    expect(node1.toString(), '1 -> 2 -> 3');
  });

  final ringBuffer = RingBuffer(5);
  ringBuffer.write(0);
  ringBuffer.write(0);
  ringBuffer.write(0);
  ringBuffer.write(1);
  ringBuffer.write(2);

  ringBuffer.read();
  ringBuffer.read();
  ringBuffer.read();

  ringBuffer.write(3);
  ringBuffer.write(4);

  test('check if toString in ringBuffer returns the correct available values that can only be read ', () {
    expect(ringBuffer.toString(), '[1, 2, 3, 4]');
  });
}
