
void main() {
  on();
}

void tryCatch() {
  try {
    // 예외가 발생할 가능성이 있는 코드
    List items = ['a','b','c'];
    print(items[3]);
  } catch(e) {
    // 예외처리를 위한 코드
    print('어라 에러낫네 $e');
  } finally {
    // 예외 발생 여부에 관계 없이 실행
    print('메롱');
  }
}

void on() {
  try {
    // 예외가 발생할 가능성이 있는 코드
    List items = ['a','b','c'];
    print(items[3]);
  } on RangeError catch (e) {
    // 특정 예외에 대한 처리
    print('범위에러가 났다.: $e');
  } catch (e) {
    // 기타 예외 처리
    print('예외 발생: $e');
  } finally {
    // 예외 발생 여부에 관계없이 실행되는 코드
    print('finally 블록 실행');
  }
}
