import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:investra/feature/main_app/mainAppEnterpreneur.dart';
import 'package:investra/feature/main_app/mainAppInvestor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 1. Supabase Auth
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        // --- تحديث الـ last_login عند النجاح ---
        await Supabase.instance.client
            .from('User')
            .update({'last_login': DateTime.now().toIso8601String()})
            .eq('userid', user.id);
        // ------------------------------------

        await Future.delayed(const Duration(seconds: 1));

        // 2. نوع المستخدم من جدول User
        var data = await Supabase.instance.client
            .from('User')
            .select('role')
            .eq('userid', user.id)
            .maybeSingle();

        if (data == null) {
          await Future.delayed(const Duration(seconds: 1));
          data = await Supabase.instance.client
              .from('User')
              .select('role')
              .eq('userid', user.id)
              .maybeSingle();
        }

        if (data == null) {
          throw 'User record not found in database. Please ensure registration was complete.';
        }

        final String userRole = data['role'] ?? 'Unknown';

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Completed Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          _navigateBasedOnRole(userRole);
        }
      }
    } on AuthException catch (error) {
      String errorMessage = error.message;
      if (error.message == 'Invalid login credentials') {
        errorMessage = 'Wrong email or password. Please try again.';
      } else if (error.message.contains('Email not confirmed')) {
        errorMessage = 'Please verify your email address before logging in.';
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithOAuth(OAuthProvider provider) async {
    setState(() => _isLoading = true);
    try {
      await Supabase.instance.client.auth.signInWithOAuth(
        provider,
        redirectTo: 'io.supabase.flutter://login-callback',
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _navigateBasedOnRole(String role) {
    if (role == 'Investor') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainAppInvestorScreen()),
            (route) => false,
      );
    } else if (role == 'Entrepreneur') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainAppEnterpreneurScreen(),
        ),
            (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('خطأ في تحديد نوع الحساب، يرجى التواصل مع الدعم'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E4D7B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Investra",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1E4D7B),
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Gap(50),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D3B66),
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "Manage your portfolio and track\ninvestments",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const Gap(50),
                    _buildLabel("Email Address"),
                    const Gap(8),
                    _buildTextField(
                      _emailController,
                      "name@example.com",
                      Icons.email_outlined,
                    ),
                    const Gap(25),
                    _buildLabel("Password"),
                    const Gap(8),
                    _buildTextField(
                      _passwordController,
                      "********",
                      Icons.lock_outline,
                      isPass: _obscurePassword,
                      onToggleVisibility: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF1E4D7B),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E4D7B),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : const Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Gap(40),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "OR CONTINUE WITH",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Gap(30),
                    Row(
                      children: [
                        Expanded(
                          child: _socialBtn(
                            "Google",
                            'assets/icons/google_svg.svg',
                            OAuthProvider.google,
                          ),
                        ),
                        const Gap(15),
                        Expanded(
                          child: _socialBtn(
                            "LinkedIn",
                            'assets/icons/Linkedin.svg',
                            OAuthProvider.linkedin,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),
                          ),
                          child: const Text(
                            "Sign up for free",
                            style: TextStyle(
                              color: Color(0xFF1E4D7B),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _socialBtn(String label, String iconPath, OAuthProvider provider) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        side: const BorderSide(color: Color(0xFFF1F4F8)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: const Color(0xFFF8F9FB),
      ),
      onPressed: () => _signInWithOAuth(provider),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconPath.endsWith('.svg')
              ? SvgPicture.asset(iconPath, width: 20)
              : Image.asset(iconPath, width: 20),
          const Gap(10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color(0xFF1E4D7B),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String hint,
      IconData icon, {
        bool isPass = false,
        VoidCallback? onToggleVisibility,
      }) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF8F9FB),
        prefixIcon: Icon(icon, color: Colors.grey, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: onToggleVisibility != null
            ? IconButton(
          icon: Icon(
            isPass
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
          ),
          onPressed: onToggleVisibility,
        )
            : null,
      ),
    );
  }
}