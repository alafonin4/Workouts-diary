import 'package:dio/dio.dart';
import 'package:workouts_diary/Repository/Model/progress_by_date.dart';
import 'package:workouts_diary/secure_storage.dart';

final dio = Dio();

Future<List<ProgressByDate>> getProgressByCount(int count) async {
  try {
    final storage = SecureStorage.storage;
    final token = await storage.read(key: "token");
    var response = await dio.post(
      'http://localhost:8080/progress/getProgressByPeriod',
      data: {
        "token": token,
        "count": count,
      },
    );

    if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<ProgressByDate> progressList = data.map((progressJson) {
          final String dateString = progressJson['date'];
          final DateTime date = DateTime.parse(dateString);
          final double progress = progressJson['progress'].toDouble();
          return ProgressByDate(date, progress);
        }).toList();
        
        return progressList;
      } else {
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
  }
}
