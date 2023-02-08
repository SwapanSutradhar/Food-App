import 'package:flutter/material.dart';
import 'package:food_delivery/home_page.dart';
import 'package:food_delivery/intro_page.dart';
import 'package:food_delivery/my_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
