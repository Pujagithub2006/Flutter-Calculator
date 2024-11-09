import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.light(),
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
  final TextEditingController _displayController = TextEditingController();
  String _input = "";

  void _onButtonTap(String value) {
    setState(
      () {
        if (value == 'AC') {
          _input = "";
        } else if (value == 'C') {
          if (_input.isNotEmpty) {
            _input = _input.substring(0, _input.length - 1);
          }
        } else if (value == '=') {
          _findAnswer();
        } else {
          _input += value;
        }
        _displayController.text =
            _input; //add here only and not after _findAnswer
        //since, it will not be able to take input then
      },
    );
  }

  void _findAnswer() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_input.replaceAll('X', '*'));
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      _input = eval.toString();
    } catch (e) {
      _input = "Error";
    }
    /*setState(() {
      _displayController.text = _input;
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //Use of Appbar only for vertical alignment of containers
          ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 17),
            height: 150,
            width: double.infinity,
            //alignment: Alignment.topRight,  //alignment here before widget
            child: TextField(
              //no prop from container will be inherited by the textfield
              controller: _displayController, //controller in TextField
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFFEF7FF),
                filled: true,
              ),

              style: const TextStyle(
                //no alignment in TextStyle
                fontSize: 60,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.right, //alignment of text in textfield
              showCursor: true,
              readOnly: true,
            ),
          ),
          Container(
            //margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(1),
            height: 410,
            width: double.infinity,
            decoration: const BoxDecoration(
              /*borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),*/
              //whenever specifying a color in container,
              //put it in decoration that to in BoxDecoration
              color: Colors.white,
            ),
            //no use of elevated button, instead use circleAvatar
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  //instead of margin, we can add alignment to the row
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      //33,
                      'AC',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      23,
                    ),
                    _buildButton(
                      //33,
                      'C',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      25,
                    ),
                    _buildButton(
                      //33,
                      '%',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      27,
                    ),
                    _buildButton(
                      //33,
                      '/',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      27,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      //30,
                      '7',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '8',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '9',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //33,
                      'X',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      22,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      //30,
                      '4',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '5',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '6',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //33,
                      '-',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      27,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      //30,
                      '1',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '2',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '3',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //33,
                      '+',
                      const Color(0xFF000000),
                      const Color.fromRGBO(229, 229, 229, 1),
                      25,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      //30,
                      '00',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '0',
                      const Color(0xFF000000),
                      const Color.fromRGBO(243, 243, 243, 1),
                      22,
                    ),
                    _buildButton(
                      //30,
                      '.',
                      const Color(0xFF000000),
                      const Color(0xFFE5E5E5),
                      25,
                    ),
                    _buildButton(
                      //35,
                      '=',
                      const Color(0xFFFFFFFF),
                      const Color(0xFF0078D7),
                      30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ], //children
      ),
    );
  }

  Widget _buildButton(String text, Color textColor, bgColor, double textSize) {
    //textColor and bgColor have same type

    return Material(
      //wrapped in Material to support InkWell
      //color: Colors.transparent, //doesn't affect the button's look
      child: InkWell(
        //for ripple effect
        onTap: () => _onButtonTap(text),
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors
            .black, //radius of ripple effect, add splashColor and highlightColor
        child: //not using CircleAvatar(
            Container(
          //radius = rad,
          //backgroundColor: const Color(0xFF2E2E2E),
          height: 77,
          width: 97,
          decoration: BoxDecoration(
            //use box deco in container
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(6),
              bottom: Radius.circular(6),
            ),
            color: bgColor,
          ),

          //backgroundColor: bgColor, //color for container

          /*to align text inside a container like Container, Center, 
          or Column, you should use the alignment property of those widgets, not TextStyle */
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}
