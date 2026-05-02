import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/screens/investor_home.dart';
import 'package:investra/feature/setting/screen/investor_setting_screen.dart';

class MainAppInvestorScreen extends StatefulWidget {
  const MainAppInvestorScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppInvestorScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppInvestorScreen> {
  int currentIndex = 0;
  bool _isVisible = true;
  late ScrollController _homeScrollController;
  late ScrollController _profileScrollController;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _homeScrollController = ScrollController();
    _profileScrollController = ScrollController();

    screens = [
      InvestorHomePage(scrollController: _homeScrollController),
      const Center(child: Text("Chat")),
      const Center(child: Text("AI Chatbot")),
      AccountScreen(scrollController: _profileScrollController),
    ];
  }

  @override
  void dispose() {
    _homeScrollController.dispose();
    _profileScrollController.dispose();
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
      // استخدام AnimatedSize أو التحكم في الارتفاع مع ClipRect
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isVisible
            ? (kBottomNavigationBarHeight +
                  MediaQuery.of(context).padding.bottom)
            : 0,
        child: Wrap(
          // Wrap يمنع ظهور خطأ المساحة (Overflow) أثناء الاختفاء
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
          _isVisible = true; // تظهر دائماً عند الضغط على أيقونة
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
          icon: CustomSvgPicture(path: AppImages.chatSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.chatSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Chat',
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
