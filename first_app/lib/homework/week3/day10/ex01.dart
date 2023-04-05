
var myMoney = 4500;
var accountMoney = 4000000;
var minTaxiFare = 4800;
var iPadPrice = 1000000;
var iPhonePrice = 960000;
var friend1Name = "Teddy";
var friend2Name = "Chris";
var friend3Name = "Juno";
var mathScore = [59,24,62,44,94,61,42];
var minPassScore = 80;
var emailAddress = 'dkanrjskclrl';
var phoneNum = '010-1000-';
var password = '1234';

void main() {

  // 1. myMoney가 minTaxiFare보다 많아서 택시를 탈 수 있는지 없는지 출력하세요.
  if (myMoney >= minTaxiFare) print('탈 수 잇음');
  else print('못탐');

  // 2. myMoney로 iPadPrice를 살 수 있는지 없는지 출력하세요.
  if (myMoney >= iPadPrice) print('살 수 잇음');
  else print('못삼');

  // 3. accountMoney를 사용해 iPadPrice와 iPhonePrice를 동시에 살 수 있는지 없는지 출력하세요.
  if (accountMoney >= iPadPrice+iPhonePrice) print('살 수 잇음');
  else print('못삼');

  // 4. iPadPrice 5개를 살 때 accountMoney과 비교하여 살 수 있는지 없는지 출력하세요.
  if (accountMoney >= iPadPrice*5) print('살 수 잇음');
  else print('못삼');

  // 5. friend1Name, friend2Name, friend3Name의 이름을 전부 합치고 글자수가 10이 넘는지 확인하고 넘으면 얼마나 넘었는지 출력하세요.
  var nameLength = (friend1Name+friend2Name+friend3Name).length;
  if(nameLength > 10) print('10보다 ${nameLength-10}만큼 넘어요');
  else print('안넘어요');

  // 6. mathScore의 0번째 점수가 minPassScore보다 높으면 합격이라고 출력, 낮으면 불합격이라고 출력하세요.
  if(mathScore[0] >= minPassScore) print('합격');
  else print('불합격');

  // 7. mathScore의 0번째 점수와 1번째 점수를 합한 값이 4번째 점수보다 높은지 확인하고, 높은지 낮은지 출력하는 코드를 작성하세요.
  if(mathScore[0]+mathScore[1] > mathScore[4]) print('높다');
  else print('같거나 낮다');

  // 8. emailAddress가 정확히 입력된 이메일형식인지 확인하기 위해서 “@”가 들어가있는지 확인하고 확인 됐으면 확인완료를 출력하세요.
  if(emailAddress.contains('@')) print('확인완료');
  else print('이메일 형식 아님');

  // 9. phoneNum은 휴대폰 번호로, 덜 입력된 번호인지 확인하기 위해 글자수를 체크하는 코드를 작성하세요.
  //    이 때, “-” 가 두 번 사용되었는지도 확인하세요.
  List<String> phoneNumber = phoneNum.split('-');
  if(phoneNumber.length == 3){
    if(phoneNumber[0].length == 3 && phoneNumber[1].length == 4 && phoneNumber[2].length == 4) {
      print('정상적인 휴대폰번호입니다');
    } else print('휴대폰 번호가 이상해요');
  } else print('"-"을 두개 쓰세요');

  // 10. phoneNumCheck 이라는 함수를 만들고, 휴대폰 번호를 입력하면 정상적인 번호인지 확인하도록 하세요. 만약 정상적인 번호면 true를 반환합니다. 아니면 false를 반환합니다.
  bool phoneNumCheck(phone) {
    List<String> phoneNumber = phone.split('-');
    if(phoneNumber.length == 3 && phoneNumber[0].length == 3 && phoneNumber[1].length == 4 && phoneNumber[2].length == 4) return true;
    return false;
  }

  // 11. password가 8자리가 넘는지 확인하고, 넘지 않으면 “비밀번호는 최소 8자 이상을 입력해주세요”를 출력하세요.
  if(password.length >= 8) print('성공');
  else print('비밀번호는 최소 8자 이상을 입력해주세요');

  // 12. passwordValidator 이라는 함수를 만들고, 패스워드를 입력하면 최소 8자 이상이 맞는지 확인하고 맞으면 true를 반환하고, 아니면 false를 반환합니다.
  bool passwordValidator(password) {
    if(password.length >= 8) return true;
    return false;
  }

}

