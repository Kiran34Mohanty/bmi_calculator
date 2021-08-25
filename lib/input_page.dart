import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculate.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

String str = "";
int age = 20;
int weight = 84;
double currentSliderValue = 164;

class _InputPageState extends State<InputPage> {
  Gender? selectGender;

  void check() {
    var val = weight / 100;
    double result = age / (val * val);

    if (result < 18.5) {
      str = 'You are underweight, eat some more';
    } else if (result >= 18.6 || result <= 24.9) {
      str = 'You are perfect';
    } else if (result >= 24.9 || result <= 29.9) {
      str = 'You are overweight, eat less work more';
    } else if (result >= 30) {
      str = 'You are obese, go on a diet plan, consult a physical trainer';
    }

  }

  Container reusable_card({Widget? child, Color? color}) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 200,
      width: 170,
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }

  var cl1 = 0xFF1D1E33;
  var cl2 = 0xFF1D1E33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: reusable_card(
                    child: ElevatedButton(
                      child: Icon(
                        IconData(
                          0xe3c5,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: 100.0,
                      ),
                      onPressed: () {
                        setState(() {
                          selectGender = Gender.Male;
                          cl1 = selectGender == Gender.Male? 0xFF1D1E33:0xFF11132B;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(
                            cl1,
                          ),
                        ),
                      ),
                    ),

                  ),
                ),
                Expanded(
                  child: reusable_card(
                    child: ElevatedButton(
                      child: Icon(
                        IconData(
                          0xe261,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: 100.0,
                      ),
                      onPressed: () {
                        setState(() {
                          selectGender = Gender.Female;
                          cl2 = selectGender == Gender.Female? 0xFF1D1E33:0xFF11132B;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(
                            cl2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: reusable_card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '${currentSliderValue.toInt()}',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Slider(
                    value: currentSliderValue,
                    min: 0,
                    max: 400,
                    divisions: 100,
                    label: currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(
                        () {
                          currentSliderValue = value;
                        },
                      );
                    },
                    activeColor: Colors.pink,
                    inactiveColor: Colors.pink,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: reusable_card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              child: Icon(
                                Icons.add,
                              ),
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                            FloatingActionButton(
                              child: Icon(
                                Icons.remove,
                              ),
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusable_card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              child: Icon(
                                Icons.add,
                              ),
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            ),
                            FloatingActionButton(
                              child: Icon(
                                Icons.remove,
                              ),
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  age = age - 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              child: Container(
                color: Colors.pink,
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                check();
                //print(result);
                Navigator.pushNamed(context, '/calculate');
              },
            ),
          ),
        ],
      ),
    );
  }
}
