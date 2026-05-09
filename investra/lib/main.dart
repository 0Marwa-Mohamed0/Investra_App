import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/auth/presentation/login_screen.dart';
import 'package:investra/feature/main_app/mainAppEnterpreneur.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feature/splash/screen/splash_screen.dart';

Future<void> main() async {

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
        useMaterial3: true,
        fontFamily: 'DMSerif',
        scaffoldBackgroundColor: AppColors.bgColor,
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          onPrimary: AppColors.bgColor,
          surface: AppColors.bgColor,
          onSurface: AppColors.blackColor,
          secondary: AppColors.grayColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.bgColor,
          foregroundColor: AppColors.primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSerif',
          ),
          iconTheme: IconThemeData(color: AppColors.primaryColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.bgColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.bgGray, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.bgGray, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          hintStyle: const TextStyle(color: AppColors.gray2Color, fontSize: 15),
          labelStyle: const TextStyle(color: AppColors.grayColor, fontSize: 14),
          floatingLabelStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.bgColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          titleLarge: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(color: AppColors.darkGray, fontSize: 15),
          bodySmall: TextStyle(color: AppColors.gray2Color, fontSize: 13),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
