import 'package:flutter/material.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/password_text.dart';
import 'package:workouts_diary/Widgets/text.dart';
import 'package:workouts_diary/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _message = '';

  late AuthService authService;

  @override
  void initState() {
    super.initState();
    authService = AuthService(
      emailController: emailController,
      passwordController: passwordController,
      updateMessage: (message) {
        setState(() {
          _message = message;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Вход", isAutomaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(controller: emailController, labelText: "Электронная почта"),
            const SizedBox(height: 10),
            PasswordTextField(controller: passwordController, labelText: "Пароль"),
            const SizedBox(height: 20),
            Text(_message, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authService.logUser(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Войти', style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/registr');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Зарегистрироваться', style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,)
              )
            ),
          ],
        ),
      ),
    );
  }
}