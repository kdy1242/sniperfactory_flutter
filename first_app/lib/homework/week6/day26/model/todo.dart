
class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(userId: map['userId'], id: map['id'], title: map['title'], completed: map['completed']);
  }
}
