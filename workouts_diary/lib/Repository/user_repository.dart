import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio(); 

Future<String?> register(String email, String password) async {
  try {
    var response = await dio.post(
      'http://127.0.0.1:8080/auth/register',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      return null;
    }
  } catch (e) {
    debugPrint(e.toString());
      return null;
  }
}


Future<String?> login(String email, String password) async {
  try {
    var response = await dio.post(
      'http://localhost:8080/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return response.data['token']; 
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}