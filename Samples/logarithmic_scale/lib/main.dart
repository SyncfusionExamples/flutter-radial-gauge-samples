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
                minimum: 1,
                maximum: 10000,
                onCreateAxisRenderer: () {
                  final _CustomAxisRenderer renderer = _CustomAxisRenderer();
                  return renderer;
                },
                radiusFactor: 0.9,
                labelOffset: 0.125,
                offsetUnit: GaugeSizeUnit.factor,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                    color: Color(0xFFD3D3D3),
                    thickness: 0.125,
                    thicknessUnit: GaugeSizeUnit.factor),
                pointers: <GaugePointer>[NeedlePointer(value: 1000)])
          ],
        ),
      ),
    );
  }
}

class _CustomAxisRenderer extends RadialAxisRenderer {
  _CustomAxisRenderer() : super();

  int _labelsCount;

  @override
  List<CircularAxisLabel> generateVisibleLabels() {
    final List<CircularAxisLabel> _visibleLabels = <CircularAxisLabel>[];
    num _minimum = _logBase(this.axis.minimum, 10);
    num _maximum = _logBase(this.axis.maximum, 10);
    for (num i = _minimum; i <= _maximum; i++) {
      final int _value = math.pow(10, i).floor(); // logBase  value is 10
      final CircularAxisLabel label = CircularAxisLabel(
          this.axis.axisLabelStyle, _value.toInt().toString(), i, false);
      label.value = _value;
      _visibleLabels.add(label);
    }

    _labelsCount = _visibleLabels.length;
    return _visibleLabels;
  }

  @override
  double valueToFactor(double value) {
    double _number = _logBase(value, 10) / (_labelsCount - 1);
    return _number;
  }

  // To convert the log value into linear value
  num _logBase(num value, num base) => math.log(value) / math.log(base);
}
