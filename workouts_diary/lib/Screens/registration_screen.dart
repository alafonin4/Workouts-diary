import 'package:flutter/material.dart';
import 'package:workouts_diary/Repository/user_repository.dart';
import 'package:workouts_diary/secure_storage.dart';
import 'package:workouts_diary/application_theme.dart'; 

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

  @override
  void initState() {
    super.initState();
  }

  void _registUser() async{
    final b = await _registerUser();
    if (b) {
      Navigator.of(context).pushNamed('/workoutsList');
    }
  }
  Future<bool> _registerUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    
    if (!regExp.hasMatch(email)) {
      setState(() {
        _message = "Неверный формат email";
      });
      return false;
    }

    if (password != confirmPassword) {
      setState(() {
        _message = 'Пароли не совпадают';
      });
      return false;
    }

    final res = await register(email, password);
    if (res == null) {
      return false;
    }
    final storage = SecureStorage.storage;
    storage.write(key: 'email', value: email);
    storage.write(key: 'token', value: res);
    return true;
  }
 
  @override 
  Widget build(BuildContext context) { 
    // Зелёный цвет для текста и кнопок 
    final greenTextStyle = TextStyle(color: Colors.green); 
    final greenButtonStyle = ElevatedButton.styleFrom( 
      backgroundColor: Colors.green, // Фон кнопки 
    ); 
 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.green, 
        title: Text(widget.title),  
        titleTextStyle: theme.textTheme.bodyLarge, 
        centerTitle: true, 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [ 
            TextField( 
              controller: emailController, 
              decoration: const InputDecoration(labelText: 'Электронная почта'), 
              style: greenTextStyle, // Зелёный текст 
            ), 
            SizedBox(height: 10), 
            TextField( 
              controller: passwordController, 
              obscureText: true, 
              decoration: const InputDecoration(labelText: 'Пароль'), 
              style: greenTextStyle, // Зелёный текст 
            ), 
            SizedBox(height: 10), 
            TextField( 
              controller: confirmPasswordController, 
              obscureText: true, 
              decoration: const InputDecoration(labelText: 'Подтвердите пароль'), 
              style: greenTextStyle, // Зелёный текст 
            ), 
            SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: _registUser, 
              style: greenButtonStyle, // Стиль кнопки 
              child: Text('Зарегистрироваться', style: TextStyle(color: Colors.black)), // Чёрный текст 
            ), 
            SizedBox(height: 10), 
            Text(_message, style: TextStyle(color: Colors.red)), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
