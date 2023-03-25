import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Friend {
  String name;
  String phone;
  Friend(this.name, this.phone);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Friend> friends = [
      Friend('이테디', '010-1000-2000'), Friend('김스틴', '010-9000-8000'), 
      Friend('이주노', '010-3000-3000'), Friend('임헬렌', '010-2000-8000'), 
      Friend('염해리', '010-1000-1000'), 
    ];

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      width:50,
                      height:50,
                        'https://fastly.picsum.photos/id/970/100/100.jpg?hmac=tv6Z9pRPZU9RsVaBnUPa-aXUxqZJHD6tkWujltTdtak',
                    ),
                  ),
                  title: Text(friends[index].name),
                  subtitle: Text(friends[index].phone),
                  trailing: Icon(Icons.phone),
              );
            },
          ),
        ),
      )
    );
  }
}
