import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../data/profile_model.dart';
import '../logic/profile_logic.dart';
import '../widgets/entrepreneur_view_body.dart';
import '../widgets/investor_view_body.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileLogic _logic = ProfileLogic();
  late Future<ProfileModel?> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = _logic.fetchUserProfile(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'PROFILE',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<ProfileModel?>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Error loading profile.', style: TextStyle(color: AppColors.errorColor)));
          }

          final profile = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.secondary1Color,
                    backgroundImage: profile.profilePicture != null
                        ? NetworkImage(profile.profilePicture!)
                        : const AssetImage('assets/images/profile_placeholder.png') as ImageProvider,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  profile.fullName,
                  style: const TextStyle(color: AppColors.primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  profile.role.toUpperCase(),
                  style: const TextStyle(color: AppColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.2),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    profile.bio != null && profile.bio!.isNotEmpty ? profile.bio! : 'No bio available.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.grayColor, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),

                profile.role == 'Investor'
                    ? InvestorViewBody(profile: profile)
                    : EntrepreneurViewBody(profile: profile, logic: _logic),
              ],
            ),
          );
        },
      ),
    );
  }
}