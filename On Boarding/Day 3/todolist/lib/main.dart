import 'package:flutter/material.dart';

import 'package:todolist/create_new_task.dart';
import 'package:todolist/edit_task.dart';
import 'package:todolist/task_details.dart';
import 'package:todolist/to_do_list.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Container(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
      routes: {
        "/todo": (context) => const ToDoList(),
        '/newTask': (context) => const CreateTask(),
        '/taskDetail': (context) => const TaskDetails(),
        '/editTask': (context) => const EditTask(),
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
