import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../widgets/build_icon_container.dart';

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
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
            const SizedBox(height: 30),

            const Text(
              "Top Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFAQExpandable(
              "How do I publish my idea?",
              "Create an idea profile and upload the required business documents.",
            ),
            _buildFAQExpandable(
              "Can investors view my documents?",
              "Only after approval and NDA completion, if required.",
            ),
            _buildFAQExpandable(
              "How does AI help investors?",
              "AI provides idea assessments and insights to support investment decisions.",
            ),
            _buildFAQExpandable(
              "Is my information secure?",
              "Yes, Investra uses secure authentication, protected storage, and controlled document access.",
            ),
            const SizedBox(height: 35),

            const Text(
              "Contact Us Directly",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildContactOption(
              icon: Icons.mail_outline_rounded,
              title: "Email Us",
              trailingText: "investraSupport@gmail.com",
            ),
            _buildContactOption(
              icon: Icons.phone_outlined,
              title: "Phone",
              trailingText: "1779",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

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
