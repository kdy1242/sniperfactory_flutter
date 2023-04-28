
import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:first_app/homework/week6/day26/widget/todo_card.dart';
import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../widget/filter_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TodoFilter _filter = TodoFilter.all;

  // 데이터 불러오기
  Future<List<Todo>> getData() async {
    Dio dio = Dio();
    String url = 'https://jsonplaceholder.typicode.com/todos';
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      return data.map((e) => Todo.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Todo App'),
        // blur
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.transparent)
          )
        ),
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (context) => FilterBottomSheet(
                  filter: _filter, onApply: (filter) {
                    setState(() {
                      _filter = filter;
                    });
                  },
                ),
              );
            },
            icon: Icon(Icons.filter_list)
          ),
          IconButton(
            onPressed: (){
              setState((){});
            },
            icon: Icon(Icons.restart_alt)
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                var todo = todos[index];
                switch (_filter) {
                  case TodoFilter.completed:
                    return todo.completed ? TodoCard(todo: todo) : Container();
                  case TodoFilter.incompleted:
                    return !todo.completed ? TodoCard(todo: todo) : Container();
                  default:
                    return TodoCard(todo: todo);
                }
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
