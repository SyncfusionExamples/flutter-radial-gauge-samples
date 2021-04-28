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
          child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
              interval: 10,
              radiusFactor: 0.9,
              startAngle: 0,
              endAngle: 360,
              showTicks: false,
              showLabels: false,
              axisLineStyle: AxisLineStyle(thickness: 20),
              pointers: <GaugePointer>[
                RangePointer(
                    value: 73,
                    width: 20,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFFFCE38A), Color(0xFFF38181)],
                        stops: <double>[0.25, 0.75]),
                    cornerStyle: CornerStyle.bothCurve)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Column(
                      children: <Widget>[
                        Container(
                            width: 50.00,
                            height: 50.00,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage('images/sun.png'),
                                fit: BoxFit.fill,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Container(
                            child: Text('73°F',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          ),
                        )
                      ],
                    ),
                    angle: 270,
                    positionFactor: 0.1)
              ])
        ],
      )),
    );
  }
}
