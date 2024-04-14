import 'package:flutter/material.dart';

import 'models/taskclass.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  String date = DateTime.now().toString().split(' ')[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color.fromRGBO(238, 111, 87, 1),
                  size: 32,
                ),
              ),
              const Icon(
                Icons.more_vert_outlined,
                size: 36,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 24),
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'Create new task',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  'Main task name',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(238, 111, 87, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Text';
                    }
                    return null;
                  },
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'eg. UI/UX Design App',
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
                  child: InkWell(
                    onTap: () async {
                      final dateTime = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.utc(2050, 12, 30));
                      setState(() {
                        if (dateTime != null) {
                          date = dateTime.toString();
                          date = date.split(' ')[0];
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.date_range_outlined,
                          size: 30,
                          color: Color.fromRGBO(238, 111, 87, 1),
                        )
                      ],
                    ),
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
                      color: Color.fromRGBO(238, 111, 87, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText:
                        'eg. First I have to animate the logo and later prototype my design',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Task task = Task(titleController.text,
                          descriptionController.text, date);
                      Navigator.pop(context, task);
                    }
                  },
                  child: const Text(
                    'Add Task',
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
      ),
    );
  }
}
