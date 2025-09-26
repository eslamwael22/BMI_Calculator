import 'dart:ffi';

import 'package:bmi_broject/screens/home_page.dart';
import 'package:bmi_broject/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';

class ValuesPage extends StatefulWidget {
  final String gender;
  const ValuesPage({Key? key, required this.gender}) : super(key: key);
  @override
  State<ValuesPage> createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  int weight = 65;
  int age = 22;
  int height = 50;
  late String gender;
  @override
  void initState() {
    super.initState();
    gender = widget.gender;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Image.asset('assets/images/arrow_back_ios.png'),
                  ),
                ),
                SizedBox(width: 70),
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 35, color: Colors.orange),
                ),
                SizedBox(width: 4),
                Text(
                  'Calculator',
                  style: TextStyle(fontSize: 35, color: Colors.green),
                ),
              ],
            ),
          ),
          SizedBox(height: 1),
          Text(
            'Please modify the values',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  width: 170,
                  height: 184,
                  decoration: BoxDecoration(
                    color: Color(0XFFFBF6EE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        'Weight(Kg)',
                        style: TextStyle(
                          color: Color(0xffACACAC),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$weight',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffCE922A),
                          fontSize: 48,
                        ),
                      ),

                      Row(
                        children: [
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Image.asset('assets/images/Group 1.png'),
                          ),
                          SizedBox(width: 45),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Image.asset('assets/images/Group 2.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: 170,
                height: 184,
                decoration: BoxDecoration(
                  color: Color(0XFFFBF6EE),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Age',
                      style: TextStyle(color: Color(0xffACACAC), fontSize: 21),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$age',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffCE922A),
                        fontSize: 48,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              age--;
                            });
                          },
                          child: Image.asset('assets/images/Group 1.png'),
                        ),
                        SizedBox(width: 45),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Image.asset('assets/images/Group 2.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: 370,
            height: 235,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0XFFFBF6EE),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Height (cm)',
                  style: TextStyle(color: Color(0xffACACAC), fontSize: 21),
                ),
                SizedBox(height: 10),
                Text(
                  height != null ? '$height' : '$height',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffCE922A),
                    fontSize: 48,
                  ),
                ),

                Expanded(
                  child: SimpleRulerPicker(
                    minValue: 50,
                    maxValue: 200,
                    initialValue: 50,
                    onValueChanged: (value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },

                    scaleLabelSize: 10,
                    scaleBottomPadding: 20,
                    scaleItemWidth: 7,
                    longLineHeight: 35,
                    shortLineHeight: 30,
                    lineColor: Color(0xffACACAC),
                    selectedColor: Colors.orangeAccent,
                    labelColor: Colors.black,
                    lineStroke: 3,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              backgroundColor: Color(0xff65B741),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              double heightInMeter = height / 100;
              double bmi = weight / (heightInMeter * heightInMeter);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: bmi,
                    age: age,
                    weight: weight,
                    height: height,
                    gender: gender,
                  ),
                ),
              );
            },
            child: Text(
              'Calculate',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
