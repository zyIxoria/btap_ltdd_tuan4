import 'package:flutter/material.dart';
import 'Bai1/Calculator.dart';
import 'Bai2/Huit.dart';
import 'Bai3/Mood.dart';
import 'Bai4BTVN/Wallet.dart';
import 'Bai5BTVN/MedicalScreen.dart';
import 'Bai6BTVN/MusicScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Bai6
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Bài 6 - Music Player UI',
  //     home: const MusicPlayerScreen(),
  //   );
  // Bai5
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Bài 5 - Medical UI',
  //     home: const MedicalScreen(),
  //   );
  // Bai4
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 4 - Wallet UI',
      home: const WalletScreen(),
    );
// Bai3
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'Bài 3 - Mood UI',
//     home: MoodScreen(),
//   );
//Bai2
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Bài 2 - Cơ sở vật chất HUIT',
//       home: FacilityScreen(),
//     );
// Bai1
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Bai tap 01 - Calculator UI',
//      home: CalculatorScreen(),
//     );
  }
}