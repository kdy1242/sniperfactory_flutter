
class UserData {
  String id;
  DateTime birth;
  String email;
  DateTime lastLoginDate;
  String name;
  String phoneNumber;
  int _age;

  UserData({
    required this.id,
    required this.birth,
    required this.email,
    required this.lastLoginDate,
    required this.name,
    required this.phoneNumber
  }) : _age = 13;

  int get getAge => _age;

  updateUserName (String name) {
    this.name = name;
  }
}

void main() {
  UserData userData = UserData(
      id: 'id',
      birth: DateTime.now(),
      email: 'sniperfactory@naver.com',
      lastLoginDate: DateTime.now(),
      name: '스나이퍼',
      phoneNumber: '01023456789');

  print(userData.name);
  userData.updateUserName('팩토리');
  print(userData.name);
}
