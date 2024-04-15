import 'package:flutter/material.dart';
import 'package:todolist/features/presentation/widgets/app_bar.dart';

import '../../../models/taskclass.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  String date = '2019-11-23';
  @override
  Widget build(BuildContext context) {
    Task task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: customAppBar(context, ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8, 0, 24),
              alignment: AlignmentDirectional.center,
              child: Text('Edit Task',
                  style: Theme.of(context).textTheme.bodyLarge!),
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Main task name',
                  style: Theme.of(context).textTheme.bodyMedium!,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: TextField(
                key: const Key('edit title'),
                controller: titleController,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  hintText: task.getTitle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 8, 0, 0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                'Due date',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 111, 87, 1)),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.getDate(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () async {
                        final datetime = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.utc(2050, 12, 30));
                        setState(() {
                          if (datetime != null) {
                            date = datetime.toString();
                            date = date.split(' ')[0];
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.date_range_outlined,
                        size: 30,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 8, 0, 0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                'Desciption',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(238, 111, 87, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: TextField(
                key: const Key('edit description'),
                controller: descriptionController,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  hintText: task.getDescription(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                key: const Key('edit task'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                ),
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (settings) {
                      setState(() {
                        if (titleController.text != '') {
                          task.setTitle(titleController.text);
                        } else {
                          task.setTitle(task.getTitle());
                        }

                        if (descriptionController.text != '') {
                          task.setDescription(descriptionController.text);
                        } else {
                          task.setDescription(task.getDescription());
                        }

                        if (date != task.getDate()) {
                          task.setDate(date);
                        } else {
                          task.setDate(task.getDate());
                        }
                      });
                      return settings.settings.name == '/todo';
                    },
                  );
                },
                child: const Text(
                  'Edit Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
