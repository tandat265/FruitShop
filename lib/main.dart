import 'package:flutter/material.dart';
import 'package:fruitshop/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Loại bỏ chữ 'DEBUG'
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            // return const login_screen();
            return const login_screen();
          },
        ),
      ),
    );
  }
}
