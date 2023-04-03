
// 로그인 시 인사하는 함수 (결과를 받을 필요가 없기 때문에 void)
void printWelcomeMsg() {
  print("새로운 유저가 입장했습니다");
  print("반겨");
}

// 내 나이를 넘겨주는 함수 (결과를 int로 받아야 함)
int getMyAge() {
  return 20;
}

// 내 닉네임을 받는 함수 (결과를 String으로 받아야 함)
String getMyNickName() {
  return 'gong';
}

// 내 팔로워들을 받는 함수 (결과를 List<String>로 받아야 함)
List<String> getMyFollwers(){
  var followers = ['aaa', 'bbb', 'ccc'];
  return followers;
}

// 팔로우를 거는 함수 (결과를 bool로 받아야 함)
bool tryFollow() {
  return true;
}

// 로그인 시 이름과 함께 인사하는 함수
void printWelcomeMsgWithName(String myName) {
  print('$myName 새로운 유저가 입장');
  print('반겨~');
}

void main() {
  //printWelcomeMsg();
  var res = getMyFollwers();
  // print(followers); // 함수 안에 선언되어있는 지역변수는 다른 함수에서 사용할 수 없다.
  printWelcomeMsgWithName('이름');
}


