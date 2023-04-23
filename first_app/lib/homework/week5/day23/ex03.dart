
class Subway {
  String line;
  String current;
  List passengers;

  Subway({required this.line, required this.current, required this.passengers}) {
    print('[$line] 지하철이 생성되었습니다.');
  }

  @override
  String toString() => 'Subway([$line | $current] 현재 지하철 탑승인원 ${passengers.length}명)';
}

class Human {
  String name;
  int money;
  Subway? curSubway;

  Human({required this.name, required this.money, this.curSubway});

  getOn (Subway subway) {
    if (money >= 1500) {
      money -= 1500;
      curSubway = subway;
      subway.passengers.add(name);
      return '$name이(가) 성공적으로 탑승하였습니다.';
    } else {
      return '$name이(가) 탑승에 실패하였습니다. (잔액부족)';
    }
  }

  @override
  String toString() => 'Human(human: $name, money: $money, curSubway: $curSubway)';
}

void main() {
  // 인스턴스 생성
  var subway = Subway(line:'2호선', current: '홍대입구역', passengers:[]);
  var human1 = Human(name: '사람1', money: 5000, curSubway: null);
  var human2 = Human(name: '사람2', money: 3450, curSubway: null);
  var human3 = Human(name: '사람3', money: 450, curSubway: null);

  // 사람 탑승
  print(human1.getOn(subway));
  print(human2.getOn(subway));
  print(human3.getOn(subway));

  // 현재 지하철 탑승
  print(subway.toString());

  // 각 사람들의 현재 상태를 출력
  print(human1.toString());
  print(human2.toString());
  print(human3.toString());
}
