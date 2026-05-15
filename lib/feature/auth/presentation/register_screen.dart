import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart';

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
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': name,
          'user_type': selectedType,
        },
      );

      if (mounted) {
        if (response.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration successful! Please check your email for confirmation.'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      }
    } on AuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message), backgroundColor: Colors.red),
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 750;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E4D7B)),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          "Create Account",
          style: TextStyle(color: Color(0xFF1E4D7B), fontWeight: FontWeight.w900, fontSize: 18),
        ),
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
              _buildHeroImage(isSmallScreen),
              const Gap(25),
              const Text(
                "Account Type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey),
              ),
              const Gap(10),
              _buildAccountTypeToggle(),
              const Gap(25),
              _buildInputField("Full Name", "John Doe", Icons.person_outline, isSmallScreen, _nameController),
              _buildInputField("Email Address", "john@example.com", Icons.email_outlined, isSmallScreen, _emailController),
              _buildInputField(
                "Password",
                "********",
                Icons.lock_outline,
                isSmallScreen,
                _passwordController,
                isPass: _obscurePassword,
                onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              const Gap(15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E4D7B),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                ),
                onPressed: _isLoading ? null : _signUp,
                child: _isLoading
                    ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text("Create My Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const Gap(15),
              _buildLoginLink(context),
              const Gap(40),
              _buildSocialAuthRow(isSmallScreen),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroImage(bool isSmall) => Container(
    height: isSmall ? 110 : 140,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: AssetImage('assets/images/Background.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.75), Colors.transparent],
          begin: Alignment.bottomLeft,
        ),
      ),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Join Investra",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
          ),
          Gap(4),
          Text(
            "Start your investment journey or pitch your\nnext big idea today.",
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.3),
          ),
        ],
      ),
    ),
  );

  Widget _buildAccountTypeToggle() => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        Expanded(child: _toggleBtn("Investor")),
        Expanded(child: _toggleBtn("Entrepreneur")),
      ],
    ),
  );

  Widget _toggleBtn(String text) {
    bool active = selectedType == text;
    return GestureDetector(
      onTap: () => setState(() => selectedType = text),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: active ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)] : null,
        ),
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: active ? const Color(0xFF1E4D7B) : Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, IconData icon, bool isSmall, TextEditingController controller, {bool isPass = false, VoidCallback? onToggleVisibility}) => Padding(
    padding: EdgeInsets.only(bottom: isSmall ? 10 : 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF1E4D7B))),
        const Gap(6),
        TextField(
          controller: controller,
          obscureText: isPass,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFFF8F9FB),
            prefixIcon: Icon(icon, color: Colors.grey, size: 18),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF1F4F8))),
            suffixIcon: onToggleVisibility != null
                ? IconButton(
              icon: Icon(
                  isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Colors.grey,
                  size: 18
              ),
              onPressed: onToggleVisibility,
            )
                : null,
          ),
        ),
      ],
    ),
  );

  Widget _buildLoginLink(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Already have an account? ", style: TextStyle(color: Colors.grey, fontSize: 13)),
      GestureDetector(
        onTap: () {
          // إذا كان يمكن الرجوع نرجع، وإلا نفتح صفحة اللوجن ونستبدل الحالية
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
        child: const Text("Log in", style: TextStyle(color: Color(0xFF1E4D7B), fontWeight: FontWeight.bold, fontSize: 13)),
      ),
    ],
  );

  Widget _buildSocialAuthRow(bool isSmall) => Column(
    children: [
      const Row(
        children: [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("OR REGISTER WITH", style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Divider()),
        ],
      ),
      Gap(isSmall ? 10 : 15),
      Row(
        children: [
          Expanded(child: _socialBtn("Google", 'assets/icons/google_svg.svg', OAuthProvider.google)),
          const Gap(15),
          Expanded(child: _socialBtn("LinkedIn", 'assets/icons/Linkedin.svg', OAuthProvider.linkedin)),
        ],
      ),
    ],
  );

  Widget _socialBtn(String label, String iconPath, OAuthProvider provider) => OutlinedButton(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12),
      side: const BorderSide(color: Color(0xFFF1F4F8)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: const Color(0xFFF8F9FB),
    ),
    onPressed: () => _signInWithOAuth(provider),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconPath.endsWith('.svg')
            ? SvgPicture.asset(iconPath, width: 18)
            : Image.asset(iconPath, width: 18),
        const Gap(8),
        Text(label, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    ),
  );
}
