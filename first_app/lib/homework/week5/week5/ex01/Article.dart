
class Article {
  String title;   // 제목
  String img;     // 이미지
  String url;     // 링크
  String author;  // 작성자
  DateTime createdAt;   // 작성일
  String type;    // 타입

  Article({
    required this.title,
    required this.url,
    required this.img,
    required this.author,
    required this.createdAt,
    required this.type});

  Article.fromMap(Map<String, dynamic> map)
    : title = map['title'],
      url = 'https://www.nature.com${map['url']}',
      img = map['img'],
      author = map['author'],
      createdAt = map['createdAt'],
      type = map['type'];
}
