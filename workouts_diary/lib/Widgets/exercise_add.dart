import 'package:flutter/material.dart';
import 'package:workouts_diary/Repository/Model/exercise.dart';
import 'package:workouts_diary/themes/application_theme.dart';

class AddExercise extends StatelessWidget {
  AddExercise({
    super.key,
    required this.title,
    required this.nameController,
    required this.repsController,
    required this.setsController,
    required this.onSave
  });

  final String title;
  final TextEditingController nameController;
  final TextEditingController repsController;
  final TextEditingController setsController;
  final Function(Exercise) onSave;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New exercise'),
      surfaceTintColor: theme.colorScheme.onBackground,
      content: Column(
        children: [
          TextField(controller: nameController, 
            decoration: const InputDecoration(labelText: 'Название упражнения'),
            style: theme.textTheme.bodyMedium
          ),
          TextField(controller: setsController, 
            decoration: const InputDecoration(labelText: 'Количество подходов'),
            style: theme.textTheme.bodyMedium
          ),
          TextField(controller: repsController, 
            decoration: const InputDecoration(labelText: 'Количество повторений'),
            style: theme.textTheme.bodyMedium
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Сохранить'),
          onPressed: () {
            final exercise = Exercise(
              name: nameController.text,
              reps: int.parse(repsController.text),
              sets: int.parse(setsController.text),
            );
            onSave(exercise);
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Закрыть'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}