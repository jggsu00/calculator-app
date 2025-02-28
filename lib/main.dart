import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = "";
  String _operand = "";
  double? _firstNum;
  double? _secondNum;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _display = "";
        _operand = "";
        _firstNum = null;
        _secondNum = null;
      }
    });
  }
}