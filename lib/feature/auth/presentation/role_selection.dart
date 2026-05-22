import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import '../data/auth_service.dart';
import 'widgets/account_type_toggle.dart';
import 'package:investra/feature/main_app/mainAppEnterpreneur.dart';
import 'package:investra/feature/main_app/mainAppInvestor.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedType = "Investor";
  final _authService = AuthService();
  bool _isLoading = false;

  Future<void> _completeRegistration() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      final String fullName = user.userMetadata?['full_name'] ?? user.userMetadata?['name'] ?? 'Google User';
      final String email = user.email ?? '';

      await _authService.createUserRecord(
        userId: user.id,
        name: fullName,
        email: email,
        role: selectedType,
      );

      if (mounted) {
        _showSnackBar('Account setup completed successfully!', AppColors.green1Color);
        _navigateBasedOnRole(selectedType);
      }
    } catch (error) {
      _showSnackBar('Error saving account profile: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _navigateBasedOnRole(String role) {
    final Widget nextScreen = (role == 'Investor') ? const MainAppInvestorScreen() : const MainAppEnterpreneurScreen();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
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
        title: const Text("Complete Your Profile", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "One Last Step!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.blackColor),
              ),
              const Gap(10),
              const Text(
                "Please select your account type to personalize your Investra experience.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grayColor, fontSize: 14, height: 1.5),
              ),
              const Gap(40),
              const Text("Account Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.grayColor)),
              const Gap(8),
              AccountTypeToggle(
                selectedType: selectedType,
                onTypeChanged: (type) => setState(() => selectedType = type),
              ),
              const Gap(40),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _completeRegistration,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Get Started", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}