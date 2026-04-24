import 'package:flutter/material.dart';
import 'package:investra/feature/profile/setting/screen/entrepreneur_setting_screen.dart';
import 'package:investra/feature/profile/setting/screen/investor_setting_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}
