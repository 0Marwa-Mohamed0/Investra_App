import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/auth/data/services/auth_service.dart';
import 'package:investra/features/auth/presentation/pages/login_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_entrepreneur_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_investor_screen.dart';
import 'package:investra/features/onboarding/presentation/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _mainController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeIn),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeOutBack),
    );

    _mainController.forward();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    try {
      final session = Supabase.instance.client.auth.currentSession;
      final prefs = await SharedPreferences.getInstance();
      final bool isNotNewDevice = prefs.getBool('is_not_new_device') ?? false;

      if (session != null) {
        final String role = await AuthService().updateUserSessionAndGetRole(session.user.id);
        if (!mounted) return;
        await prefs.setBool('is_not_new_device', true);

        if (role == 'Entrepreneur') {
          _navigateTo(const MainAppEntrepreneurScreen());
        } else if (role == 'Investor') {
          _navigateTo(const MainAppInvestorScreen());
        } else {
          _navigateTo(const LoginScreen());
        }
      } else {
        if (isNotNewDevice) {
          _navigateTo(const LoginScreen());
        } else {
          await prefs.setBool('is_not_new_device', true);
          _navigateTo(const OnboardingScreen());
        }
      }
    } catch (e) {
      debugPrint("Error in Splash Navigation: $e");
      if (mounted) {
        _navigateTo(const LoginScreen());
      }
    }
  }

  void _navigateTo(Widget nextScreen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered Big Logo
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    'assets/images/big_logo.png',
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
