
class DogImage {
  String message;
  String status;

  DogImage({required this.message, required this.status});

  factory DogImage.fromMap(Map<String, dynamic> map) {
    return DogImage(
      message: map['message'],
      status: map['status'],
    );
  }
}
