
class UserData {
  String id;
  DateTime birth;
  String email;
  DateTime lastLoginDate;
  String name;
  String phoneNumber;

  UserData({
    required this.id,
    required this.birth,
    required this.email,
    required this.lastLoginDate,
    required this.name,
    required this.phoneNumber
  });

  @override
  String toString() {
    return 'id: $id\nname: $name\nbirth: $birth\nphoneNumber: $phoneNumber\nemail: $email\nlastLoginDate: $lastLoginDate';
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

  print(userData);
}
