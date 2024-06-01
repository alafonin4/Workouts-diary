import 'package:flutter/material.dart';
import 'package:workouts_diary/themes/application_theme.dart';
import 'package:workouts_diary/Repository/Model/workout.dart';
import 'package:workouts_diary/Screens/workout_details_screen.dart';

class WorkoutTile extends StatefulWidget {
  const WorkoutTile({super.key, required this.workout});
  @override
  State<WorkoutTile> createState() => _WorkoutTileState();

  final Workout workout;
}

class _WorkoutTileState extends State<WorkoutTile> {
  String? email;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.workout.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${widget.workout.dateTime} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => WorkoutDetailsPage(workout: widget.workout))
        );
      },
    );
  }

}