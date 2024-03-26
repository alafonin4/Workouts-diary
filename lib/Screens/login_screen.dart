import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final email = await storage.read(key: 'email');
    final password = await storage.read(key: 'password');
    if (email != null && password != null) {
      setState(() {
        emailController.text = email;
        passwordController.text = password;
      });
    }
  }

  Future<void> _loginUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Ваша логика для аутентификации пользователя
    
    // Сохранение логина и пароля после успешной аутентификации
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginUser,
              child: const Text('Войти'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:() {
                Navigator.of(context).pushNamed('/registr');
              },
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}