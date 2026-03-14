import 'package:flutter/material.dart';
import 'Bai1/Calculator.dart';
import 'Bai2/Huit.dart';
import 'Bai3/Mood.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //Bai3
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 3 - Mood UI',
      home: MoodScreen(),
    );
//Bai2
  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //debugShowCheckedModeBanner: false,
      //title: 'Bài 2 - Cơ sở vật chất HUIT',
      //home: FacilityScreen(),
    //);
//Bai1
 // @override
 // Widget build(BuildContext context) {
   // return MaterialApp(
     // debugShowCheckedModeBanner: false,
     // title: 'Bai tap 01 - Calculator UI',
     // home: CalculatorScreen(),
    //);
  }
}