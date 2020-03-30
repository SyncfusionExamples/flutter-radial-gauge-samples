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
      body: Center(
        child: SfRadialGauge(
            axes:<RadialAxis>[RadialAxis(
              startAngle: 180, endAngle: 0, canScaleToFit: true, showTicks: false,
                showLabels: false,
                pointers: <GaugePointer>[
                  MarkerPointer(value: 75, markerType: MarkerType.invertedTriangle,
                  markerHeight: 23, markerWidth: 23, color:Color(0xFFEE0979),
                  offsetUnit: GaugeSizeUnit.factor,
                  markerOffset: -0.17)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(angle: 173, positionFactor: 1,
                  widget: Text('Min', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEE0979)),)),
                  GaugeAnnotation(angle: 7, positionFactor: 1,
                      widget: Text('Max', style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEE0979)),)),
                  GaugeAnnotation(
                   angle: 90, verticalAlignment: GaugeAlignment.near,
                    widget: Text('75%', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEE0979)),)
                  )],
                axisLineStyle: AxisLineStyle( dashArray: <double>[50,3], thickness: 0.25,
                  thicknessUnit: GaugeSizeUnit.factor,
                  gradient: const SweepGradient(
                      colors: <Color>[Color(0xFFEE0979), Color(0xFFFF6A00)],
                      stops: <double>[0.25, 0.75]
                  ),)),
            ]
        ),
      ),
    );
  }
}
