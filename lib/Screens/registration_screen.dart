import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  final storage = const FlutterSecureStorage();

  String _message = '';

  void _registUser() {
    _registerUser();
    Navigator.of(context).pushNamed('/workoutsList');
  }
  Future<void> _registerUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      setState(() {
        _message = 'Пароли не совпадают';
      });
      return;
    }
    
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Регистрация'),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Электронная почта',
              labelStyle: Theme.of(context).textTheme.bodyMedium),
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Пароль', 
              labelStyle: Theme.of(context).textTheme.bodyMedium),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Подтвердите пароль', 
              labelStyle: Theme.of(context).textTheme.bodyMedium),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registUser,
              child: const Text('Зарегистрироваться'),
            ),
            const SizedBox(height: 10),
            Text(_message, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
      
    );
  }
}