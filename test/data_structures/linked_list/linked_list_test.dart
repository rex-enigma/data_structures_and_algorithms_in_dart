import 'package:dart_data_structure_and_algorithm/data_structures/linked_list/singly_linked_list.dart';
import 'package:dart_data_structure_and_algorithm/data_structures/linked_list/singly_linked_list_based_challenges.dart';
import 'package:test/test.dart';

void main() {
  Node<int> node1 = Node(value: 1);
  Node<int> node2 = Node(value: 2);
  Node<int> node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;
  test('creating node with values', () {
    expect(node1.toString(), '1 -> 2 -> 3');
  });

  SinglyLinkedList<int> linkedListPush = SinglyLinkedList();
  linkedListPush.push(1);
  linkedListPush.push(2);
  linkedListPush.push(3);
  test('pushing values at the front of the linked list', () {
    expect(linkedListPush.toString(), '3 -> 2 -> 1');
  });

  SinglyLinkedList<int> linkedListAppend = SinglyLinkedList();
  linkedListAppend.append(1);
  linkedListAppend.append(2);
  linkedListAppend.append(3);
  test('appending values at the end of the linked list', () {
    expect(linkedListAppend.toString(), '1 -> 2 -> 3');
  });

  final linkedListInsertion = SinglyLinkedList<int>();
  linkedListInsertion.push(3);
  linkedListInsertion.push(2);
  linkedListInsertion.push(1);

  Node<int> middleNode = linkedListInsertion.nodeAt(1)!;
  linkedListInsertion.insertAfter(middleNode, 42);
  test('inserting a value after a particular node in the linked list', () {
    expect(linkedListInsertion.toString(), '1 -> 2 -> 42 -> 3');
  });

  final linkedListPop = SinglyLinkedList<int>();
  linkedListPop.push(3);
  linkedListPop.push(2);
  linkedListPop.push(1);

  int? poppedValue = linkedListPop.pop();
  test('popping a value at the front of the linked list', () {
    expect(linkedListPop.toString(), '2 -> 3');
    expect(poppedValue, 1);
  });

  final linkedListRemoveLast = SinglyLinkedList<int>();
  linkedListRemoveLast.push(3);
  linkedListRemoveLast.push(2);
  linkedListRemoveLast.push(1);

  final removedLastValue = linkedListRemoveLast.removeLast();
  test('removing a value at the end of the linked list', () {
    expect(linkedListRemoveLast.toString(), '1 -> 2');
    expect(removedLastValue, 3);
  });

  final linkedListAfterANode = SinglyLinkedList<int>();
  linkedListAfterANode.push(3);
  linkedListAfterANode.push(2);
  linkedListAfterANode.push(1);

  final secondNode = linkedListAfterANode.nodeAt(1);
  final removedValue = linkedListAfterANode.removeAfter(secondNode!);
  test('removing a value after a particular node in the linked list', () {
    expect(linkedListAfterANode.toString(), '1 -> 2');
    expect(removedValue, 3);
  });

  final iterableLinkedList = SinglyLinkedList<int>();
  iterableLinkedList.push(3);
  iterableLinkedList.push(2);
  iterableLinkedList.push(1);

  test('iterating through a linked list after making it iterable using for in loop', () {
    expect((() {
      final values = StringBuffer();
      for (var element in iterableLinkedList) {
        values.write(element);
      }
      return values.toString();
    })(), '123');
  });

  final linkedListMiddleValue = SinglyLinkedList<int>();
  linkedListMiddleValue.push(3);
  linkedListMiddleValue.push(2);
  linkedListMiddleValue.push(1);
  test("linkedList based challenge 2: return the middle value of a linked list", () {
    expect(linkedListMiddleValue.middleValue(), 2);
  });

  final linkedListReversed = SinglyLinkedList<int>();
  linkedListReversed.push(6);
  linkedListReversed.push(5);
  linkedListReversed.push(4);
  linkedListReversed.push(3);
  linkedListReversed.push(2);
  linkedListReversed.push(1);

  linkedListReversed.reverseSinglyLinkedListRecursively();
  test("linkedList based challenge 3: reversing a linked list", () {
    expect(linkedListReversed.toString(), '6 -> 5 -> 4 -> 3 -> 2 -> 1');
  });

  final linkedListRemoveOccurrencesOfAValue = SinglyLinkedList<int>();
  linkedListRemoveOccurrencesOfAValue.push(3);
  linkedListRemoveOccurrencesOfAValue.push(2);
  linkedListRemoveOccurrencesOfAValue.push(2);
  linkedListRemoveOccurrencesOfAValue.push(3);
  linkedListRemoveOccurrencesOfAValue.push(1);

  linkedListRemoveOccurrencesOfAValue.removeAll(3);
  test("linkedList based challenge 4: remove all occurrences of a particular value", () {
    expect(linkedListRemoveOccurrencesOfAValue.toString(), '1 -> 2 -> 2');
  });
}
