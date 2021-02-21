import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}

//druhá varianta jak to zapsat, můžu použít už nějaký theme a upravit jen co chci to je ta varianta na hoře
//theme: ThemeData(
//primaryColor: Color(0xFF0A0E21),
//scaffoldBackgroundColor: Color(0xFF0A0E21),
//textTheme: TextTheme(
//bodyText2: TextStyle(color: Colors.white),
//),
