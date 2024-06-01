import 'package:flutter/material.dart';
import 'package:workouts_diary/themes/application_theme.dart';
import 'package:workouts_diary/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Diary',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme( 
          color: Colors.green,
          titleTextStyle: theme.textTheme.bodyMedium,
          centerTitle: true,
        ),        
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}