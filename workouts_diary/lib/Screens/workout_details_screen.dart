import 'package:flutter/material.dart'; 
import 'package:workouts_diary/Repository/Model/workout.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/bottom_bar.dart'; 
 
class WorkoutDetailsPage extends StatefulWidget { 
  final Workout workout; 
 
  const WorkoutDetailsPage({super.key, required this.workout}); 
 
  @override 
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState(); 
} 
 
class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: const AppBarWidget(title: "Информация о тренировке", 
        isAutomaticallyImplyLeading: true),
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
      bottomNavigationBar: const BottomBarWidget(currentIndex: 1)
    ); 
  } 
} 
