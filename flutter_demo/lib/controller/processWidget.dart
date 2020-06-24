import 'package:flutter/material.dart';
import 'dart:math';

class processWidget extends StatefulWidget {

  double processPer;
  double lineWidth;
  Color backgroundColor;
  Color foregroundColor;
  Color widgetBgColor;
  double widgetSize;

  processWidget({
    this.processPer = 0.0,
    this.lineWidth = 5.0,
    this.backgroundColor = Colors.black12,
    this.foregroundColor = Colors.white,
    this.widgetBgColor,
    this.widgetSize = 70.0,
  });

  @override
  _processWidgetState createState() => _processWidgetState();
}

class _processWidgetState extends State<processWidget> {
  @override
  Widget build(BuildContext context) {
    widget.processPer = min(widget.processPer, 1);

    return Container(
      height: widget.widgetSize,
      width: widget.widgetSize,
      color: widget.widgetBgColor,
      child: CustomPaint(
        child: Center(
          child: Text(
            (widget.processPer == 1)
                ? "已完成"
                : ((widget.processPer * 100).toStringAsFixed(0) + "%"),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: widget.foregroundColor,
                decoration: TextDecoration.none),
          ),
        ),
        painter: _processDraw(
            processPer: widget.processPer,
            lineWidth: widget.lineWidth,
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor),
      ),
    );
  }
}

class _processDraw extends CustomPainter {
  double processPer;
  double lineWidth;
  Color backgroundColor;
  Color foregroundColor;

  _processDraw(
      {this.processPer,
        this.lineWidth,
        this.backgroundColor,
        this.foregroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    /*中心点*/
    Offset centerOffset = Offset(size.width / 2, size.width / 2);
    /*半径*/
    double radius = size.width / 2 - lineWidth / 2;

    /*画笔*/
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = this.backgroundColor;
    paint.strokeWidth = lineWidth;
    /*绘制*/
    canvas.drawCircle(centerOffset, radius, paint);

    paint.color = this.foregroundColor;
    paint.strokeWidth = this.lineWidth;
    paint.strokeCap = StrokeCap.round;

    Rect rect = Rect.fromCircle(center: centerOffset, radius: radius);
    /*绘制*/
    canvas.drawArc(rect, -pi / 180.0 * 90.0, pi / 180.0 * processPer * 360.0,
        false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
