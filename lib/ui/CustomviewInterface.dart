import 'package:flutter/material.dart';
import 'endingTexts.dart';

class CustomViewHomePage extends StatefulWidget {
  @override
  _CustomViewHomePageState createState() => _CustomViewHomePageState();
}

class _CustomViewHomePageState extends State<CustomViewHomePage> {
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _calculation = 1.2;
  String _bmiCalculationResult = '';
  String _adviceBMI = '';
  double inches = 0.0;
  double height = 0.0;

  void reset() {
    setState(() {
      _ageController.clear();
      _weightController.clear();
      _heightController.clear();
      _bmiCalculationResult = 'Please Enter height and Weight ';
      _adviceBMI = '';
    });
  }

  void _calculate() {
    setState(() {
      height = double.parse(_heightController.text);
      inches = height * 12;
      _calculation = double.parse(_weightController.text) / (inches * inches);
      double _finalCalculate = 0.0;
      if (_heightController.text.isNotEmpty ||
          inches > 0 && _weightController.text.isNotEmpty ||
          double.parse(_weightController.text) > 0 &&
              _ageController.text.isNotEmpty ||
          double.parse(_ageController.text) > 0) {
        _finalCalculate = 703 * _calculation;
        if (double.parse(
              _finalCalculate.toStringAsFixed(1),
            ) <
            18) {
          _bmiCalculationResult =
              'Your BMI: ${_finalCalculate.toStringAsFixed(1)}';
          _adviceBMI = 'UnderWeight';
        } else if (_finalCalculate > 18 && _finalCalculate < 25) {
          _bmiCalculationResult =
              'Your BMI: ${_finalCalculate.toStringAsFixed(1)}';
          _adviceBMI = 'NormalWeight';
        } else if (_finalCalculate > 25 && _finalCalculate < 30) {
          _bmiCalculationResult =
              'Your BMI: ${_finalCalculate.toStringAsFixed(1)}';
          _adviceBMI = 'OverWeight';
        } else {
          _bmiCalculationResult = 'obesity';
          _adviceBMI = 'Your BMI: ${_finalCalculate.toStringAsFixed(1)}';
        }
      } else {
        _finalCalculate = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Image(
              height: 120,
              width: 120,
              image: AssetImage('images/bmilogo.png'),
            ),
          ),
          Container(
            width: 360,
            height: 250,
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Age ',
                    labelText: 'Age',
                  ),
                ),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.assessment),
                    hintText: 'Height in feet',
                    labelText: 'Height in feet',
                  ),
                ),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.list),
                    hintText: 'Weight in lbs',
                    labelText: 'Weight',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xffF06292),
                        child: Text('Calculate'),
                        onPressed: _calculate),
                    RaisedButton(
                        color: Colors.deepOrangeAccent,
                        child: Text('Reset'),
                        onPressed: reset),
                  ],
                ),
              ],
            ),
          ),
          CalculationResult(
            bMIResult: _bmiCalculationResult,
            heightController: _heightController,
            weightController: _weightController,
            adviceBMI: _adviceBMI,
            ageController: _ageController,
          ),
        ],
      ),
    );
  }
}
