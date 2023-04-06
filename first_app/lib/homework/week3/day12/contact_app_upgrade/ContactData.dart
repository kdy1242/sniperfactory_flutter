
class Friend {
  String img;
  String name;
  String phone;

  Friend(this.img, this.name, this.phone);
}

class CallRecord {
  String name;
  CallType callType;

  CallRecord(this.name, this.callType);
}

List<Friend> friendList = [
  Friend('http://picsum.photos/50/50', '이테디', '010-1000-2000'),
  Friend('http://picsum.photos/48/48', '김스틴', '010-9000-8000'),
  Friend('http://picsum.photos/55/55', '이주노', '010-3000-3000'),
  Friend('http://picsum.photos/60/60', '임헬렌', '010-2000-8000'),
  Friend('http://picsum.photos/40/40', '염해리', '010-1000-1000'),
];

List<CallRecord> callRecordList = [
  CallRecord('이테디', CallType.incoming),
  CallRecord('김스틴', CallType.missed),
  CallRecord('이주노', CallType.incoming),
  CallRecord('임헬렌', CallType.missed),
  CallRecord('임헬렌', CallType.outgoing),
  CallRecord('염해리', CallType.incoming),
  CallRecord('염해리', CallType.outgoing),
];

// 통화의 종류를 상수값의 집합으로 만들어서 사용
enum CallType {
  incoming,
  outgoing,
  missed,
}