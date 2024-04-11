import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ToDo {
  String title;
  String description;

  ToDo(this.title, this.description);
}

final todos = List.generate(
  20,
  (index) => ToDo('Todo $index', 'What needs to be done on Todo $index'),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To do list'),
          backgroundColor: Colors.blue,
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
              );
            },
          ),
        ),
      ),
    );
  }
}
  // This widget is the root of your application.



