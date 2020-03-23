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
            CustomAxis(
                labelOffset: 15,
                axisLineStyle: AxisLineStyle(
                    thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
                radiusFactor: 0.9,
                minimum: 0,
                showTicks: false,
                maximum: 150,
                axisLabelStyle: GaugeTextStyle(fontSize: 12),
                pointers: <GaugePointer>[
                  NeedlePointer(
                      gradient: LinearGradient(
                          colors: const <Color>[Color.fromRGBO(203,126,223,0.1),
                            Color(0xFFCB7EDF)],
                          stops: const <double>[0.25, 0.75],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      value: 60,
                      lengthUnit: GaugeSizeUnit.factor,
                      animationDuration: 1300,
                      needleStartWidth:  4,
                      needleEndWidth: 8,
                      needleLength: 0.8,
                      knobStyle: KnobStyle(
                        knobRadius: 0,
                      )),
                  RangePointer(
                      value: 60,
                      width: 0.15,
                      sizeUnit: GaugeSizeUnit.factor,
                      gradient: const SweepGradient(
                          colors: <Color>[Color(0xFF9E40DC), Color(0xFFE63B86)],
                          stops: <double>[0.25, 0.75]),)
                ])
          ],
        ),
      ),
    );
  }
}

class CustomAxis extends RadialAxis {
  CustomAxis({
    double radiusFactor = 1,
    List<GaugePointer> pointers,
    GaugeTextStyle axisLabelStyle,
    AxisLineStyle axisLineStyle,
    double minimum,
    double maximum,
    bool showTicks,
    double labelOffset,
  }) : super(
    pointers: pointers ?? <GaugePointer>[],
    minimum: minimum,
    maximum: maximum,
    showTicks: showTicks ?? true,
    labelOffset: labelOffset ?? 20,
    axisLabelStyle: axisLabelStyle ??
        GaugeTextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontFamily: 'Segoe UI',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
    axisLineStyle: axisLineStyle ??
        AxisLineStyle(
          color: Colors.grey,
          thickness: 10,
        ),
    radiusFactor: radiusFactor,
  );

  @override
  List<CircularAxisLabel> generateVisibleLabels() {
    final List<CircularAxisLabel> _visibleLabels = <CircularAxisLabel>[];
    for (num i = 0; i < 9; i++) {
      final double _value = _calculateLabelValue(i);
      final CircularAxisLabel label = CircularAxisLabel(
          axisLabelStyle, _value.toInt().toString(), i, false);
      label.value = _value;
      _visibleLabels.add(label);
    }

    return _visibleLabels;
  }

  @override
  double valueToFactor(double value) {
    if (value >= 0 && value <= 2) {
      return (value * 0.125) / 2;
    } else if (value > 2 && value <= 5) {
      return (((value - 2) * 0.125) / (5 - 2)) + (1 * 0.125);
    } else if (value > 5 && value <= 10) {
      return (((value - 5) * 0.125) / (10 - 5)) + (2 * 0.125);
    } else if (value > 10 && value <= 20) {
      return (((value - 10) * 0.125) / (20 - 10)) + (3 * 0.125);
    } else if (value > 20 && value <= 30) {
      return (((value - 20) * 0.125) / (30 - 20)) + (4 * 0.125);
    } else if (value > 30 && value <= 50) {
      return (((value - 30) * 0.125) / (50 - 30)) + (5 * 0.125);
    } else if (value > 50 && value <= 100) {
      return (((value - 50) * 0.125) / (100 - 50)) + (6 * 0.125);
    } else if (value > 100 && value <= 150) {
      return (((value - 100) * 0.125) / (150 - 100)) + (7 * 0.125);
    } else {
      return 1;
    }
  }

  /// To return the label value based on interval
  double _calculateLabelValue(num value) {
    if (value == 0) {
      return 0;
    } else if (value == 1) {
      return 2;
    } else if (value == 2) {
      return 5;
    } else if (value == 3) {
      return 10;
    } else if (value == 4) {
      return 20;
    } else if (value == 5) {
      return 30;
    } else if (value == 6) {
      return 50;
    } else if (value == 7) {
      return 100;
    } else {
      return 150;
    }
  }
}
