import 'package:flutter/material.dart'; 
import 'package:fl_chart/fl_chart.dart'; 
import 'package:workouts_diary/Repository/get_progress.dart'; 
import 'package:intl/intl.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/bottom_bar.dart';
import 'package:workouts_diary/Widgets/progress_chart.dart';  
 
class ProgressPage extends StatefulWidget { 
  @override 
  _ProgressPageState createState() => _ProgressPageState(); 
} 
 
class _ProgressPageState extends State<ProgressPage> { 
  int selectedCount = 0; 
  List<LineChartBarData> lineBarsData = []; 
 
  void updateChartData(int count) { 
    getProgressByCount(count).then((data) { 
      setState(() { 
        List<FlSpot> spots = data.map((entry) => FlSpot(entry.date.millisecondsSinceEpoch.toDouble(), entry.progress)).toList(); 
 
        spots.insert(0, FlSpot(0, 0)); 
 
        lineBarsData = [ 
          LineChartBarData( 
            spots: spots, 
            isCurved: true, 
            color: Colors.blue, 
            barWidth: 4, 
            isStrokeCapRound: true, 
            dotData: FlDotData(show: false), 
            belowBarData: BarAreaData(show: false), 
          ), 
        ]; 
      }); 
    }).catchError((error) { 
      print('Error fetching data: $error'); 
    }); 
  } 
 
  String formatDate(DateTime date) { 
    return DateFormat('dd/MM/yyyy').format(date); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: const AppBarWidget(title: "Прогресс", 
        isAutomaticallyImplyLeading: false),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[ 
            Row( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                ElevatedButton( 
                  onPressed: () { 
                    setState(() { 
                      selectedCount = 1; 
                      updateChartData(selectedCount); 
                    }); 
                  }, 
                  child: const Text('1 месяц'), 
                ), 
                ElevatedButton( 
                  onPressed: () { 
                      selectedCount = 6; 
                      updateChartData(selectedCount);  
                  }, 
                  child: const Text('6 месяцев'), 
                ), 
                ElevatedButton( 
                  onPressed: () { 
                    setState(() { 
                      selectedCount = 12; 
                      updateChartData(selectedCount); 
                    }); 
                  }, 
                  child: const Text('1 год'), 
                ), 
              ], 
            ), 
            const SizedBox(height: 20), 
            Expanded(  
              child: Padding( 
                padding: const EdgeInsets.only(left: 16.0, right: 16.0), 
                child: ProgressChartWidget(data: lineBarsData)
              ), 
            ), 
            const SizedBox(height: 20), 
            Text('Selected date range: ${formatDate(DateTime.now().subtract(Duration(days: selectedCount)))} -${formatDate(DateTime.now())}'), 
          ], 
        ), 
      ),
      bottomNavigationBar: const BottomBarWidget(currentIndex: 0)
    ); 
  } 
}