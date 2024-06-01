import 'package:flutter/material.dart';
import 'package:workouts_diary/themes/application_theme.dart'; 
 
class TextWidget extends StatefulWidget { 
  const TextWidget({super.key, required this.controller, required this.labelText}); 
  @override 
  State<TextWidget> createState() => _TextWidgetState(); 
  final TextEditingController controller;
  final String labelText;
} 
 
class _TextWidgetState extends State<TextWidget> { 
   
  @override 
  Widget build(BuildContext context) { 
    return TextField( 
      controller: widget.controller, 
      decoration: InputDecoration(labelText: widget.labelText), 
      style: theme.textTheme.bodyMedium,
    ); 
  } 
} 
