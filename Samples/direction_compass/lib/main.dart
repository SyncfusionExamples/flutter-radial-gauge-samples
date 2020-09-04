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
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.9,
            minimum: 0,
            maximum: 80,
            axisLineStyle: AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor, thickness: 0.1),
            interval: 10,
            canRotateLabels: true,
            axisLabelStyle: GaugeTextStyle(fontSize: 12),
            minorTicksPerInterval: 0,
            majorTickStyle: MajorTickStyle(
                thickness: 1.5, lengthUnit: GaugeSizeUnit.factor, length: 0.07),
            showLabels: true,
            onLabelCreated: labelCreated,
            pointers: <GaugePointer>[
              NeedlePointer(
                  value: 70,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleLength: 0.55,
                  needleEndWidth: 18,
                  gradient: const LinearGradient(colors: <Color>[
                    Color(0xFFFF6B78),
                    Color(0xFFFF6B78),
                    Color(0xFFE20A22),
                    Color(0xFFE20A22)
                  ], stops: <double>[
                    0,
                    0.5,
                    0.5,
                    1
                  ]),
                  needleColor: const Color(0xFFF67280),
                  knobStyle: KnobStyle(
                      knobRadius: 0.1,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.white)),
              NeedlePointer(
                  gradient: const LinearGradient(colors: <Color>[
                    Color(0xFFE3DFDF),
                    Color(0xFFE3DFDF),
                    Color(0xFF7A7A7A),
                    Color(0xFF7A7A7A)
                  ], stops: <double>[
                    0,
                    0.5,
                    0.5,
                    1
                  ]),
                  value: 30,
                  needleLength: 0.55,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleColor: const Color(0xFFFCACACA),
                  needleEndWidth: 18,
                  knobStyle: KnobStyle(
                      knobRadius: 0.1,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.white))
            ],
          )
        ],
      )),
    );
  }

  void labelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '80' || args.text == '0') {
      args.text = 'N';
    } else if (args.text == '10') {
      args.text = 'NE';
    } else if (args.text == '20') {
      args.text = 'E';
    } else if (args.text == '30') {
      args.text = 'SE';
    } else if (args.text == '40') {
      args.text = 'S';
    } else if (args.text == '50') {
      args.text = 'SW';
    } else if (args.text == '60') {
      args.text = 'W';
    } else if (args.text == '70') {
      args.text = 'NW';
    }
  }
}
