import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'input_page.dart';

class Calculate_Page extends StatefulWidget {
  const Calculate_Page({Key? key}) : super(key: key);

  @override
  _Calculate_PageState createState() => _Calculate_PageState();
}

class _Calculate_PageState extends State<Calculate_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text(
                str,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300,80),
            primary: Colors.deepOrange
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 80),
                primary: Colors.red
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              'Exit',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
