
import 'Post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${post.id}'),
      ),
      title: Text('${post.title}'),
      subtitle: Text('${post.body}'),
    );
  }
}

