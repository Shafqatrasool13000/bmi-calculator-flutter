import 'package:flutter/material.dart';

class CalculationResult extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final String bMIResult;
  final String adviceBMI;

  CalculationResult({
    this.weightController,
    this.adviceBMI,
    this.heightController,
    this.bMIResult,
    this.ageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$bMIResult',
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(7),
        ),
        Text(
          '$adviceBMI',
          style: TextStyle(
              color: Color(0xffF06292),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
