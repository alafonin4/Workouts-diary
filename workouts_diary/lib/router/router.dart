import 'package:workouts_diary/Screens/log_out_screen.dart';
import 'package:workouts_diary/Screens/progress_page.dart';
import 'package:workouts_diary/Screens/registration_screen.dart';
import 'package:workouts_diary/Screens/login_screen.dart';
import 'package:workouts_diary/Screens/workout_list_screen.dart';
import 'package:workouts_diary/Screens/workout_add_screen.dart';

final routes = {
  '/' : (context) => const LoginPage(),
  '/registr' : (context) => const RegistrationPage(title: 'Регистрация'),
  '/logout' : (context) => const LogOutPage(),
  '/workoutsList': (context) => const WorkoutListScreen(),
  '/addWorkout': (context) => const AddWorkoutPage(),
  '/getProgress': (context) => ProgressPage(),
};