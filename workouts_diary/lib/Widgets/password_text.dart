import 'package:flutter/material.dart';
import 'package:workouts_diary/themes/application_theme.dart'; 
 
class PasswordTextField extends StatefulWidget { 
  const PasswordTextField({super.key, required this.controller, required this.labelText}); 
  @override 
  State<PasswordTextField> createState() => _PasswordTextFieldState(); 
  final TextEditingController controller;
  final String labelText;
} 
 
class _PasswordTextFieldState extends State<PasswordTextField> { 
   
  @override 
  Widget build(BuildContext context) { 
    return TextField( 
      controller: widget.controller, 
      obscureText: true, 
      decoration: InputDecoration(labelText: widget.labelText), 
      style: theme.textTheme.bodyMedium,
    ); 
  } 
} 
