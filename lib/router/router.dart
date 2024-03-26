import 'package:ne_pr/Screens/log_out_screen.dart';
import 'package:ne_pr/Screens/login_screen.dart';
import 'package:ne_pr/Screens/registration_screen.dart';
import 'package:ne_pr/Screens/workout_list_screen.dart';

final routes = {
  '/' : (context) => const LoginPage(),
  '/registr' : (context) => const RegistrationPage(title: 'Регистрация'),
  '/logout' : (context) => const LogOutPage(),
  '/workoutsList': (context) => WorkoutListScreen(),
  '/addWorkout': (context) => WorkoutListScreen(),
};