
class User {
  String name;
  String phoneNumber;
  String email;
  String? nickname;
  String? profileImg;
  String? backgroundImg;
  List<User> friends;
  List bookmark;

  User(this.name, this.phoneNumber, this.email, this.nickname, this.profileImg, this.backgroundImg, this.friends, this.bookmark);
}
