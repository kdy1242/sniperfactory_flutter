
void main() {
  q5();
}

q1() {
  // 0부터 1000까지 49의 배수만 출력
  for(int i=0; i<=1000; i+=49) print(i);
}

q2() {
  // 0부터 1000까지 2의 배수만 출력
  for(int i=0; i<=1000; i+=2) print(i);
}

q3() {
  // 반복문 두 개를 사용하여 구구단을 출력
  for(int i=2; i<=9; i++) {
    for(int j=1; j<=9; j++) print('$i * $j = ${i*j}');
  }
}

q4() {
  // 별찍기
  for(int i=1; i<=10; i++) {
    var star = '';
    for(int j=1; j<=i; j++) {
      star += '*';
    }
    print(star);
  }
}

q5() {
  startCrawling(String url){
    //...크롤링 하는 코드... //
    print(url+'에 크롤링 성공함');
  }

  var defaultUrl = "https://example.sniperfactory.com/board?pages=";

  for (int i = 1; i<= 1000; i++) {
    startCrawling(defaultUrl + i.toString());
  }
}

q6() {
  // 0부터 1000까지 2의 배수만 출력할 때, if문을 사용하지 않고 출력
  for(int i=0; i<=1000; i+=2) print(i);
}

q7() {
  // [5,10,15,20,25,30,35]
  List myVars = [1, 2, 3, 4, 5, 6, 7];
  List res = [];
  for(int i in myVars) {
    res.add(i*5);
  }
  print(res);
}

q8() {
  // 실행결과

}