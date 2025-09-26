import 'package:bmi_broject/screens/values_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_broject/screens/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String gender = 'female';
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 60),
            child: Row(
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                ),
                SizedBox(width: 4),
                Text(
                  'Calculator',
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
              ],
            ),
          ),
          SizedBox(height: 1),
          Text(
            'Please choose your gender',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                gender = 'male';
                selectedIndex = 0;
              });
            },
            child: Container(
              color: selectedIndex == 0
                  ? Colors.greenAccent.shade100
                  : Colors.transparent,
              child: Image.asset('assets/images/Frame 1 (1).png'),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              setState(() {
                gender = 'female';
                selectedIndex = 1;
              });
            },
            child: Container(
              color: selectedIndex == 1
                  ? Colors.orangeAccent.shade100
                  : Colors.transparent,
              child: Image.asset('assets/images/Frame 2 (1).png'),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              backgroundColor: Color(0xff65B741),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ValuesPage(gender: gender),
                ),
              );
            },
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
