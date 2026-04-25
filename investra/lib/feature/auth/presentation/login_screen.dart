import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E4D7B)), 
          onPressed: () => Navigator.pop(context)
        ),
        title: const Text("Investra", 
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Color(0xFF1E4D7B), letterSpacing: 1.5)),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight - MediaQuery.of(context).padding.top - kToolbarHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Gap(50),
                    const Text("Welcome Back", 
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66), fontFamily: 'DMSerif')),
                    const Gap(10),
                    const Text("Manage your portfolio and track\ninvestments", 
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5)),
                    const Gap(50),
                    // Email Field
                    _buildLabel("Email Address"),
                    const Gap(8),
                    _buildTextField("name@example.com", Icons.email_outlined),
                    const Gap(25),
                    // Password Field
                    _buildLabel("Password"),
                    const Gap(8),
                    _buildTextField("********", Icons.lock_outline, isPass: true),
                    // Forgot Password below the field
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?", 
                          style: TextStyle(color: Color(0xFF1E4D7B), fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Gap(30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E4D7B), 
                        minimumSize: const Size(double.infinity, 60), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        shadowColor: const Color(0xFF1E4D7B).withValues(alpha: 0.3),
                      ),
                      onPressed: () {},
                      child: const Text("Log In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    const Gap(40),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("OR CONTINUE WITH", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Gap(30),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60), 
                        side: const BorderSide(color: Color(0xFFF1F4F8)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color(0xFFF8F9FB),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/google_svg.svg', width: 24),
                          const Gap(15),
                          const Text("Google", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? ", style: TextStyle(color: Colors.grey, fontSize: 14)),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen())),
                          child: const Text("Sign up for free", style: TextStyle(color: Color(0xFF1E4D7B), fontWeight: FontWeight.bold, fontSize: 14)),
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
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E4D7B))),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isPass = false}) {
    return TextField(
      obscureText: isPass, 
      decoration: InputDecoration(
        hintText: hint, 
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        filled: true,
        fillColor: const Color(0xFFF8F9FB),
        prefixIcon: Icon(icon, color: Colors.grey, size: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFF1F4F8))),
        suffixIcon: isPass ? const Icon(Icons.visibility_off_outlined, color: Colors.grey, size: 20) : null,
      )
    );
  }
}
