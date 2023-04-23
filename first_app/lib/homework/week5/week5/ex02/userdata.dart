
class UserData {
  int userId;
  String firstName;
  String lastName;
  String imageUrl;
  String phoneNumber;

  UserData({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.phoneNumber,
  });

  UserData.fromMap(Map<String, dynamic> map)
    : userId = map['userId'],
      firstName = map['firstName'],
      lastName = map['lastName'],
      imageUrl = map['imageUrl'],
      phoneNumber = map['phoneNumber'];

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'firstName': firstName,
    'lastName': lastName,
    'imageUrl': imageUrl,
    'phoneNumber': phoneNumber,
  };

  @override
  bool operator ==(Object other) => other is UserData && userId == other.userId;
}
