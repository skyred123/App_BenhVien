import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ui_appbenhvien/core/app_export.dart';

class BieuDo extends StatelessWidget{
  int type;
  BieuDo({super.key, required this.type}); 
    @override
    Widget build(BuildContext context){
      LineChartData selectedData = ngayData;
       if (type == 1) {
        selectedData = ngayData;
      } else if (type == 2) {
        selectedData = thangData;
      } else if (type == 3) {
        selectedData = namData;
      }
      return LineChart(
        duration: const Duration(microseconds: 250),
        selectedData
      );
    }
}

LineChartData get ngayData => LineChartData(
  gridData: gridData,
  titlesData: titlesData,
  borderData: borderData,
  lineBarsData: lineBarsData,
  minX: 0,
  maxX: 140,
  minY: 0,
  maxY: 140,
);

LineChartData get thangData => LineChartData(
  gridData: gridData,
  titlesData: titlesData2,
  borderData: borderData,
  lineBarsData: lineBarsData2,
  minX: 0,
  maxX: 14,
  minY: 0,
  maxY: 14,
);

LineChartData get namData => LineChartData(
  gridData: gridData,
  titlesData: titlesData3,
  borderData: borderData,
  lineBarsData: lineBarsData3,
  minX: 0,
  maxX: 14,
  minY: 0,
  maxY: 14,
);

List<LineChartBarData> get lineBarsData =>[
  lineChartBarData1
];

List<LineChartBarData> get lineBarsData2 =>[
  lineChartBarData1
];

List<LineChartBarData> get lineBarsData3 =>[
  lineChartBarData1
];

FlTitlesData get titlesData => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles(), 
  ),

  rightTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false), 
  ),

  topTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false), 
  ),

  leftTitles: AxisTitles(
    sideTitles: leftTitles(), 
  ),
  
);

FlTitlesData get titlesData2 => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles2(), 
  ),

  rightTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false), 
  ),

  topTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false), 
  ),

  leftTitles: AxisTitles(
    sideTitles: leftTitles(), 
  ),
  
);

FlTitlesData get titlesData3 => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles3(), 
  ),

  rightTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false), 
  ),

  topTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false), 
  ),

  leftTitles: AxisTitles(
    sideTitles: leftTitles(), 
  ),
  
);

Widget leftTitlesWidget(double value, TitleMeta meta){
  const style = TextStyle(
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: AppColors.grey,
  );
  String text;
  switch(value.toInt()){
    case 2:
      text = "40";
      break;
    case 4:
      text = "50";
      break;
    case 6:
      text = "60";
      break;
    case 8:
      text = "70";
      break;
    case 10:
      text = "80";
      break;
    case 12:
      text = "90";
      break;
    case 14:
      text = "100";
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.center,);
}

SideTitles leftTitles() => const SideTitles(
  getTitlesWidget: leftTitlesWidget,
  showTitles: true, 
  interval: 1,
  reservedSize: 40,
);

Widget bottomTitlesWidget(double value, TitleMeta meta){
  const style = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 15,
    color: AppColors.grey,
    fontWeight: FontWeight.bold
  );
  Widget text;
  switch(value.toInt()){
    case 2:
      text = const Text("5 PM", style: style,);
      break;
    case 4:
      text = const Text("6 PM" , style: style,);
      break;
    case 6:
      text = const Text("7 PM", style: style,);
      break;
    case 8:
      text = const Text("8 PM", style: style,);
      break;
    case 10:
      text = const Text("9 PM", style: style,);
      break;
    case 12:
      text = const Text("10 PM", style: style,);
      break;
    default:
      return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,);
}

SideTitles bottomTitles() => const SideTitles(
  getTitlesWidget: bottomTitlesWidget,
  showTitles: true, 
  interval: 1,
  reservedSize: 32,
);

Widget bottomTitlesWidget2(double value, TitleMeta meta){
  const style = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 15,
    color: AppColors.grey,
    fontWeight: FontWeight.bold
  );
  Widget text;
  switch(value.toInt()){
    case 2:
      text = const Text("1/12", style: style,);
      break;
    case 4:
      text = const Text("2" , style: style,);
      break;
    case 6:
      text = const Text("3", style: style,);
      break;
    case 8:
      text = const Text("4", style: style,);
      break;
    case 10:
      text = const Text("5", style: style,);
      break;
    case 12:
      text = const Text("6", style: style,);
      break;
    default:
      return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,);
}

SideTitles bottomTitles2() => const SideTitles(
  getTitlesWidget: bottomTitlesWidget2,
  showTitles: true, 
  interval: 1,
  reservedSize: 32,
);

Widget bottomTitlesWidget3(double value, TitleMeta meta){
  const style = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 15,
    color: AppColors.grey,
    fontWeight: FontWeight.bold
  );
  Widget text;
  switch(value.toInt()){
    case 2:
      text = const Text("1/12", style: style,);
      break;
    case 4:
      text = const Text("2" , style: style,);
      break;
    case 6:
      text = const Text("3", style: style,);
      break;
    case 8:
      text = const Text("4", style: style,);
      break;
    case 10:
      text = const Text("5", style: style,);
      break;
    case 12:
      text = const Text("6", style: style,);
      break;
    default:
      return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,);
}

SideTitles bottomTitles3() => const SideTitles(
  getTitlesWidget: bottomTitlesWidget3,
  showTitles: true, 
  interval: 1,
  reservedSize: 32,
);

FlGridData get gridData => const FlGridData(show: true);

FlBorderData get borderData => FlBorderData(
  show: true,
  border: const Border(
    bottom: BorderSide(color: AppColors.grey, width: 4),
    left: BorderSide(color: AppColors.grey))
);

LineChartBarData get lineChartBarData1 => LineChartBarData(
  isCurved: true,
  color: AppColors.mediumDarkBlue,
  barWidth: 6,
  isStrokeCapRound: true,
  dotData: const FlDotData(show: true),
  belowBarData: BarAreaData(show: false),
  spots: const [
    FlSpot(1, 103.1),
    FlSpot(3, 3.0),
    FlSpot(5, 3.2),
    FlSpot(7, 3.0),
    FlSpot(9, 3.2),
  ]
);

