import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, onBackground: Colors.green),
  useMaterial3: true,
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 23,            
    ),
    bodyMedium: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    )
  )
);