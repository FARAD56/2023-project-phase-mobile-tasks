import 'package:flutter/material.dart';
import 'package:todolist/create_new_task.dart';
import 'package:todolist/to_do_list.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/todo": (context) => const ToDoList(),
        '/newTask': (context) => const CreateTask(),
      },
      home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset('assets/sticky.png'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/todo");
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ))
      ]),
    );
  }
}
