import 'package:bmi_broject/screens/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final int age;
  final int weight;
  final int height;
  final String gender;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
  });

  Map<String, double> HealtyWeightRange(double hight) {
    double minWeight = 18.5 * hight * hight;
    double maxWeight = 24.9 * hight * hight;
    return {'min': minWeight, 'max': maxWeight};
  }

  @override
  Widget build(BuildContext context) {
    var range = HealtyWeightRange(height / 100);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/Group 6.png', fit: BoxFit.cover),
          Positioned(
            top: 120,
            left: 13,
            right: 11,
            child: Container(
              height: 460,
              width: 300,
              decoration: BoxDecoration(
                color: Color(0XFFF0F8EC),
                borderRadius: BorderRadius.circular(30),
              ),

              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Your BMI Result :',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$bmi',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF519234),
                    ),
                  ),
                  SizedBox(height: 5),
                  Image.asset('assets/images/bmi bar.png'),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0XFF519234),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'kg',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF519234),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            '$height',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0XFF519234),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF519234),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0XFF519234),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            '$gender',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0XFF519234),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'weight',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(width: 5),

                          SizedBox(width: 40),
                          Text(
                            'height',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(width: 5),

                          SizedBox(width: 40),
                          Text(
                            'age',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            'gender',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Healthy weight for the height :',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${range['min']!.toStringAsFixed(0)} Kg -${range['max']!.toStringAsFixed(0)} Kg',
                        style: TextStyle(fontSize: 30, color: Colors.black45),
                      ),
                      SizedBox(height: 2),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 10,
                          ),
                          backgroundColor: Color(0xff65B741),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
