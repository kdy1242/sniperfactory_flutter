
void main() {
  List myFriends = ['홍길동', '김길동', '이길동', '박길동', '최길동'];
  for (var i=0; i<myFriends.length; i++) {
    print(myFriends[i]);
  }
  for (var friend in myFriends) {
    print(friend);
  }
  myFriends.forEach((element) {
    print(element);
  });
}
