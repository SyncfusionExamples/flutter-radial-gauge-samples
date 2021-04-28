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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      startAngle: 270,
                      canScaleToFit: true,
                      endAngle: 90,
                      interval: 10)
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Divider(
                    height: 20.0,
                    indent: 5.0,
                    color: Colors.grey,
                  )),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      startAngle: 90,
                      canScaleToFit: true,
                      endAngle: 270,
                      isInversed: true,
                      interval: 10)
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Divider(
                    height: 20.0,
                    indent: 5.0,
                    color: Colors.grey,
                  )),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      startAngle: 180,
                      canScaleToFit: true,
                      endAngle: 0,
                      interval: 10)
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Divider(
                    height: 20.0,
                    indent: 5.0,
                    color: Colors.grey,
                  )),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      startAngle: 0,
                      canScaleToFit: true,
                      isInversed: true,
                      endAngle: 180,
                      interval: 10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
