import 'package:flutter/material.dart';
import 'feature/onboarding/presentation/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    
    // Main appearance animation
    _mainController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeIn));
    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _mainController, curve: Curves.elasticOut));

    // Continuous subtle pulse
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    _mainController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 1200),
        ),
      );
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.5,
            colors: [Color(0xFF1E293B), Color(0xFF020617)],
          ),
        ),
        // CENTER EVERYTHING PERFECTLY
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _pulseAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  'assets/images/App_logo.png',
                  width: MediaQuery.of(context).size.width * 0.9, // 90% width for prominence
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
