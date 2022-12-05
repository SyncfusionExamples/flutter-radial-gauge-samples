import 'dart:math' as math;
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
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(pointers: <GaugePointer>[
                CustomNeedlePointer(
                    value: 70,
                    needleStartWidth: 1,
                    needleEndWidth: 5,
                    needleLength: 0.7,
                    knobStyle: KnobStyle(),
                    lengthUnit: GaugeSizeUnit.factor)
              ])
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomNeedlePointer extends NeedlePointer {
  CustomNeedlePointer(
      {required double value,
      required double needleStartWidth,
      required double needleEndWidth,
      required double needleLength,
      required GaugeSizeUnit lengthUnit,
      required KnobStyle knobStyle})
      : super(
            value: value,
            needleEndWidth: needleEndWidth,
            needleStartWidth: needleStartWidth,
            needleLength: needleLength,
            lengthUnit: lengthUnit,
            knobStyle: knobStyle);

  late double _radius;
  late Offset _centerPoint;
  late double _needleRadian;
  late double _startLeftX, _startLeftY, _startRightX, _startRightY;
  late double _midLeftX, _midLeftY, _midRightX, _midRightY;
  late double _stopLeftX, _stopLeftY, _stopRightX, _stopRightY;

  void drawPointer(Canvas canvas, double animationValue, Offset startPosition,
      Offset endPosition, double pointerAngle) {
    _needleRadian = _degreeToRadian(pointerAngle);

    _radius = 150; // Since 300x300 is set a widget size
    _centerPoint = Offset(_radius, _radius);
    _calculatesNeedleOffsets(startPosition, endPosition);
    _renderNeedle(canvas);
    _renderKnob(canvas);
  }

  void _renderNeedle(Canvas canvas) {
    final Paint paint = _getPaint();
    final Path path = Path();
    final Path path1 = Path();
    // Path to draw the tip at the end of needle
    path.moveTo(_stopLeftX, _stopLeftY);
    path.lineTo(_midLeftX, _midLeftY);
    path.lineTo(_midRightX, _midRightY);
    path.lineTo(_stopRightX, _stopRightY);
    path.close();

    // Path to draw the needle from start to mid position except tip of needle
    path1.moveTo(_startLeftX, _startLeftY);
    path1.lineTo(_midLeftX, _midLeftY);
    path1.lineTo(_midRightX, _midRightY);
    path1.lineTo(_startRightX, _startRightY);

    canvas.save();
    canvas.translate(_centerPoint.dx, _centerPoint.dy);
    canvas.rotate(_needleRadian);
    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
    canvas.restore();
  }

  Paint _getPaint() {
    return Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
  }

  void _calculatesNeedleOffsets(
    Offset startPosition,
    Offset endPosition,
  ) {
    final double _tipLength =
        0.6 * _radius; // Calculated the length based on actual needle length
    // to get the sharp tip at end
    final double _radian = _degreeToRadian(-90);

    // Calculates the points to get the start position
    _startLeftX = startPosition.dx - needleEndWidth * math.cos(_radian - 90);
    _startLeftY = startPosition.dy - needleEndWidth * math.sin(_radian - 90);
    _startRightX = startPosition.dx - needleEndWidth * math.cos(_radian + 90);
    _startRightY = startPosition.dy - needleEndWidth * math.sin(_radian + 90);

    // Calculates the points to get the end position
    _stopLeftX = endPosition.dx - needleStartWidth * math.cos(_radian - 90);
    _stopLeftY = endPosition.dy - needleStartWidth * math.sin(_radian - 90);
    _stopRightX = endPosition.dx - needleStartWidth * math.cos(_radian + 90);
    _stopRightY = endPosition.dy - needleStartWidth * math.sin(_radian + 90);

    // Calculates the point based on tip length

    double _stopX = _tipLength * math.cos(_radian);
    double _stopY = _tipLength * math.sin(_radian);

    // Calculates the points to get the mid position
    _midLeftX = _stopX - needleEndWidth * math.cos(_radian - 90);
    _midLeftY = _stopY - needleEndWidth * math.sin(_radian - 90);
    _midRightX = _stopX - needleEndWidth * math.cos(_radian + 90);
    _midRightY = _stopY - needleEndWidth * math.sin(_radian + 90);
  }

  void _renderKnob(Canvas canvas) {
    // Calculates the knob radius
    double _actualCapRadius = knobStyle.sizeUnit == GaugeSizeUnit.factor
        ? knobStyle.knobRadius * _radius
        : knobStyle.knobRadius;
    if (_actualCapRadius > 0) {
      final Paint knobPaint = Paint()..color = knobStyle.color ?? Colors.black;
      canvas.drawCircle(_centerPoint, _actualCapRadius, knobPaint);

      if (knobStyle.borderWidth > 0) {
        final double _actualBorderWidth =
            knobStyle.sizeUnit == GaugeSizeUnit.factor
                ? knobStyle.borderWidth * _radius
                : knobStyle.borderWidth;
        final Paint _strokePaint = Paint()
          ..color = knobStyle.borderColor ?? Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = _actualBorderWidth;
        canvas.drawCircle(_centerPoint, _actualCapRadius, _strokePaint);
      }
    }
  }

  // Converts the degree to radians
  double _degreeToRadian(double degree) {
    return degree * (math.pi / 180);
  }
}
