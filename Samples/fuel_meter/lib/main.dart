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
           RadialAxis(startAngle: 180, endAngle: 0, showTicks: false,
               showAxisLine: false, showLabels: false, canScaleToFit: true,
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 10, startWidth: 10,
                    endWidth: 12.5, color: Colors.red),
                GaugeRange(startValue: 12, endValue: 20, startWidth: 12.5,
                    endWidth: 15, color: Colors.black ),
                GaugeRange(startValue: 22, endValue: 30, startWidth: 15,
                    endWidth: 17.5, color: Colors.black ),
                GaugeRange(startValue: 32, endValue: 40, startWidth: 17.5,
                    endWidth: 20, color: Colors.black ),
                GaugeRange(startValue: 42, endValue: 50, startWidth: 20,
                    endWidth: 22.5, color: Colors.black ),
                GaugeRange(startValue: 52, endValue: 60, startWidth: 22.5,
                    endWidth: 25, color: Colors.black ),
                GaugeRange(startValue: 62, endValue: 70, startWidth: 25,
                    endWidth: 27.5, color: Colors.black ),
                GaugeRange(startValue: 72, endValue: 80, startWidth: 27.5,
                    endWidth: 30, color: Colors.black ),
                GaugeRange(startValue: 82, endValue: 90, startWidth: 30,
                    endWidth: 32.5, color: Colors.black ),
                GaugeRange(startValue: 92, endValue: 100, startWidth: 32.5,
                    endWidth: 35, color: Colors.black )],
           pointers: <GaugePointer>[NeedlePointer(value: 5, needleEndWidth: 7,
               needleStartWidth: 1, needleColor: Colors.red, needleLength: 0.85,
               knobStyle: KnobStyle(color: Colors.black, knobRadius: 0.09))],
           annotations: <GaugeAnnotation>[
             GaugeAnnotation(widget:  Container(
           width: 30.00 ,
           height: 30.00 ,
           decoration: const BoxDecoration(
             image: DecorationImage(
               image:ExactAssetImage('images/fuel.jpg'),
               fit: BoxFit.fill,
             ),
           )), angle: 270, positionFactor: 0.35),
             GaugeAnnotation(widget: Text('E', style: TextStyle(fontSize: 16,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'Times'),), angle: 175, positionFactor: 1),
             GaugeAnnotation(widget: Text('F', style: TextStyle(fontSize: 16,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'Times'),), angle: 5, positionFactor: 0.95),
           ])
         ],
       ),
     ),
   );
  }
}
