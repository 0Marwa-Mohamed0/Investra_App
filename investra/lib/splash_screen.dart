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
    _mainController = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 1500)
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: const Interval(0.0, 0.8, curve: Curves.easeIn))
    );
    
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: const Interval(0.0, 0.8, curve: Curves.easeOut))
    );

    // Continuous pulse animation for the background effect
    _pulseController = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 2)
    )..repeat(reverse: true);
    
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut)
    );

    _mainController.forward();

    // Navigate after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 1000),
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
      body: Stack(
        children: [
          // 1. Dynamic Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF0F4F8),
                  Colors.white,
                  Color(0xFFF8F9FB),
                ],
              ),
            ),
          ),
          
          // 2. Pulsing Glow Effect behind the logo
          Center(
            child: ScaleTransition(
              scale: _pulseAnimation,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF1E4D7B).withValues(alpha: 0.15),
                      const Color(0xFF1E4D7B).withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 3. Floating Particles (Decorative)
          ...List.generate(5, (index) => _PositionedParticle(index: index)),

          // 4. Animated Logo
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset('assets/images/App_logo.png', width: 280),
              ),
            ),
          ),
          
          // 5. Minimalist loading line at the bottom
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
            color: const Color(0xFF1E4D7B).withValues(alpha: 0.03),
          ),
        ),
      ),
    );
  }
}
