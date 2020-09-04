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
  Widget build(BuildContextcontext) {
    return Scaffold(
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: const <Color>[
                Color(0xFF484848),
                Color(0xFF030303)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      showAxisLine: false,
                      radiusFactor: 1,
                      showLastLabel: false,
                      canRotateLabels: true,
                      tickOffset: 0.32,
                      offsetUnit: GaugeSizeUnit.factor,
                      onLabelCreated: axisLabelCreated,
                      startAngle: 270,
                      endAngle: 270,
                      labelOffset: 0.05,
                      maximum: 360,
                      minimum: 0,
                      interval: 30,
                      minorTicksPerInterval: 4,
                      axisLabelStyle: GaugeTextStyle(
                          color: const Color(0xFF949494), fontSize: 10),
                      minorTickStyle: MinorTickStyle(
                          color: const Color(0xFF616161),
                          thickness: 1.6,
                          length: 0.058,
                          lengthUnit: GaugeSizeUnit.factor),
                      majorTickStyle: MajorTickStyle(
                          color: const Color(0xFF949494),
                          thickness: 2.3,
                          length: 0.087,
                          lengthUnit: GaugeSizeUnit.factor),
                      backgroundImage:
                          const AssetImage('images/dark_theme_gauge.png'),
                      pointers: <GaugePointer>[
                        MarkerPointer(
                            value: 90,
                            color: const Color(0xFFDF5F2D),
                            enableAnimation: true,
                            animationDuration: 1200,
                            markerOffset: 0.71,
                            offsetUnit: GaugeSizeUnit.factor,
                            markerType: MarkerType.triangle,
                            markerHeight: 10,
                            markerWidth: 15)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 270,
                            positionFactor: 0.025,
                            widget: Text(
                              '90',
                              style: TextStyle(
                                  color: const Color(0xFFDF5F2D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ))
                      ])
                ],
              ))),
    );
  }

  void axisLabelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '90') {
      args.text = 'E';
      args.labelStyle =
          GaugeTextStyle(color: const Color(0xFFDF5F2D), fontSize: 10);
    } else {
      if (args.text == '0') {
        args.text = 'N';
      } else if (args.text == '180') {
        args.text = 'S';
      } else if (args.text == '270') {
        args.text = 'W';
      }

      args.labelStyle =
          GaugeTextStyle(color: const Color(0xFFFFFFFF), fontSize: 10);
    }
  }
}
