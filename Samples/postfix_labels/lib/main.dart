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
        child:  SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
                startAngle: 180,
                endAngle: 360,
                interval: 10, canScaleToFit: true,
                labelFormat: '{value}%',
                labelsPosition: ElementsPosition.outside,
                ticksPosition: ElementsPosition.inside,
                labelOffset: 15,
                minorTickStyle: MinorTickStyle(
                    length: 0.05, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
                majorTickStyle: MajorTickStyle(
                    length: 0.1, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
                minorTicksPerInterval: 5,
                pointers: <GaugePointer>[
                  NeedlePointer(
                      value: 70,
                      needleStartWidth: 1,
                      needleEndWidth: 3,
                      needleLength: 0.8,
                      lengthUnit: GaugeSizeUnit.factor,
                      knobStyle: KnobStyle(
                        knobRadius: 8,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                      ),
                      tailStyle: TailStyle(
                          width: 3,
                          lengthUnit: GaugeSizeUnit.logicalPixel,
                          length: 20))
                ],
                axisLabelStyle:
                GaugeTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                axisLineStyle:
                AxisLineStyle(thickness: 3, color: const Color(0xFF00A8B5))),
          ],
        )
      ),

    );
  }
}
