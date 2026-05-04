import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/main_app/main_app_enterpreneur.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feature/splash/screen/splash_screen.dart';

Future<void> main() async {
  // التأكد من تهيئة أدوات Flutter قبل أي عملية أخرى
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
    final colorScheme = ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.bgColor,
      surface: AppColors.bgColor,
      onSurface: AppColors.blackColor,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investra',
      theme: ThemeData(
        fontFamily: 'DMSerif',
        primaryColor: AppColors.primaryColor,
      ),
      home: const MainAppEnterpreneurScreen(),
    );
  }
}
