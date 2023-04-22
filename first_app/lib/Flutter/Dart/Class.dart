
class User1 {
  // 멤버 변수
  String name;

  // 이름 없는 생성자 함수
  User1(this.name);

  // 이름 있는 생성자 함수
  User1.withName(String inputName) : name = inputName;
  User1.withAnonymous() : name = 'Anony';

  // 선택 매개변수
  User1.withName2({required this.name});
}

class User {
  String userId;
  String nickname;
  String password;
  List<User> friends;

  User(this.userId, this.nickname, this.password, this.friends) {
    print('${this.nickname} 생성');
  }

  User.createUser(String nickname, String password)
    : userId = 'newUserID',
      nickname = nickname,
      password = password,
      friends = [];
}

void main() {
  var user1 = User1('user1');  // 생성자를 통한 객체생성 및 변수에 할당
  var user2 = User1('user2');  // 생성자를 통한 객체생성 및 변수에 할당

  var user3 = User1.withName('user3');
  var user4 = User1.withName2(name: 'user4');

  var user = User('id', '햄버거', '****', []);
}
