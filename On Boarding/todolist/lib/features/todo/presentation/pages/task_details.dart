import 'package:flutter/material.dart';
import 'package:todolist/features/todo/presentation/widgets/app_bar.dart';

import '../../../../models/taskclass.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Task task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: customAppBar(context, 'Task Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/TaskDetails.png',
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                'Title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(238, 111, 87, 1)),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  task.getTitle(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                'Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(238, 111, 87, 1)),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 25),
                child: Text(
                  task.getDescription(),
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                'Deadline',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(238, 111, 87, 1)),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      task.getDate(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                'Status',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(238, 111, 87, 1)),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      task.getStatus() == Status.completed
                          ? 'Completed'
                          : task.getStatus() == Status.inProgress
                              ? 'In Progress'
                              : 'Not Started',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/editTask', arguments: task);
                  },
                  child: const Text(
                    'Edit Task',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
