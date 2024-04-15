import 'package:flutter/material.dart';

TextTheme textTheme = ThemeData().textTheme.copyWith(
      bodyLarge: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(238, 111, 87, 1),
      ),
    );
ThemeData themeData = ThemeData(textTheme: textTheme);
