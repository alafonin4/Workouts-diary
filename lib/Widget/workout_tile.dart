import 'package:flutter/material.dart';
import 'package:ne_pr/Repository/Model/Workout.dart';

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final Workout coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.dateTime} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        );
      },
    );
  }
}