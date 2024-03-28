import 'package:flutter/material.dart'; 
import 'package:fl_chart/fl_chart.dart'; 
import 'package:workouts_diary/Repository/get_progress.dart'; 
import 'package:intl/intl.dart'; 
import 'package:workouts_diary/application_theme.dart'; 
 
class ProgressPage extends StatefulWidget { 
  @override 
  _ProgressPageState createState() => _ProgressPageState(); 
} 
 
class _ProgressPageState extends State<ProgressPage> { 
  int selectedCount = 0; 
  int _selectedIndex = 0; 
  List<LineChartBarData> lineBarsData = []; 

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
      appBar: AppBar( 
        title: Text('Progress Page'), 
        titleTextStyle: theme.textTheme.bodyLarge, 
        automaticallyImplyLeading: false, 
      ), 
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
                  child: const Text('6 мясецев'), 
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
                child: LineChart( 
                  LineChartData( 
                    lineBarsData: lineBarsData, 
                    minY: 0, 
                    titlesData: const FlTitlesData( 
                      bottomTitles: AxisTitles( 
                        sideTitles: SideTitles(showTitles: false), 
                      ), 
                      topTitles: AxisTitles( 
                        sideTitles: SideTitles(showTitles: false), 
                      ), 
                      leftTitles: AxisTitles( 
                        sideTitles: SideTitles(showTitles: false), 
                      ), 
                      rightTitles: AxisTitles( 
                        sideTitles: SideTitles(showTitles: false), 
                      ), 
                    ), 
                    gridData: FlGridData(show: false), 
                    borderData: FlBorderData( 
                      show: true, 
                      border: Border.all(color: Color(0xff37434d), width: 1), 
                    ),  
                  ), 
                ), 
              ), 
            ), 
            const SizedBox(height: 20), 
            Text('Selected date range: ${formatDate(DateTime.now().subtract(Duration(days: selectedCount)))} -${formatDate(DateTime.now())}'), 
          ], 
        ), 
        
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
          currentIndex: _selectedIndex,  
          selectedItemColor: Colors.amber[800], 
          onTap: _onItemTapped, 
      ),

    ); 
  } 
}