import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/setting/widget/build_Icon_Container.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor, // استخدام لون الخلفية الموحد للتطبيق
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "How can we help?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 25),

            // قسم الأسئلة الشائعة المدمج (تفتح وتغلق في نفس الصفحة)
            const Text(
              "Top Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFAQExpandable(
              "How do I start investing?",
              "You can start by choosing a project from the marketplace and clicking 'Invest Now'.",
            ),
            _buildFAQExpandable(
              "Is my data secure?",
              "Yes, Investra uses bank-grade encryption to protect your financial and personal data.",
            ),
            _buildFAQExpandable(
              "How to withdraw profits?",
              "Profits can be withdrawn directly to your linked bank account after the project cycle ends.",
            ),

            const SizedBox(height: 35),

            // قسم التواصل المباشر
            const Text(
              "Contact Us Directly",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            _buildContactOption(
              icon: Icons.headset_mic_outlined,
              title: "Live Support",
              trailingText: "Online",
            ),
            _buildContactOption(
              icon: Icons.mail_outline_rounded,
              title: "Email Us",
              trailingText: "support@investra.com",
            ),
            _buildContactOption(
              icon: Icons.phone_outlined,
              title: "Phone",
              trailingText: "+20 123 456 789",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ويدجيت للأسئلة الشائعة التي تفتح في نفس المكان
  Widget _buildFAQExpandable(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        iconColor: AppColors.primaryColor,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              answer,
              style: const TextStyle(color: AppColors.darkGray, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجيت لخيارات التواصل
  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          buildIconContainer(
            icon: Icon(icon, color: AppColors.primaryColor, size: 22),
          ),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          Text(
            trailingText,
            style: const TextStyle(color: AppColors.grayColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
