import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
      title: 'Investra App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: AppColors.bgColor,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.bgColor,
          foregroundColor: AppColors.primaryColor,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.bgColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.bgGray),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.bgGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          hintStyle: const TextStyle(color: AppColors.gray2Color),
          labelStyle: const TextStyle(color: AppColors.grayColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.bgColor,
            disabledBackgroundColor: AppColors.bgGray,
            disabledForegroundColor: AppColors.gray2Color,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return null;
          }),
          checkColor: WidgetStateProperty.all(AppColors.bgColor),
          side: const BorderSide(color: AppColors.bgGray, width: 1.5),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
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
          labelSmall: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
