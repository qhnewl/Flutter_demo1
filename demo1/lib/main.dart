import 'package:flutter/material.dart';
import 'package:demo1/login/login.dart';

void main() {
  runApp(const Demo1());
}

const double windowWidth = 480;
const double windowHeight = 854;

class Demo1 extends StatelessWidget {
  const Demo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
