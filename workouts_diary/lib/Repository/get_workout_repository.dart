import 'package:workouts_diary/Repository/Model/workout.dart';
import 'package:workouts_diary/Repository/Model/exercise.dart';
import 'package:dio/dio.dart';

class GetWorkoutRepository {
  Future<List<Workout>?> getWorkoutsList(String token) async {
    try {
      final response = await Dio().post(
        'http://localhost:8080/workouts/get', 
        data: {
          "token" : token,
        },);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Workout> workoutsList = data.map((workoutJson) {
          final String name = workoutJson['name'];
          final String dateTimeString = workoutJson['workoutTime'];
          final DateTime dateTime = DateTime.parse(dateTimeString);
          final List<dynamic> exercisesJson = workoutJson['exercises'];
          final List<Exercise> exercises = exercisesJson.map((exerciseJson) {
            final String name = exerciseJson['name'];
            final int reps = exerciseJson['reps'];
            final int sets = exerciseJson['sets'];
            return Exercise(name: name, reps: reps, sets: sets);
          }).toList();
          return Workout(name: name, dateTime: dateTime, exercises: exercises);
        }).toList();
        return workoutsList;
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}