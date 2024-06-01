import 'package:flutter/material.dart'; 
import 'package:workouts_diary/Repository/Model/exercise.dart'; 
import 'package:workouts_diary/Repository/Model/workout_request.dart'; 
import 'package:workouts_diary/Repository/create_workout.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/bottom_bar.dart'; 
import 'package:workouts_diary/Widgets/exercise_add.dart';
import 'package:workouts_diary/Widgets/text.dart'; 
import 'package:workouts_diary/themes/application_theme.dart'; 
 
class AddWorkoutPage extends StatefulWidget { 
  const AddWorkoutPage({super.key}); 
  @override 
  State<AddWorkoutPage> createState() => _AddWorkoutPageState(); 
} 
 
class _AddWorkoutPageState extends State<AddWorkoutPage> { 
   
  TextEditingController nameController = TextEditingController(); 
  final List<Exercise> exercises = []; 
 
  void _add() async { 
    WorkoutRequest workout = WorkoutRequest(name: nameController.text.trim(), exercises: exercises); 
    final b = await create(workout); 
    if (b != null) { 
      Navigator.of(context).pushNamed('/workoutsList'); 
    } 
  } 
   
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: const AppBarWidget(title: "Создание новой тренировки", 
        isAutomaticallyImplyLeading: true),
      body: Padding(padding: const EdgeInsets.all(16.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [ 
            TextWidget(controller: nameController, labelText: 'Название тренировки'),
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
                      exercises.add(exercise)
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
      bottomNavigationBar: const BottomBarWidget(currentIndex: 1)
    ); 
  } 
} 
