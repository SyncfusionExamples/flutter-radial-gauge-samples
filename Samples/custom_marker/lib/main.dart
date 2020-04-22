import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(interval: 10, pointers: <GaugePointer>[
            CustomMarkerPointer(
                value: 30, markerWidth: 25, markerHeight: 25, borderWidth: 3)
          ])
        ],
      ),
    );
  }
}

class CustomMarkerPointer extends MarkerPointer {
  CustomMarkerPointer(
      {double value,
      double markerWidth,
      double markerHeight,
      Color borderColor,
      double borderWidth})
      : super(
            value: value,
            markerWidth: markerWidth,
            markerHeight: markerHeight,
            borderWidth: borderWidth ?? 2);

  @override
  void drawPointer(Canvas canvas, double animationValue, Offset startPosition,
      Offset endPosition, double pointerAngle) {
    final Paint paint = Paint()
      ..color = borderColor ?? Colors.black
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    canvas.save();
    List<Offset> _offsets = _drawStar(startPosition, endPosition);
    canvas.drawPoints(PointMode.polygon, _offsets, paint);
    canvas.restore();
  }

  List<Offset> _drawStar(
    Offset startPosition,
    Offset endPosition,
  ) {
    List<Offset> _offsets = List<Offset>(6);

    double _x1 = markerWidth / 2;
    double _y1 = markerHeight / 2;
    double _x2 = startPosition.dx;
    double _y2 = startPosition.dy;

    double _angle1 = -math.pi / 2;
    double _angle2 = 4 * math.pi / 5;
    for (int i = 0; i < 6; i++) {
      _offsets[i] =
          Offset(_x2 + _x1 * math.cos(_angle1), _y2 + _y1 * math.sin(_angle1));

      _angle1 += _angle2;
    }

    return _offsets;
  }
}
