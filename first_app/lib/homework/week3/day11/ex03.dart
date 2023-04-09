
var randomData = ['x', 'p', 's', 'j', 'm', 'V', 'X', 'g', 'v', 'o',
  'c', 'f', 'R', 'L', 'a', 'T', 'q', 'S', 'Z', 'l', 'F',
  'E', 'D', 'r', 'k', 'G', 'H', 't', 'd', 'C', 'e', 'I',
  'K', 'Q', 'B', 'i', 'W', 'N', 'J', 'O', 'h', 'w', 'U',
  'P', 'u', 'A', 'Y', 'M', 'y', 'z', 'b', 'n', 'x', 'p',
  's', 'j', 'm', 'V', 'X', 'g', 'v', 'o', 'c', 'f', 'R',
  'L', 'a', 'T', 'q', 'S', 'Z', 'l', 'F', 'E', 'D', 'r',
  'k', 'G', 'H', 't', 'd', 'C', 'e', 'I', 'K', 'Q', 'B',
  'i', 'W', 'N', 'J', 'O', 'h', 'w', 'U', 'P', 'u', 'A', 'Y', 'M'];

var mathData = [26, 2, 9, 47, 98, 24, 43, 99, 96, 45, 35,
  19, 37, 60, 31, 74, 26, 4, 28, 19, 59, 14, 75, 13,
  93, 88, 64, 15, 68, 34, 96, 48, 1, 44, 14, 11, 31,
  39, 28, 100, 22, 73, 78, 98, 36, 49, 74, 16, 35, 91,
  14, 73, 93, 49, 3, 99, 4, 29, 86, 56, 17, 13, 97, 55,
  94, 7, 100, 66, 59, 85, 94, 11, 16, 48, 16, 44, 75, 14,
  17, 88, 92, 12, 49, 35, 42, 82, 19, 27, 11, 21, 34, 27,
  47, 40, 66, 90, 99, 93, 63, 90];

void main() {
  q3();
}

q1() {
  // mathData에 50이 넘는 수가 몇 개인지 확인하는 코드를 작성하시오.
  int count = 0;
  for(int i in mathData) {
    if(i > 50) count++;
  }
  print(count);
}

q2() {
  // mathData에 80이 넘어가는 수만 고르고 난 뒤, 각 수에 곱하기 2를 한 후 변수 mathData2에 새로 저장하는 코드를 작성하시오.
  List mathData2 = [];
  for(int i in mathData) {
    if(i > 80) mathData2.add(i*2);
  }
  print(mathData2);
}

q3() {
  int idx = mathData.length < randomData.length ? mathData.length : randomData.length;
  for(int i = 0; i < idx; i++) {
    print('${randomData[i]}${mathData[i]}');
  }
}
