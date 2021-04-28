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
        child: Column(
          children: <Widget>[
            Expanded(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      interval: 10,
                      axisLineStyle: AxisLineStyle(
                          gradient: SweepGradient(colors: <Color>[
                        Color(0xFFE7627D),
                        Color(0xFF231557),
                        Color(0xFF44107A),
                        Color(0xFFFF1361),
                        Color(0xFFFFF800),
                      ], stops: <double>[
                        0,
                        0.25,
                        0.5,
                        0.75,
                        1
                      ])))
                ],
              ),
            ),
            Expanded(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      interval: 10,
                      axisLineStyle: AxisLineStyle(thickness: 15),
                      minorTicksPerInterval: 0,
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: 65,
                            gradient: SweepGradient(colors: <Color>[
                              Color(0xFFFF8177),
                              Color(0xFFFF867A),
                              Color(0xFFFF8C7F),
                              Color(0xFFCF556C),
                              Color(0xFFB12A5B),
                            ], stops: <double>[
                              0,
                              0.25,
                              0.5,
                              0.75,
                              1
                            ]),
                            width: 15,
                            cornerStyle: CornerStyle.bothCurve),
                        NeedlePointer(
                          value: 65,
                          knobStyle: KnobStyle(knobRadius: 0),
                          needleStartWidth: 5,
                          needleEndWidth: 7,
                          lengthUnit: GaugeSizeUnit.factor,
                          needleLength: 0.8,
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFFF8177),
                                Color(0xFFFF867A),
                                Color(0xFFFF8C7F),
                                Color(0xFFCF556C),
                                Color(0xFFB12A5B),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: <double>[0, 0.25, 0.5, 0.75, 1]),
                        )
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
