import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart'; 
 
class ProgressChartWidget extends StatefulWidget { 
  const ProgressChartWidget({super.key, required this.data}); 
  @override 
  State<ProgressChartWidget> createState() => _ProgressChartWidgetState(); 
  final List<LineChartBarData> data;
  
} 
 
class _ProgressChartWidgetState extends State<ProgressChartWidget> { 
   
  @override 
  Widget build(BuildContext context) { 
    return LineChart( 
      LineChartData( 
        lineBarsData: widget.data, 
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
    ); 
  } 
} 
