import 'package:flutter/material.dart';

final darktheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, 
    onPrimary: Colors.green, 
    onSecondary: Colors.white),
  useMaterial3: true,
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 23,            
    )
  )
);