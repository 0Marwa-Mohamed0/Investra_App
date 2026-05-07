import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/feature/notification/view/notifications_screen.dart';
import 'package:investra/feature/auth/presentation/login_screen.dart';


import 'ChangePassword.dart';
import '../widget/BuildProfileCard.dart';
import '../widget/BuildProgressCard.dart';
import '../widget/BuildSectionTitle.dart';
import '../widget/BuildSettingsItem.dart';
import '../widget/BuildSettingToggle.dart';

class UnifiedSettingsScreen extends StatefulWidget {
  final ScrollController scrollController;
  const UnifiedSettingsScreen({super.key, required this.scrollController});

  @override
  State<UnifiedSettingsScreen> createState() => _UnifiedSettingsScreenState();
}

class _UnifiedSettingsScreenState extends State<UnifiedSettingsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  Map<String, dynamic>? _userData;
  String? _profileImageUrl;
  int _usedIdeas = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final uid = _supabase.auth.currentUser?.id;
      if (uid == null) return;

      final userDoc = await _supabase.from('User').select('role, FullName, email').eq('userid', uid).maybeSingle();

      final profileDoc = await _supabase.from('profile').select('profile_picture, bio').eq('userid', uid).maybeSingle();


      final ideasResponse = await _supabase.from('ideas').select('id').eq('entrepreneur_id', uid);
      final int actualCount = (ideasResponse as List).length;

      if (mounted) {
        setState(() {
          _userData = userDoc;
          if (_userData != null && profileDoc != null) {
            _userData!['bio'] = profileDoc['bio'];
          }
          _profileImageUrl = profileDoc?['profile_picture'];
          _usedIdeas = actualCount;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Fetch Error: $e");
      if (mounted) setState(() => _isLoading = false);
    }
  }


  Future<void> _showImageOptions() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppColors.primaryColor),
              title: const Text("Upload New Picture"),
              onTap: () {
                Navigator.pop(context);
                _uploadProfilePicture();
              },
            ),
            if (_profileImageUrl != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text("Delete Picture", style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await _deleteProfilePicture();
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteProfilePicture() async {
    setState(() => _isLoading = true);
    try {
      final uid = _supabase.auth.currentUser!.id;
      await _supabase.from('profile').update({'profile_picture': null}).eq('userid', uid);
      setState(() {
        _profileImageUrl = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint("Delete Error: $e");
    }
  }

  Future<void> _uploadProfilePicture() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return;

    setState(() => _isLoading = true);
    try {
      final file = File(image.path);
      final uid = _supabase.auth.currentUser!.id;
      final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.png';
      final filePath = '$uid/$fileName';

      await _supabase.storage.from('profiles').upload(filePath, file);
      final publicUrl = _supabase.storage.from('profiles').getPublicUrl(filePath);
      final finalUrl = "$publicUrl?t=${DateTime.now().millisecondsSinceEpoch}";

      await _supabase.from('profile').upsert({
        'userid': uid,
        'profile_picture': finalUrl,
      }, onConflict: 'userid');

      if (mounted) {
        setState(() {
          _profileImageUrl = finalUrl;
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile picture updated!")));
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload failed: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }


    final role = _userData?['role']?.toString() ?? 'User';
    final name = _userData?['FullName']?.toString() ?? 'Investra Member';
    final bio = _userData?['bio']?.toString() ?? _userData?['email']?.toString() ?? "Member";
    final bool isEntrepreneur = role.toLowerCase() == 'entrepreneur';

    return Column(
      children: [

        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          title: const Text(' INVESTRA', style: TextStyle(color: AppColors.primaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
          actions: [
            _buildNotificationIcon(),
            const SizedBox(width: 16),
          ],
        ),


        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [

                BuildProfileCard(
                  name: name,
                  role: role,
                  bio: bio,
                  imageUrl: _profileImageUrl,
                  onEditProfile: _showImageOptions,
                ),
                const SizedBox(height: 24),

                if (isEntrepreneur) ...[
                  BuildProgressCard(
                    usedIdeas: _usedIdeas,
                    totalLimit: 2,
                  ),
                  const SizedBox(height: 24),
                ],

                const BuildSectionTitle(title: 'SECURITY'),
                BuildSettingsItem(
                  icon: const Icon(Icons.lock_outline, color: AppColors.primaryColor),
                  title: 'Change Password',
                  subtitle: 'Update your security credentials',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                    );
                  },
                ),

                const SizedBox(height: 24),


                const BuildSectionTitle(title: 'PREFERENCES'),
                CustomSettingsToggle(
                  icon: const Icon(Icons.notifications_active_outlined, color: AppColors.primaryColor),
                  title: 'Push Notifications',
                  subtitle: 'Alerts for your account activity',
                  value: true,
                  onChanged: (val) {},
                ),

                const SizedBox(height: 40),


                _buildLogoutButton(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildNotificationIcon() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase.from('notifications').stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        final userId = _supabase.auth.currentUser?.id;
        final unread = snapshot.data?.where((n) => n['user_id'] == userId && n['is_read'] == false).toList() ?? [];
        return Stack(
          children: [
            IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
              icon: SvgPicture.asset(AppImages.notificationSvg, colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
            ),
            if (unread.isNotEmpty)
              Positioned(
                right: 12,
                top: 12,
                child: Container(width: 9, height: 9, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
              ),
          ],
        );
      },
    );
  }


  Widget _buildLogoutButton() {
    return TextButton.icon(
      onPressed: () async {
        await _supabase.auth.signOut();
        if (mounted) {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
          );
        }
      },
      icon: const Icon(Icons.logout, color: AppColors.errorColor),
      label: const Text("Sign Out", style: TextStyle(color: AppColors.errorColor, fontWeight: FontWeight.bold)),
    );
  }
}