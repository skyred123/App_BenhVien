import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  const Line({super.key,this.dashWidth =5, this.dashSpace =3,this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashLinePainter(dashWidth: dashWidth, dashSpace :dashSpace, color: color),
      child: Container(
        height: 1,
      ),
    );
  }
}

class DashLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  DashLinePainter( {super.repaint, required this.dashWidth, required this.dashSpace, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;

    if(dashSpace ==0){
      canvas.drawLine(Offset.zero, Offset(size.width, 0), Paint()..color = color);
    }
    else{
      while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0),
          Paint()..color = color);

      startX += dashWidth + dashSpace;
    }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
