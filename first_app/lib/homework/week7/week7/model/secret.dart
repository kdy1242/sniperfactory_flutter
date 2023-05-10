
class Secret {
  String id;
  String secret;
  String? author;
  String authorName;

  Secret({
    required this.id,
    required this.secret,
    this.author,
    required this.authorName,
  });

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      id: map['id'] as String,
      secret: map['secret'] as String,
      author: map['author'] as String,
      authorName: map['authorName'] as String,
    );
  }
}
