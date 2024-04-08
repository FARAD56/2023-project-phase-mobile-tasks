import 'package:flutter/material.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

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
      body: Column(
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
          )
        ],
      ),
    );
  }
}
