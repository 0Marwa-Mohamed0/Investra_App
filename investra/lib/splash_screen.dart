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
    
    _mainController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeIn));
    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _mainController, curve: Curves.elasticOut));

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
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.5,
            colors: [
              Color(0xFFE0F2FE), // Light blue center glow
              Colors.white,      // Pure white edges
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. Floating Particles for depth (Light blue version)
            ...List.generate(5, (index) => _PositionedParticle(index: index)),

            // 2. Centered Logo
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _pulseAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      'assets/images/App_logo.png',
                      width: MediaQuery.of(context).size.width * 0.9, 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // 3. Elegant Bottom Line
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Center(
                  child: Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E4D7B).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(1),
                    ),
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

class _PositionedParticle extends StatelessWidget {
  final int index;
  const _PositionedParticle({required this.index});

  @override
  Widget build(BuildContext context) {
    final List<Offset> offsets = [
      const Offset(-100, -150),
      const Offset(120, -100),
      const Offset(-80, 180),
      const Offset(100, 150),
      const Offset(0, -200),
    ];
    
    return Center(
      child: Transform.translate(
        offset: offsets[index % offsets.length],
        child: Container(
          width: 8 + (index * 2),
          height: 8 + (index * 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1E4D7B).withValues(alpha: 0.05),
          ),
        ),
      ),
    );
  }
}
