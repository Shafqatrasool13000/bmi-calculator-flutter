import 'package:flutter/material.dart';

import 'package:com/ui/CustomviewInterface.dart';

void main() {
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'BMI',
      home: CustomViewHomePage(),
    );
  }
}