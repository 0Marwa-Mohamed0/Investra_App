import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/auth_service.dart';
import 'package:investra/core/styles/colors.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import 'role_selection.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/social_auth_button.dart';
import 'package:investra/feature/main_app/mainAppEnterpreneur.dart';
import 'package:investra/feature/main_app/mainAppInvestor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _obscurePassword = true;
  dynamic _authSubscription;

  @override
  void initState() {
    super.initState();
    // مراقبة الدخول الذكي للـ OAuth (جوجل ولينكد إن)
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      if (session != null && data.event == AuthChangeEvent.signedIn) {
        final userRecord = await _authService.checkUserRecord(session.user.id);

        if (mounted) {
          // الفحص الذكي: للتأكد من أن السجل موجود ومختار رول حقيقي وليس فارغاً بسبب التريجر
          if (userRecord != null && userRecord['role'] != null && userRecord['role'].toString().isNotEmpty && userRecord['role'] != 'Unknown') {
            final userRole = await _authService.updateUserSessionAndGetRole(session.user.id);
            _navigateBasedOnRole(userRole);
          } else {
            // مستخدم جديد مسجل بجوجل -> نحوله لشاشة اختيار الـ Role لتكملة بياناته أول مرة
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill in all fields', AppColors.errorColor);
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar('Please enter a valid email address', AppColors.errorColor);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _authService.login(email, password);
      if (response.user != null) {
        final userRole = await _authService.updateUserSessionAndGetRole(response.user!.id);
        if (mounted) {
          _showSnackBar('Login Completed Successfully!', AppColors.green1Color);
          _navigateBasedOnRole(userRole);
        }
      }
    } on AuthException catch (error) {
      String msg = error.message == 'Invalid login credentials' ? 'Wrong email or password.' : error.message;
      _showSnackBar(msg, AppColors.errorColor);
    } catch (error) {
      _showSnackBar('Error: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: color),
      );
    }
  }

  void _navigateBasedOnRole(String role) {
    final Widget nextScreen = (role == 'Investor') ? const MainAppInvestorScreen() : const MainAppEnterpreneurScreen();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.blackColor),
        title: const Text(
          "Investra",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(40),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                textAlign: TextAlign.center,
              ),
              const Gap(12),
              const Text(
                "Manage your portfolio and track\ninvestments",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grayColor, fontSize: 16, height: 1.5),
              ),
              const Gap(40),
              AuthTextField(controller: _emailController, label: "Email Address", hint: "name@example.com", icon: Icons.email_outlined),
              AuthTextField(
                controller: _passwordController,
                label: "Password",
                hint: "********",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                  child: const Text("Forgot Password?", style: TextStyle(color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              const Gap(24),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Log In", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const Gap(40),
              const Row(
                children: [
                  Expanded(child: Divider(color: AppColors.bgGray)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("OR CONTINUE WITH", style: TextStyle(color: AppColors.grayColor, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider(color: AppColors.bgGray)),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  Expanded(child: SocialAuthButton(label: "Google", iconPath: 'assets/icons/google_svg.svg', onPressed: () => _authService.signInWithOAuth(OAuthProvider.google))),
                  const Gap(16),
                  Expanded(child: SocialAuthButton(label: "LinkedIn", iconPath: 'assets/icons/Linkedin.svg', onPressed: () => _authService.signInWithOAuth(OAuthProvider.linkedin))),
                ],
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(color: AppColors.grayColor, fontSize: 14)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationScreen())),
                    child: const Text("Sign up for free", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}