import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String title){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(4, 16, 4, 0),
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
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.more_vert_outlined,
              size: 36,
            )
          ],
        ),
      ),
    );
  }

