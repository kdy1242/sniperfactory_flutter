
void main() {
  // await();
  then();
}

void await() async {
  print('로그인을 시도합니다.');
  await Future.delayed(Duration(seconds: 3));
  print('로그인에 성공했습니다');
  print('반갑소');
}

void then() async {
  print('로그인을 시도합니다.');
  Future.delayed(Duration(seconds: 3)).then((res) {
    print(res);
    print('로그인에 성공했습니다');
  });
  print('반갑소');
}
