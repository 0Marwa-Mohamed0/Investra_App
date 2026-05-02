import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/screens/enterepreneur_home.dart';
import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';

class MainAppEnterpreneurScreen extends StatefulWidget {
  const MainAppEnterpreneurScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppEnterpreneurScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppEnterpreneurScreen> {
  int currentIndex = 0;
  late ScrollController _homeScrollController;
  late ScrollController _settingsScrollController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _homeScrollController = ScrollController();
    _settingsScrollController = ScrollController();
  }

  @override
  void dispose() {
    _homeScrollController.dispose();
    _settingsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تحديث القائمة لضمان استلام الـ controller
    final List<Widget> screens = [
      EntrepreneurHomePage(scrollController: _homeScrollController),
      const Center(child: Text("AI Chatbot")),
      const Center(child: Text("Chat")),
      SettingsScreen(scrollController: _settingsScrollController),
    ];

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

      // هنا التعديل الأساسي للحركة
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut, // حركة ناعمة في الدخول والخروج
        height: _isVisible
            ? (kBottomNavigationBarHeight +
                  MediaQuery.of(context).padding.bottom)
            : 0,
        child: Wrap(
          // Wrap يمنع ظهور خطأ المساحة (Overflow) عند وصول الارتفاع لصفر
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
          _isVisible = true; // إظهار الشريط عند التنقل
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayColor,
      elevation: 12, // زيادة الـ elevation ليعطي عمقاً أفضل
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: [
        _buildNavItem(AppImages.homeSvg, 'Home'),
        _buildNavItem(AppImages.aichatbotSvg, 'AI Chatbot'),
        _buildNavItem(AppImages.chatSvg, 'Chat'),
        _buildNavItem(AppImages.profileSvg, 'Profile'),
      ],
    );
  }

  // دالة مساعدة لتنظيف الكود
  BottomNavigationBarItem _buildNavItem(String path, String label) {
    return BottomNavigationBarItem(
      icon: CustomSvgPicture(path: path),
      activeIcon: CustomSvgPicture(path: path, color: AppColors.primaryColor),
      label: label,
    );
  }
}
