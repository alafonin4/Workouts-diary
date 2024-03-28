import 'package:workouts_diary/Repository/Model/absr.dart';

class ApiResponse extends Absr{
  const ApiResponse({
    required this.accessToken,
    required this.message,
    required this.resCode,
  }) : super(resCode: resCode);
  final String accessToken;
  final String message;
  @override
  final int? resCode;
}