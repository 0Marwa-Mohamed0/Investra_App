import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/screens/investorHome.dart';

import 'package:investra/feature/setting/screen/unified_settings_screen.dart';
import 'package:investra/feature/aiChatbot/aiChatbot.dart';

import '../../features/messages/presentation/pages/messages_list_screen.dart';

class MainAppInvestorScreen extends StatefulWidget {
  const MainAppInvestorScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppInvestorScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppInvestorScreen> {
  int currentIndex = 0;
  bool _isVisible = true;
  late ScrollController _scrollController;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _scrollController = ScrollController();

    screens = [
      InvestorHomePage(scrollController: _scrollController),
      AiChatbotScreen(
        onScroll: (visible) {
          if (_isVisible != visible) setState(() => _isVisible = visible);
        },
      ),
      const MessagesListScreen(),
      UnifiedSettingsScreen(scrollController: _scrollController),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse) {
            if (_isVisible) setState(() => _isVisible = false);
          } else if (notification.direction == ScrollDirection.forward) {
            if (!_isVisible) setState(() => _isVisible = true);
          }
          return true;
        },
        child: IndexedStack(index: currentIndex, children: screens),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isVisible
            ? (kBottomNavigationBarHeight +
            MediaQuery.of(context).padding.bottom)
            : 0,
        child: Wrap(
          children: [_bottomNavBar()],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          _isVisible = true;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayColor,
      elevation: 10,
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.aichatbotSvg,
            color: AppColors.primaryColor,
          ),
          label: 'AI Chatbot',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.chatSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.chatSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
