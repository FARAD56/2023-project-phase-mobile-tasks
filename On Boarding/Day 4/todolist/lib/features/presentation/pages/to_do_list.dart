import 'package:flutter/material.dart';
import 'package:todolist/features/presentation/widgets/app_bar.dart';

import '../../../models/taskclass.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Todo List'),
      body: Column(
        children: [
          Image.asset(
            'assets/stick1.png',
            width: 230,
            height: 175,
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: const Text(
              'Tasks list',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskManager.tasks.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/taskDetail',
                        arguments: taskManager.tasks[index]);
                    setState(() {});
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.all(12.0),
                    elevation: 5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      tileColor: Colors.white,
                      leading: Text(
                        taskManager.tasks[index].getTitle()[0],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontSize: 22,
                        ),
                      ),
                      title: Text(
                        taskManager.tasks[index].getTitle(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: const Text(
                        'Design',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 13,
                        ),
                      ),
                      trailing: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            taskManager.tasks[index].getDate(),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 0, 2, 0),
                            height: double.infinity,
                            width: 3,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                onPressed: () async {
                  Task task =
                      await Navigator.pushNamed(context, "/newTask") as Task;
                  setState(() {
                    taskManager.tasks.add(task);
                  });
                },
                child: const Text(
                  'Create Task',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
