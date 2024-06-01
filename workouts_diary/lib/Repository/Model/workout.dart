import 'package:workouts_diary/Repository/Model/exercise.dart';

class Workout {
  const Workout({
    required this.name,
    required this.dateTime,
    required this.exercises,
  });

  final String name;
  final DateTime dateTime;
  final List<Exercise> exercises;
}