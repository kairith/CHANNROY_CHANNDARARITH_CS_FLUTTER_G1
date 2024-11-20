import 'package:flutter/material.dart';
import 'package:pic/W5-S2/EXERCISE-3/screen/welcome.dart';
import 'package:pic/W5-S2/EXERCISE-3/screen/temperature.dart';
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _isTemp = false;
  void _toggleTemp() {
    setState(() {
      _isTemp =!_isTemp;
    });
  }

  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _isTemp ? Temperature() : Welcome ( called: _toggleTemp, ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
