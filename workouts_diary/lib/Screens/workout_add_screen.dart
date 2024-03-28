import 'package:flutter/material.dart'; 
import 'package:workouts_diary/Repository/Model/exercise.dart'; 
import 'package:workouts_diary/Repository/Model/workout_request.dart'; 
import 'package:workouts_diary/Repository/create_workout.dart'; 
import 'package:workouts_diary/Widgets/exercise_add.dart'; 
import 'package:workouts_diary/application_theme.dart'; 
 
class AddWorkoutPage extends StatefulWidget { 
  const AddWorkoutPage({super.key}); 
  @override 
  State<AddWorkoutPage> createState() => _AddWorkoutPageState(); 
} 
 
class _AddWorkoutPageState extends State<AddWorkoutPage> { 
   
  TextEditingController nameController = TextEditingController(); 
  final List<Exercise> exercises = []; 
  int _selectedIndex = 0; 
 
  void _add() async { 
    WorkoutRequest workout = WorkoutRequest(name: nameController.text.trim(), exercises: exercises); 
    final b = await create(workout); 
    if (b != null) { 
      Navigator.of(context).pop(); 
    } 
  } 
 
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
        title: const Text('Создание новой тренировки'), 
        titleTextStyle: theme.textTheme.bodyLarge,  
        automaticallyImplyLeading: false, 
      ), 
      body: Padding(padding: const EdgeInsets.all(16.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [ 
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Название тренировки',
              labelStyle: Theme.of(context).textTheme.bodyMedium),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton (
              child: const Text('Добавить упражнение'),
              onPressed: () {
                TextEditingController nameController = TextEditingController();
                TextEditingController repsController = TextEditingController();
                TextEditingController setsController = TextEditingController();

                showDialog(
                  context: context,
                  builder: (context) {
                    return AddExercise(title: "Новое упражение", 
                    nameController: nameController, 
                    repsController: repsController, 
                    setsController: setsController,
                    onSave: (exercise) => {
                      exercises.add(exercise),
                      print("nore")
                    },);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton (
              child: const Text('Сохранить тренировку'),
              onPressed: () {
                _add();
              },
            ),
            ElevatedButton (
              child: const Text('Закрыть'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ] 
        ) 
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
