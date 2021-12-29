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
      -1.82313293,
      1.38265717,
      -4.77082405,
      2.56861916,
      2.11227188,
      2.15514374,
      2.49683642,
      1.80431137,
      -1.14440718,
      1.61954746,
      2.83308411,
      1.60585175,
      -1.42026205,
      1.26343222,
      5.66473305,
      -2.95916677,
      -5.26943840,
      1.46824141,
      5.01206589,
      1.31672490,
      -5.25899696,
      2.26965380,
      2.02486858,
      7.88749838,
      -2.70444465,
      -1.77783465,
      -5.90589285,
      1.15026522,
      -1.21936393,
      -9.79906559,
    ];

    // if output tensor shape [1,2] and type is float32
    var output = List.filled(1 * 9, 0).reshape([1, 9]);

    // inference
    interpreter.run(input, output);

    // print the output
    print(output);
  }

  @override
  Widget build(BuildContext context) {
    runAi();
    return MaterialApp(
      home: Scaffold(
        body: Text("Done"),
      ),
    );
  }
}
