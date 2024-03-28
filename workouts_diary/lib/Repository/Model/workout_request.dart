import 'package:workouts_diary/Repository/Model/exercise.dart';

class WorkoutRequest {
  const WorkoutRequest({
    required this.name,
    required this.exercises,
  });

  final String name;
  final List<Exercise> exercises;
}