import 'package:dart_data_structure_and_algorithm/dart_data_structure_and_algorithm.dart' as dart_data_structure_and_algorithm;
import 'package:dart_data_structure_and_algorithm/stack.dart';

void main(List<String> arguments) {
  // print('Hello world: ${dart_data_structure_and_algorithm.calculate()}!');
  //
  // Stack stack = Stack<int>();
  // stack.push(1);
  // stack.push(2);
  // stack.push(3);
  // stack.push(4);
  // print(stack);

  // final element = stack.pop();
  // print('popped: $element');
  // print(stack);
  // print(stack.peek());
  //

  List list = ['q', 'w', 'e', 't', 'y'];
  Stack letters = Stack.fromIterable(list);
  print(letters);
  print(letters.peek());
}
