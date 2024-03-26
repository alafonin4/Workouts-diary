import 'package:flutter/material.dart';
import 'package:ne_pr/application_theme.dart';
import 'package:ne_pr/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      initialRoute: '/',
    );
  }
}