import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyCalculator(),
    ));

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String btnText) {
    if (btnText == "CLEAR") {
      String _output = "0";
      double num1 = 0.0;
      double num2 = 0.0;
      String operand = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      num1 = double.parse(output);
      operand = btnText;
      _output = "0";
    } else if (btnText == ".") {

      if (_output.contains(".")) {
        print("Aleaready contains a decimals");
        return;
      } else {
        _output = _output + btnText;
      }
    }else if(btnText == "="){

    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          buttonPressed(buttonText);
        },
//        color: Colors.redAccent,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Calculator"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent[200],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                )),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
