import 'package:flutter/material.dart';
import 'package:investra/feature/main_app/main_app_enterpreneur.dart';
import 'package:investra/feature/main_app/main_app_investor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feature/splash/screen/splash_screen.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();

  // supabase with investra
  await Supabase.initialize(
    url: 'https://eruuwckhnkisegwirxzj.supabase.co',
    anonKey: 'sb_publishable_M8lhYOIXog8c-bf0p8gCDQ_B-APa-Ih',
  );
  print("تم الاتصال بنجاح بـ Investra!");

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
      home: const MainAppInvestorScreen(),
    );
  }
}
