
void main() {
  var myInfo = {
    "name": 'aaa',
    "height": 111.1,
    "age": 44,
    "phone": '011-1234-1231'
  };

  // name만 가져와서 출력
  print(myInfo["name"]);

  // height의 데이터타입
  print(myInfo['height'].runtimeType);

  var options = [
    {
      'foodName': '떡볶이',
      'foodPrice': 4500,
      'foodDetail': '사골육수로 우려낸 떡볶이입니다. 맛있으니까 드셔보세요',
    },
    {
      'foodName': '김치찌개',
      'foodPrice': 5500,
      'foodDetail': '맛있겠다',
    },
    {
      'foodName': '맥주',
      'foodPrice': 500,
      'foodDetail': '벌컥벌컥',
    },
  ];

  // 모든 음식의 이름만 Text위젯으로 보여주기
  // options.map((e) => Text(e['foodName'])).toList()

  // Map, generic
  Map<String, dynamic> human1 = {
    'name': 'bbb',
    'age': 99,
  };

}
