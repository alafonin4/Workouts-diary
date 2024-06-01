import 'package:workouts_diary/Repository/Model/absr.dart';

class ErrorResponse extends Absr{
  ErrorResponse({
    required this.message,
    required this.resCode,
  }) : super(resCode: resCode);
  final String message;
  final DateTime timestamp = DateTime.now();
  @override
  final int? resCode;
}