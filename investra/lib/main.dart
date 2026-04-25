import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const InvestraApp());
}

class InvestraApp extends StatelessWidget {
  const InvestraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investra',
      theme: ThemeData(
        fontFamily: 'DMSerif',
        primaryColor: const Color(0xFF1E4D7B),
      ),
      home: const SplashScreen(),
    );
  }
}
