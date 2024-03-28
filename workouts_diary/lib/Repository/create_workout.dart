import 'package:dio/dio.dart';
import 'package:workouts_diary/Repository/Model/workout_request.dart';
import 'package:workouts_diary/secure_storage.dart';

final dio = Dio(); 

Future<String?> create(WorkoutRequest workout) async {
  try {
    final storage = SecureStorage.storage;
    final token = await storage.read(key: "token");

    List<Map<String, dynamic>> exercisesData = workout.exercises.map((exercise) {
      return {
        'name': exercise.name,
        'reps': exercise.reps,
        'sets': exercise.sets,
      };
    }).toList();

    var response = await dio.post(
      'http://localhost:8080/workouts/create',
      data: {
        "token" : token,
        "name": workout.name,
        "exercises" : exercisesData
      },
    );

    if (response.statusCode == 200) {
      return "Сохранено"; 
    } else {
      return null;
    }
  } catch (e) {
    print("erngier $e");
    return null;
  }
}