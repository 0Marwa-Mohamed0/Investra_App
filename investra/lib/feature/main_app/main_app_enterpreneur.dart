import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/screens/enterepreneur_home.dart';
import 'package:investra/feature/messages/presentation/pages/messages_list_screen.dart';
import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';
import 'package:investra/feature/aiChatbot/ai_chatbot.dart';



class MainAppEnterpreneurScreen extends StatefulWidget {
  const MainAppEnterpreneurScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppEnterpreneurScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppEnterpreneurScreen> {
  int currentIndex = 0;
  late ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _scrollController = ScrollController();

    // إضافة الـ Listener لمراقبة اتجاه السكرول
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // المستخدم ينزل لأسفل -> نخفي الشريط
        if (_isVisible) {
          setState(() => _isVisible = false);
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // المستخدم يطلع لأعلى -> نظهر الشريط
        if (!_isVisible) {
          setState(() => _isVisible = true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تحديث القائمة لضمان استلام الـ controller
    final List<Widget> screens = [
      EntrepreneurHomePage(scrollController: _scrollController),
      AiChatbotScreen(onScroll: (visible) {
        if (_isVisible != visible) setState(() => _isVisible = visible);
      }),
      const MessagesListScreen(),
      SettingsScreen(scrollController: _scrollController),
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      // استخدام IndexedStack للحفاظ على حالة الصفحات
      body: IndexedStack(index: currentIndex, children: screens),

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
