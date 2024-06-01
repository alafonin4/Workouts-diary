import 'package:flutter/material.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/password_text.dart';
import 'package:workouts_diary/Widgets/text.dart';
import 'package:workouts_diary/services/registration_service.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.title});

  final String title;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String _message = '';

  late RegistrationService registrationService;

  @override
  void initState() {
    super.initState();
    registrationService = RegistrationService(
      emailController: emailController,
      passwordController: passwordController,
      confirmPasswordController: confirmPasswordController,
      updateMessage: (message) {
        setState(() {
          _message = message;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final greenTextStyle = TextStyle(color: Colors.green);
    final greenButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    );

    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        isAutomaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(controller: emailController, labelText: "Электронная почта"),
            SizedBox(height: 10),
            PasswordTextField(controller: passwordController, labelText: "Пароль"),
            SizedBox(height: 10),
            PasswordTextField(controller: confirmPasswordController, labelText: 'Подтвердите пароль'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => registrationService.registerUserAndNavigate(context),
              style: greenButtonStyle, // Стиль кнопки
              child: const Text('Зарегистрироваться', style: TextStyle(color: Colors.black)), // Чёрный текст
            ),
            SizedBox(height: 10),
            Text(_message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}