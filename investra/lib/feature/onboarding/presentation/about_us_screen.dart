import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E4D7B)),
          onPressed: () => Navigator.pop(context),
        ),
        // Larger AppBar Title
        title: Text(_currentPage == 0 ? "MISSION & STORY" : "VALUES", 
          style: const TextStyle(color: Color(0xFF1E4D7B), letterSpacing: 2, fontSize: 16, fontWeight: FontWeight.w900)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: [
                _buildMissionStoryPage(),
                _buildValuesPage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? const Color(0xFF1E4D7B) : const Color(0xFF1E4D7B).withValues(alpha: 0.2),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionStoryPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(15),
          // Our Mission Card
          _infoCard("Our Mission", 
            "Our mission is to empower entrepreneurs by providing a secure and intelligent platform that connects innovative ideas with the right investors. We aim to simplify the investment journey, enhance trust between users, and support the growth of impactful projects through technology and collaboration.",
            isPrimary: true),
          const Gap(25),
          // Our Story Card - Now matches Mission shape
          _infoCard("Our Story", 
            "Every great idea deserves a chance. Investra began as a graduation project driven by one belief: too many powerful ideas are left behind, not because they lack potential, but because they lack the right connections.\n\nWe set out to change that. By bringing entrepreneurs and investors together in one smart, secure space, Investra turns missed opportunities into real collaborations. What started as a student project is now a vision—to unlock innovation, fuel ambition, and help ideas grow into something bigger.",
            isPrimary: false),
          const Gap(40),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String content, {required bool isPrimary}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF1E4D7B) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isPrimary ? 0.2 : 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, 
            style: TextStyle(
              color: isPrimary ? Colors.white : const Color(0xFF1E4D7B), 
              fontWeight: FontWeight.bold, 
              fontSize: 26, 
              fontFamily: 'DMSerif'
            )),
          const Gap(15),
          Text(content,
            style: TextStyle(
              color: isPrimary ? Colors.white.withValues(alpha: 0.85) : Colors.black87, 
              fontSize: 14, 
              height: 1.6
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValuesPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(15),
          // Larger Title
          const Text("Our Values", 
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66), fontFamily: 'DMSerif')),
          const Text("The pillars of our culture and product.", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const Gap(40),
          _valueItem(Icons.people_outline, "Collaboration", "Shared success is the core of our ecosystem. We build tools that bridge gaps between minds."),
          _valueItem(Icons.security, "Security", "Trust is earned through transparency and military-grade encryption in every transaction."),
          _valueItem(Icons.lightbulb_outline, "Innovation", "Constant evolution is mandatory. We leverage AI to stay ahead of market shifts."),
          _valueItem(Icons.trending_up, "Growth", "We measure our success by the compounding value we create for our collaborative networks."),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _valueItem(IconData i, String t, String d) => Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(i, color: const Color(0xFF1E4D7B), size: 30),
        const Gap(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0D3B66))),
              const Gap(6),
              Text(d, style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.5)),
            ],
          ),
        ),
      ],
    ),
  );
}
