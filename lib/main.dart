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
      } else if (value == "=") {
        if (_firstNum != null && _operand.isNotEmpty && _display.isNotEmpty) {
          _secondNum = double.tryParse(_display);
          if (_secondNum != null) {
            switch (_operand) {
              case "+":
                _display = (_firstNum! + _secondNum!).toString();
                break;
              case "-":
                _display = (_firstNum! - _secondNum!).toString();
                break;
              case "*":
                _display = (_firstNum! * _secondNum!).toString();
                break;
              case "/":
                _display =
                _secondNum == 0 ? "Error" : (_firstNum! / _secondNum!)
                    .toString();
                break;
            }
          }
          _operand = "";
          _firstNum = null;
          _secondNum = null;
        }
      } else if (["+", "-", "*", "/"].contains(value)) {
        if (_display.isNotEmpty) {
          _firstNum = double.tryParse(_display);
          _operand = value;
          _display = "";
        }
      } else {
        _display += value;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}