import 'package:flutter/material.dart';
import 'package:ne_pr/Repository/Model/Workout.dart';
import 'package:ne_pr/Repository/WorkoutRepository.dart';
import 'package:ne_pr/Widget/workout_tile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WorkoutListScreen extends StatefulWidget {
  @override
  State<WorkoutListScreen> createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  List<Workout>? _workoutsList;

  final storage = const FlutterSecureStorage();
  String? email;
  @override
  void initState() {
    _loadWorkouts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts List'),

      ),
      body: (_workoutsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _workoutsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final workout = _workoutsList![i];
                return WorkoutTile(coin: workout);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/addWorkout');
        },
        child: const Icon(Icons.add),
        ),      
    );
  }

  Future<void> _loadWorkouts() async {
    email = await storage.read(key: 'email');
    if (email == null) {
      _workoutsList = null;
      setState(() {});
      return;
    }
    _workoutsList = await WorkoutRepository().getCoinsList(email!) as List<Workout>;
    setState(() {});
  }
}