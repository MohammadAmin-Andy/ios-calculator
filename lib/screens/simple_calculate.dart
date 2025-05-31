import 'dart:convert';
import 'dart:developer';

import 'package:apple_calculator/constances/constances.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculate extends StatefulWidget {
  SimpleCalculate({super.key});

  @override
  State<SimpleCalculate> createState() => _SimpleCalculateState();
}

class _SimpleCalculateState extends State<SimpleCalculate> {
  var userInput = '';
  var result = '';
  var showAC = false;

  void buttonPressed(String text) {
    setState(() {
      userInput = userInput + text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackBackground,
        leading: Icon(Icons.menu, color: orangeButtonColor),
      ),
      backgroundColor: blackBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [_inputBox(), _keyboard()]),
        ),
      ),
    );
  }

  Expanded _inputBox() {
    if (result == '') {
      return Expanded(
        flex: 13,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          width: double.infinity,
          color: blackBackground,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Text(
                userInput,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sf',
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      var number = double.parse(result);
      String total = number.toStringAsFixed(6);
      return Expanded(
        flex: 13,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Expanded(child: Container()),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                width: double.infinity,
                color: blackBackground,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Text(
                      userInput,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'sf',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                width: double.infinity,
                color: blackBackground,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Text(
                      total,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: whiteTextColor,
                        fontFamily: 'sf',
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Expanded _keyboard() {
    return Expanded(
      flex: 22,
      child: Container(
        color: blackBackground,
        child: Column(
          //spacing: 14,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _firstRow(),
            getRow("7", "8", "9", "×"),
            getRow('4', '5', '6', '-'),
            getRow('1', '2', '3', '+'),
            _lastRow(),
          ],
        ),
      ),
    );
  }

  Widget getRow(var text1, var text2, var text3, var text4) {
    return Row(
      //spacing: 14,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor(text1),
            ),
            onPressed: () {
              buttonPressed(text1);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getOperatorText(text1),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor(text2),
            ),
            onPressed: () {
              buttonPressed(text2);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                text2,

                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getOperatorText(text2),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor(text3),
            ),
            onPressed: () {
              buttonPressed(text3);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                text3,
                textAlign: TextAlign.center,
                //sfjasfpjsfd
                style: TextStyle(
                  color: getOperatorText(text3),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor(text4),
            ),
            onPressed: () {
              if (text4 == '×') {
                buttonPressed('*');
              } else {
                buttonPressed(text4);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                text4,
                textAlign: TextAlign.center,
                //sfjasfpjsfd
                style: TextStyle(
                  color: getOperatorText(text4),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _firstRow() {
    return Row(
      //spacing: 14,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: grayButtonColor,
            ),
            onPressed: () {
              if (showAC) {
                setState(() {
                  result = '';
                  userInput = '';
                });
              } else {
                setState(() {
                  print(deleteStatus(userInput, result));
                  userInput = userInput.substring(0, userInput.length - 1);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: deleteStatus(userInput, result),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor('+/-'),
            ),
            onPressed: () {
              buttonPressed('+/-');
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '+/-',

                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getOperatorText('+/-'),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor('%'),
            ),
            onPressed: () {
              buttonPressed('%');
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '%',
                textAlign: TextAlign.center,
                //sfjasfpjsfd
                style: TextStyle(
                  color: getOperatorText('%'),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: getOperatorColor('÷'),
            ),
            onPressed: () {
              buttonPressed('/');
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '÷',
                textAlign: TextAlign.center,
                //sfjasfpjsfd
                style: TextStyle(
                  color: getOperatorText('÷'),
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _lastRow() {
    return Row(
      //spacing: 14,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: blackButtonColor,
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                height: 32,
                width: 32,
                child: Image(image: AssetImage('assets/images/calculator.jpg')),
              ),
              // child: Text(
              //   '00',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: whiteTextColor,
              //     fontFamily: 'sf',
              //     fontSize: 34,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: blackButtonColor,
            ),
            onPressed: () {
              buttonPressed('0');
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '0',

                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: blackButtonColor,
            ),
            onPressed: () {
              buttonPressed(',');
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                ',',
                textAlign: TextAlign.center,
                //sfjasfpjsfd
                style: TextStyle(
                  color: whiteTextColor,
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.transparent, width: 0),
              ),
              backgroundColor: orangeButtonColor,
            ),
            onPressed: () {
              Parser parser = Parser();
              Expression expression = parser.parse(userInput);
              ContextModel contextModel = ContextModel();

              double eval = expression.evaluate(
                EvaluationType.REAL,
                contextModel,
              );
              setState(() {
                result = eval.toString();
                print(result);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '=',
                textAlign: TextAlign.center,
                //sfjasfpjsfd
                style: TextStyle(
                  color: whiteTextColor,
                  fontFamily: 'sf',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget deleteStatus(String userInput, String result) {
    if (userInput == '' || result != '') {
      showAC = true;
      return Text(
        'AC',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: blackTextColor,
          fontFamily: 'sf',
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      showAC = false;
      return SizedBox(
        height: 40,
        width: 40,
        child: Image(
          image: AssetImage('assets/images/del.jpg'),
          alignment: Alignment.center,
        ),
      );
    }
  }

  bool isOperator(String text) {
    var operator = ['AC', 'CE', '+/-', '%'];
    for (var item in operator) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  bool isSign(String text) {
    var sign = ['+', '-', '×', '÷', '='];
    for (var item in sign) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getOperatorText(String text) {
    if (isOperator(text)) {
      return blackTextColor;
    } else {
      return whiteTextColor;
    }
  }

  Color getOperatorColor(String text) {
    if (isOperator(text)) {
      return grayButtonColor;
    }
    if (isSign(text)) {
      return orangeButtonColor;
    } else {
      return blackButtonColor;
    }
  }
}
