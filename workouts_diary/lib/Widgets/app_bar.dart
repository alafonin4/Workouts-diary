import 'package:flutter/material.dart';
import 'package:workouts_diary/themes/appbar/dark_theme.dart'; 
 
class AppBarWidget extends StatefulWidget implements PreferredSizeWidget { 
  const AppBarWidget({super.key, required this.title, required this.isAutomaticallyImplyLeading}); 
  @override 
  State<AppBarWidget> createState() => _AppBarWidgetState(); 
  final String title;
  final bool isAutomaticallyImplyLeading;
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} 
 
class _AppBarWidgetState extends State<AppBarWidget> { 
   
  @override 
  Widget build(BuildContext context) { 
    return AppBar( 
        title: Text(widget.title), 
        titleTextStyle: darktheme.textTheme.bodyLarge,  
        automaticallyImplyLeading: widget.isAutomaticallyImplyLeading, 
        backgroundColor: darktheme.colorScheme.background, 
        centerTitle: true
      ); 
  } 
} 
