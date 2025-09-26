import 'package:flutter/material.dart';
import 'package:bmi_broject/screens/home_page.dart';

void main() {
  runApp(BMI_CALCULATOR());
}

class BMI_CALCULATOR extends StatelessWidget {
  const BMI_CALCULATOR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
