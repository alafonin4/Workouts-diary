import 'package:ne_pr/Repository/Model/workout.dart';
import 'package:ne_pr/Repository/Model/exercise.dart';
import 'package:dio/dio.dart';

class WorkoutRepository {
  Future<List<Workout>> getCoinsList(String email) async {
    final response = await Dio().get(
        'https:/localhost/8080/api/getAllWorkoutsByAthor/$email');

    final data = response.data as Map<String, dynamic>;
    final workoutsList = data.entries.map((e) {
      final workout = e.value as Map<String, dynamic>;
      final name = workout['name'];
      final date = workout['date'];
      final exerc = workout['exercise'] as Map<String, dynamic>;
      final ex = exerc.entries.map((en) {
        final exercise = e.value as Map<String, dynamic>;
        final nameOfExercise = exercise['name'];
        final reps = exercise['reps'];
        final sets = exercise['reps'];

        return Exercise(name: nameOfExercise, reps: reps, sets: sets);
      }).toList();

      return Workout(
        name: name,
        dateTime: date,
        exercises: ex,
      );
    }).toList();
    return workoutsList;
  }
}