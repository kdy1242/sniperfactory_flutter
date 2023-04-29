
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'],
      catchPhrase: map['catchPhrase'],
      bs: map['bs']
    );
  }
}
