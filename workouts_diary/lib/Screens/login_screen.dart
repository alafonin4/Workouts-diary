import 'package:flutter/material.dart'; 
import 'package:workouts_diary/Repository/user_repository.dart'; 
import 'package:workouts_diary/secure_storage.dart'; 
import 'package:workouts_diary/application_theme.dart'; 
 
class LoginPage extends StatefulWidget { 
  const LoginPage({super.key}); 
  @override 
  State<LoginPage> createState() => _LoginPageState(); 
} 
 
class _LoginPageState extends State<LoginPage> { 
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 
 
  String _message = ''; 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Вход'), 
        titleTextStyle: theme.textTheme.bodyLarge,
        backgroundColor: Colors.green, // Зелёный фон AppBar 
        centerTitle: true, 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [ 
            TextField( 
              controller: emailController, 
              decoration: const InputDecoration( 
                labelText: 'Электронная почта', 
              ), 
              style: TextStyle(color: Colors.green), 
            ), 
            const SizedBox(height: 10), 
            TextField( 
              controller: passwordController, 
              obscureText: true, 
              decoration: const InputDecoration( 
                labelText: 'Пароль', 
              ), 
              style: TextStyle(color: Colors.green), 
            ), 
            const SizedBox(height: 20), 
            Text(_message, style: const TextStyle(color: Colors.red)), 
            const SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: _logUser, 
              style: ElevatedButton.styleFrom( 
                backgroundColor: Colors.green,
              ), 
              child: const Text('Войти'), 
            ), 
            const SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: () { 
                Navigator.of(context).pushNamed('/registr'); 
              }, 
              style: ElevatedButton.styleFrom( 
                backgroundColor: Colors.green,  
              ), 
              child: const Text('Зарегистрироваться') 

            ), 
          ], 
        ), 
      ), 
    ); 
  } 
 
  Future<bool> _loginUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    
    if (!regExp.hasMatch(email)) {
      setState(() {
        _message = "Неверный формат email";
      });
      return false;
    }
  
    final res = await login(email, password);
    if (res == null) {
      setState(() {
        _message = "Неверный логин или пароль";
      });
      return false;
    }
    final storage = SecureStorage.storage;
    storage.write(key: 'email', value: email);
    storage.write(key: 'token', value: res);
    return true;
  }
 
  void _logUser() async { 
    final b = await _loginUser(); 
    if (b) { 
      Navigator.of(context).pushNamed('/getProgress'); 
    } 
  } 
} 
