import 'package:flutter/material.dart';
import 'package:workouts_diary/Repository/user_repository.dart';
import 'package:workouts_diary/secure_storage.dart';

class RegistrationService {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function(String) updateMessage;

  RegistrationService({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.updateMessage,
  });

  Future<bool> registerUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    
    if (!regExp.hasMatch(email)) {
      updateMessage("Неверный формат email");
      return false;
    }

    if (password != confirmPassword) {
      updateMessage('Пароли не совпадают');
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

  void registerUserAndNavigate(BuildContext context) async {
    final success = await registerUser();
    if (success) {
      Navigator.of(context).pushNamed('/workoutsList');
    }
  }
}