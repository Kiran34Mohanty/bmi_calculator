import 'package:bmi_calculator/calculate.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes:  {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/':(context) => InputPage(),
        '/calculate': (context) => Calculate_Page(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
