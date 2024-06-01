import 'package:workouts_diary/Repository/Model/workout.dart';
import 'package:workouts_diary/Repository/get_workout_repository.dart';
import 'package:workouts_diary/secure_storage.dart';

class WorkoutService {
  final Function(List<Workout>?) updateWorkouts;

  WorkoutService({required this.updateWorkouts});

  Future<void> loadWorkouts() async {
    final storage = SecureStorage.storage;
    final token = await storage.read(key: "token");

    if (token == null) {
      updateWorkouts(null);
      return;
    }

    final workoutsList = await GetWorkoutRepository().getWorkoutsList(token);
    updateWorkouts(workoutsList);
  }
}