import 'dart:async';
import 'dart:math';
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
  Timer _timer;
  Random _random;
  String _annotationValue = '50 %';
  double _pointerValue = 50;

  @override
  void initState() {
    _random = Random();
    _timer = Timer.periodic(const Duration(milliseconds: 1200), (_timer) {
      setState(() {
        int _value = _random.nextInt(100);
        if (_value > 4 && _value < 100) {
          _pointerValue = _value.toDouble();
          _annotationValue = _value.toString() + ' %';
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                minimum: 0,
                maximum: 100,
                radiusFactor: 0.85,
                axisLineStyle: AxisLineStyle(
                    color: Color.fromRGBO(106, 110, 246, 0.2),
                    thicknessUnit: GaugeSizeUnit.factor,
                    thickness: 0.1),
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      angle: 0,
                      positionFactor: 0.25,
                      widget: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: Text(
                              _annotationValue,
                              style: TextStyle(
                                  fontFamily: 'Times',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      )),
                ],
                pointers: <GaugePointer>[
                  RangePointer(
                      value: _pointerValue,
                      cornerStyle: CornerStyle.bothCurve,
                      enableAnimation: true,
                      animationDuration: 1200,
                      animationType: AnimationType.ease,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: const Color(0xFF6A6EF6),
                      width: 0.1),
                ]),
          ],
        )));
  }
}
