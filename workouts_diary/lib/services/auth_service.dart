import 'package:flutter/material.dart';
import 'package:workouts_diary/Repository/user_repository.dart';
import 'package:workouts_diary/secure_storage.dart';

class AuthService {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String) updateMessage;

  AuthService({
    required this.emailController,
    required this.passwordController,
    required this.updateMessage,
  });

  Future<bool> loginUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    
    if (!regExp.hasMatch(email)) {
      updateMessage("Неверный формат email");
      return false;
    }
  
    final res = await login(email, password);
    if (res == null) {
      updateMessage("Неверный логин или пароль");
      return false;
    }
    final storage = SecureStorage.storage;
    storage.write(key: 'email', value: email);
    storage.write(key: 'token', value: res);
    return true;
  }

  void logUser(BuildContext context) async {
    final success = await loginUser();
    if (success) {
      Navigator.of(context).pushNamed('/getProgress');
    }
  }
}