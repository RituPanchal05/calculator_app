// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:calculator_app/colors.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  // var add = "+";
  // var min = "-";
  // var mul = "*";
  // var div = "/";
  var hideInput = false;
  var outputSize = 40;

  onButtonClick(value) {
    // if(value == add || value == min || value == mul || value == div) {

    // }

    if (value == "C") {
      input = "";
      output = "";
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
      }
      var userInput = input;
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      if (output.endsWith(".0")) {
        output = output.substring(0, output.length - 2);
      }
      hideInput = true;
      outputSize = 52;
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 40;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //!Input, Output Area

            Expanded(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(fontSize: 35, color: Colors.white.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),

            //!button area
            Row(
              children: [
                button(text: "C", tColor: Colors.red),
                button(text: "<", tColor: Colors.pink[500]),
                button(text: "%", tColor: Colors.pink[500]),
                button(text: "/", tColor: Colors.pink[500]),
              ],
            ),
            Row(
              children: [
                button(text: "7"),
                button(text: "8"),
                button(text: "9"),
                button(text: "*", tColor: Colors.pink[500]),
              ],
            ),
            Row(
              children: [
                button(text: "4"),
                button(text: "5"),
                button(text: "6"),
                button(text: "-", tColor: Colors.pink[500]),
              ],
            ),
            Row(
              children: [
                button(text: "1"),
                button(text: "2"),
                button(text: "3"),
                button(text: "+", tColor: Colors.pink[500]),
              ],
            ),
            Row(
              children: [
                button(text: "+"),
                button(text: "0"),
                button(text: "."),
                button(text: "=", btnBgColor: Colors.pink[500]),
              ],
            ),
          ],
        ));
  }

  Widget button({text, tColor = Colors.white, btnBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)), padding: EdgeInsets.all(26), backgroundColor: btnBgColor),
          onPressed: () => {
            onButtonClick(text)
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: tColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}