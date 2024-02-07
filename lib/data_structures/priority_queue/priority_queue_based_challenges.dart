// challenge 1: prioritize a waitList
// Your favorite concert was sold out. Fortunately there's is a waitList for people who still want to go.
// However, ticket sales will first prioritize someone with military background, followed by seniority.
// Use a priority queue to prioritize the order of people on the waitList. Start by making a Person class
// that you can instantiate like so: final person = Person(name: 'Josh', age: 21, isMilitary: true);

class Person implements Comparable<Person> {
  String name;
  int age;
  bool isMilitary;
  Person({required this.name, required this.age, required this.isMilitary});

  @override
  int compareTo(other) {
    // this person is military and the other person is not military.
    // you first give priority to this person if he has a military background and the other person compared with doesn't
    // have military background.
    if (isMilitary && !(other.isMilitary)) {
      return 1;
      // if both this person and other person have a military background, prioritize the other person that came first.
    } else if (isMilitary && other.isMilitary) {
      return 0;
      // this person is not military and the other person is also not military
      // if both this and other person have no military background, then make the older person(either this or other) to have a higher priority(ie
      // if this person is older than other person then return 1 indicating this person has higher priority, if this person
      // has the same age as the other person then return 0 indicating than this person have the same level of priority
      // as the other person and lastly if this person is younger than the other person then return -1 indicating than the
      // other person has higher priority than this person)
    } else {
      return age.compareTo(other.age);
    }
  }
}

//
class TicketWaitList {}
