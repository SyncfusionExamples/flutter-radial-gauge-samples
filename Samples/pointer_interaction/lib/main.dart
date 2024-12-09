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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
        child: SfRadialGauge(axes: [
          RadialAxis(
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            showTicks: false,
            showLabels: true,
            pointers: [
              RangePointer(
                value: _pointerValue,
                onValueChanged: onPointerValueChanged,
                enableDragging: true,
                width: 0.2,
                sizeUnit: GaugeSizeUnit.factor,
              ),
            ],
            annotations: [
              GaugeAnnotation(
                widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${_pointerValue.toInt()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00A8B5),
                      ),
                    ),
                    Text(
                      ' %',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00A8B5),
                      ),
                    ),
                  ],
                ),
                positionFactor: 0,
                angle: 0,
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void onPointerValueChanged(double value) {
    setState(() {
      _pointerValue = value;
    });
  }

  double _pointerValue = 60.0;
}
