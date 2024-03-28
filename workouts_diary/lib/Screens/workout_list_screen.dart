import 'package:flutter/material.dart';
import 'package:workouts_diary/Repository/Model/workout.dart';
import 'package:workouts_diary/Repository/get_workout_repository.dart';
import 'package:workouts_diary/Widgets/workout_tile.dart';
import 'package:workouts_diary/application_theme.dart';
import 'package:workouts_diary/secure_storage.dart';

class WorkoutListScreen extends StatefulWidget {
  const WorkoutListScreen({super.key});
  @override
  State<WorkoutListScreen> createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  List<Workout>? _workoutsList;
  int _selectedIndex = 0; 
  @override
  void initState() {
    _loadWorkouts();
    super.initState();
  }
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
    switch(index){ 
      case 0: 
        Navigator.of(context).pushNamed('/getProgress');  
        break; 
      case 1:  
        Navigator.of(context).pushNamed('/workoutsList');  
        break; 
      case 2:  
        Navigator.of(context).pushNamed('/logout');  
        break;
      default: 
        break; 
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список тренировок'),
        titleTextStyle: theme.textTheme.bodyLarge,
        automaticallyImplyLeading: false,
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
        onPressed: (){
          Navigator.of(context).pushNamed('/addWorkout');
        },
        child: const Icon(Icons.add),
        ),  
        bottomNavigationBar: BottomNavigationBar( 
        backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[ 
            BottomNavigationBarItem( 
              icon: Icon(Icons.show_chart), 
              label: 'График', 
            ), 
            BottomNavigationBarItem( 
              icon: Icon(Icons.list), 
              label: 'Список', 
            ), 
            BottomNavigationBarItem( 
              icon: Icon(Icons.person), 
              label: 'Профиль', 
            ), 
          ], 
          currentIndex: 1, 
          selectedItemColor: Colors.amber[800], 
          onTap: _onItemTapped, // Обработчик нажатия 
      ), 
    ); 
  } 

  Future<void> _loadWorkouts() async {
    final storage = SecureStorage.storage;
    
    final token = await storage.read(key: "token");
    print(token);
    if (token == null) {
      _workoutsList = null;
      setState(() {});
      return;
    }
    _workoutsList = await GetWorkoutRepository().getWorkoutsList(token);
    setState(() {});
  }
}