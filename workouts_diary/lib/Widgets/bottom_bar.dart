import 'package:flutter/material.dart';
import 'package:workouts_diary/themes/bottombar/dark_theme.dart'; 
 
class BottomBarWidget extends StatefulWidget  { 
  const BottomBarWidget({super.key, required this.currentIndex}); 
  @override 
  State<BottomBarWidget> createState() => _BottomBarWidgetState(); 
  final int currentIndex;
  
} 
 
class _BottomBarWidgetState extends State<BottomBarWidget> { 

  void _onItemTapped(int index) {  
    switch(index){ 
      case 0: 
        Navigator.of(context).pushNamed('/getProgress');  
        break; 
      case 1:  
        Navigator.of(context).pushNamed('/workoutsList');  
        break; 
      case 2:  
        Navigator.of(context).pushNamed('/logout');  
        break;
      default: 
        break; 
    }
  } 
   
  @override 
  Widget build(BuildContext context) { 
    return BottomNavigationBar( 
        backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[ 
            BottomNavigationBarItem( 
              icon: Icon(Icons.show_chart), 
              label: 'Прогресс', 
            ), 
            BottomNavigationBarItem( 
              icon: Icon(Icons.list), 
              label: 'Список', 
            ), 
            BottomNavigationBarItem( 
              icon: Icon(Icons.person), 
              label: 'Профиль', 
            ), 
          ], 
          currentIndex: widget.currentIndex, 
          selectedItemColor: darktheme.colorScheme.onPrimary, 
          unselectedItemColor: darktheme.colorScheme.onSecondary,
          onTap: _onItemTapped,
    );
  } 
} 
