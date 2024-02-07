// challenge 1: prioritize a waitList
// Your favorite concert was sold out. Fortunately there's is a waitList for people who still want to go.
// However, ticket sales will first prioritize someone with military background, followed by seniority.
// Use a priority queue to prioritize the order of people on the waitList. Start by making a Person class
// that you can instantiate like so: final person = Person(name: 'Josh', age: 21, isMilitary: true);

class Person {
  String name;
  int age;
  bool isMilitary;
  Person({required this.name, required this.age, required this.isMilitary});
}
