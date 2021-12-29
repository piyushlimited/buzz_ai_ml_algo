import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var interpreter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeInterpreter();
  }

  void makeInterpreter() async {
    interpreter = await tfl.Interpreter.fromAsset('model.tflite');
  }

  void runAi() {
    var input = [
      [1.23, 6.54, 7.81, 3.21, 2.22]
    ];

    // if output tensor shape [1,2] and type is float32
    var output = List.filled(1 * 2, 0).reshape([1, 2]);

    // inference
    interpreter.run(input, output);

    // print the output
    print(output);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
