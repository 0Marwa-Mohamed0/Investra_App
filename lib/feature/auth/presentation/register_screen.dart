import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import '../data/auth_service.dart';
import 'login_screen.dart';
import 'role_selection.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/social_auth_button.dart';
import 'widgets/account_type_toggle.dart';
import 'package:investra/feature/main_app/mainAppEnterpreneur.dart';
import 'package:investra/feature/main_app/mainAppInvestor.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedType = "Investor";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _obscurePassword = true;
  dynamic _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      if (session != null && data.event == AuthChangeEvent.signedIn) {
        final userRecord = await _authService.checkUserRecord(session.user.id);
        if (mounted) {


          if (userRecord != null && userRecord['role'] != null && userRecord['role'].toString().isNotEmpty && userRecord['role'] != 'Unknown') {
            final userRole = await _authService.updateUserSessionAndGetRole(session.user.id);
            final Widget nextScreen = (userRole == 'Investor') ? const MainAppInvestorScreen() : const MainAppEnterpreneurScreen();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
          } else {


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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  bool _isPasswordSecure(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$').hasMatch(password);
  }

  Future<void> _signUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill in all fields', AppColors.errorColor);
      return;
    }

    if (name.length < 3) {
      _showSnackBar('Name must be at least 3 characters', AppColors.errorColor);
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar('Please enter a valid email address', AppColors.errorColor);
      return;
    }

    if (!_isPasswordSecure(password)) {
      _showSnackBar('Password must be at least 8 characters and contain both letters and numbers', AppColors.errorColor);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _authService.signUp(email: email, password: password, name: name, role: selectedType);
      if (mounted && response.user != null) {
        _showSnackBar('Registration successful! Please check your email.', AppColors.green1Color);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } on AuthException catch (error) {
      _showSnackBar(error.message, AppColors.errorColor);
    } catch (error) {
      _showSnackBar('Error: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.blackColor),
        title: const Text("Create Account", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(15),
              _buildHeroImage(),
              const Gap(20),
              const Text("Account Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.grayColor)),
              const Gap(8),
              AccountTypeToggle(selectedType: selectedType, onTypeChanged: (type) => setState(() => selectedType = type)),
              const Gap(20),
              AuthTextField(controller: _nameController, label: "Full Name", hint: "John Doe", icon: Icons.person_outline),
              AuthTextField(controller: _emailController, label: "Email Address", hint: "john@example.com", icon: Icons.email_outlined),
              AuthTextField(
                controller: _passwordController,
                label: "Password",
                hint: "********",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              const Gap(5),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _signUp,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Create Account", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const Gap(15),
              _buildLoginLink(),
              const Gap(20),
              _buildSocialAuthRow(),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroImage() => Container(
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: const DecorationImage(image: AssetImage('assets/images/Background.png'), fit: BoxFit.cover),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [Colors.black.withOpacity(0.8), Colors.transparent], begin: Alignment.bottomLeft),
      ),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Join Investra", style: TextStyle(color: AppColors.bgColor, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1)),
          Gap(4),
          Text("Start your investment journey or pitch your\nnext big idea today.", style: TextStyle(color: AppColors.secondary1Color, fontSize: 12, height: 1.3)),
        ],
      ),
    ),
  );

  Widget _buildLoginLink() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Already have an account? ", style: TextStyle(color: AppColors.grayColor, fontSize: 14)),
      GestureDetector(
        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
        child: const Text("Log in", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    ],
  );

  Widget _buildSocialAuthRow() => Column(
    children: [
      const Row(
        children: [
          Expanded(child: Divider(color: AppColors.bgGray)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("OR REGISTER WITH", style: TextStyle(color: AppColors.grayColor, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Divider(color: AppColors.bgGray)),
        ],
      ),
      const Gap(12),
      Row(
        children: [
          Expanded(child: SocialAuthButton(label: "Google", iconPath: 'assets/icons/google_svg.svg', onPressed: () => _authService.signInWithOAuth(OAuthProvider.google))),
          const Gap(16),
          Expanded(child: SocialAuthButton(label: "LinkedIn", iconPath: 'assets/icons/Linkedin.svg', onPressed: () => _authService.signInWithOAuth(OAuthProvider.linkedin))),
        ],
      ),
    ],
  );
}