import 'package:flutter/material.dart';
import 'package:investra/feature/main_app/main_app_enterpreneur.dart';
import 'package:investra/feature/main_app/main_app_investor.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainAppInvestorScreen(),
    );
  }
}
