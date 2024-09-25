import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(  // <--- Añadir SafeArea
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora'),
            backgroundColor: Colors.blueGrey,
          ),
          backgroundColor: Colors.black,
          body: const Calculator(),
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String output = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
        output = '';
      } else if (buttonText == '=') {
        try {
          output = _evaluateExpression(input);
        } catch (e) {
          output = 'Error';
        }
      } else {
        input += buttonText;
      }
    });
  }

  String _evaluateExpression(String expression) {
    // Aquí podrías agregar la lógica de evaluación de la expresión
    return expression; // Solo devuelve lo ingresado por ahora
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Cambié 'primary' por 'backgroundColor'
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
                Text(
                  output,
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: <Widget>[
                buildButton('7', Colors.blueGrey),
                buildButton('8', Colors.blueGrey),
                buildButton('9', Colors.blueGrey),
                buildButton('/', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4', Colors.blueGrey),
                buildButton('5', Colors.blueGrey),
                buildButton('6', Colors.blueGrey),
                buildButton('*', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1', Colors.blueGrey),
                buildButton('2', Colors.blueGrey),
                buildButton('3', Colors.blueGrey),
                buildButton('-', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('C', Colors.redAccent),
                buildButton('0', Colors.blueGrey),
                buildButton('=', Colors.green),
                buildButton('+', Colors.orange),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
