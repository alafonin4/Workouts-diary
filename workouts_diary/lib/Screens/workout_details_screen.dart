import 'package:flutter/material.dart'; 
import 'package:workouts_diary/Repository/Model/workout.dart'; 
import 'package:workouts_diary/application_theme.dart'; 
 
class WorkoutDetailsPage extends StatefulWidget { 
  final Workout workout; 
 
  const WorkoutDetailsPage({super.key, required this.workout}); 
 
  @override 
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState(); 
} 
 
class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> { 
  
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
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
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Информация о тренировке'), 
        titleTextStyle: theme.textTheme.bodyLarge,  
        automaticallyImplyLeading: false, 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [ 
            Text( 
              'Дата и время:', 
              style: Theme.of(context).textTheme.bodyMedium, 
            ), 
            Text( 
              widget.workout.dateTime.toString(), 
              style: const TextStyle(fontSize: 16), 
            ), 
            const SizedBox(height: 20), 
            Text( 
              'Упражнения:', 
              style: Theme.of(context).textTheme.bodyMedium, 
            ), 
            Expanded( 
              child: ListView( 
                children: widget.workout.exercises.map((exercise) { 
                  return Padding( 
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0), 
                    child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [ 
                        Text( 
                          'Название: ${exercise.name}', 
                          style: Theme.of(context).textTheme.bodyMedium, 
                        ), 
                        Text( 
                          'Подходы: ${exercise.sets}', 
                          style: Theme.of(context).textTheme.bodyMedium, 
                        ), 
                        Text( 
                          'Повторения: ${exercise.reps}', 
                          style: Theme.of(context).textTheme.bodyMedium, 
                        ), 
                        const SizedBox(height: 10), 
                      ], 
                    ), 
                  ); 
                }).toList(), 
              ), 
            ), 
          ], 
        ),
         
      ), 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, 
        items: const [ 
          BottomNavigationBarItem( 
            icon: Icon(Icons.show_chart), 
            label: 'График', 
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
        currentIndex: _selectedIndex, // Текущий выбранный элемент 
        selectedItemColor: Colors.amber[800], // Цвет активного элемента 
        onTap: _onItemTapped, // Обработчик нажатий 
      ),
    ); 
  } 
} 
