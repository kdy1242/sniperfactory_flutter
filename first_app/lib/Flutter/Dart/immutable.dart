
void main() {

}

constTest () {
  const int x = 5;
  const double y = 3.14;
  const String name = 'John';

  const List<int> numbers = [1, 2, 3];
  const Map<String, int> scores = {'Alice': 100, 'Bob': 90};
}

finalTest () {
  final int x = 5;
  final double y = 3.14;
  final String name = 'John';

  final List<int> numbers = [1, 2, 3];
  final Map<String, int> scores = {'Alice': 100, 'Bob': 90};

  final List<int> numbers1 = [1, 2, 3];
  numbers1[0] = 10;
}
