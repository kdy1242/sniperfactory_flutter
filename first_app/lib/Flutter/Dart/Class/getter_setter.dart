
class Student {
  static const schoolName = 'Teddy`s School';
  String studentId;
  String name;

  Student(this.studentId, this.name);

  String get studentInfo => studentId + name + 'GoodStudent';
  int get nameLength => name.length;
  List get nameAsList => [name];

  set studentName(String v) {
    // 내가 데이터를 새로 넣을 때 좀 더 신중하게 검수해야 하는 경우
    if (v.length < 3) {
      return;
    }
    name = v;
  }
}

void main() {
  var student1 = Student('1010', 'teddy');
  print(student1.studentInfo);
  print(student1.nameLength);
  print(student1.nameAsList);

  print(student1.name);
  student1.studentName = 'td';
  print(student1.name);
}
