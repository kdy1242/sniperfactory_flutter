
void main() {
  List myFriends = ['홍길동', '김길동', '이길동', '박길동', '최길동'];

  // forEach
  myFriends.forEach((value) {
    //print(value);
  });

  // map
  // myFriends.map((e) {
  //   return Text(e);
  // }).toList();

  // where
  myFriends.where((e) {
    return e.length == 5;   // 조건은 boolean
  });
}
