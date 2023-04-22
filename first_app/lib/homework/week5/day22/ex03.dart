
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

  UserData.dummy()
    : id = 'DUMMY',
      name = '더미데이터',
      birth = DateTime.now(),
      phoneNumber = '010',
      email = 'dummyData@dummy.com',
      lastLoginDate = DateTime.now();

  @override
  String toString() {
    return 'id: $id\nname: $name\nbirth: $birth\nphoneNumber: $phoneNumber\nemail: $email\nlastLoginDate: $lastLoginDate';
  }
}

void main() {
  UserData dummy = UserData.dummy();
  print(dummy.toString());
}
