
import 'package:dio/dio.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(userId: map['userId'], id: map['id'], title: map['title'], body: map['body']);
  }

  @override
  String toString() => 'Post: $id | $body\n';
}

Future<Post?> getData(int userId) async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/posts/$userId';
  var response = await dio.get(url);

  if (response.statusCode == 200) {
    return Post.fromMap(response.data);
  }
  return null;
}

Future<List<Post>> readData() async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/posts';
  var response = await dio.get(url);

  if (response.statusCode == 200) {
    // List<dynamic> 타입을 List<Map<String, dynamic>>으로 변환
    var data = List<Map<String, dynamic>>.from(response.data);
    // data 안에 있는 각각의 요소들을 Post 인스턴스로 변환
    return data.map((e) => Post.fromMap(e)).toList();
  }
  return [];
}

void main() async {
  var res = await readData();
  print(res);
}
