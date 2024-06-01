import 'package:flutter/material.dart';
import 'package:workouts_diary/Repository/Model/workout.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/bottom_bar.dart';
import 'package:workouts_diary/Widgets/workout_tile.dart';
import 'package:workouts_diary/services/workout_service.dart';

class WorkoutListScreen extends StatefulWidget {
  const WorkoutListScreen({super.key});

  @override
  State<WorkoutListScreen> createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  List<Workout>? _workoutsList;
  late WorkoutService workoutService;

  @override
  void initState() {
    super.initState();
    workoutService = WorkoutService(updateWorkouts: (workoutsList) {
      setState(() {
        _workoutsList = workoutsList;
      });
    });
    workoutService.loadWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Список тренировок",
        isAutomaticallyImplyLeading: false,
      ),
      body: (_workoutsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _workoutsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final workout = _workoutsList![i];
                return WorkoutTile(workout: workout);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addWorkout');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomBarWidget(currentIndex: 1),
    );
  }
}