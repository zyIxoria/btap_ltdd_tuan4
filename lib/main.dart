import 'package:flutter/material.dart';
import 'Bai1/Calculator.dart';
import 'Bai2/Huit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 2 - Cơ sở vật chất HUIT',
      home: FacilityScreen(),
    );
 // @override
 // Widget build(BuildContext context) {
   // return MaterialApp(
     // debugShowCheckedModeBanner: false,
     // title: 'Bai tap 01 - Calculator UI',
     // home: CalculatorScreen(),
    //);
  }
}