import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../data/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;
  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        // دائرة الصورة الشخصية مع إطار خفيف احترافي
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.bgGray, width: 2),
          ),
          child: CircleAvatar(
            radius: 54,
            backgroundColor: AppColors.secondary1Color,
            backgroundImage: profile.profilePicture != null && profile.profilePicture!.isNotEmpty
                ? NetworkImage(profile.profilePicture!)
                : const AssetImage('assets/images/default_pfp.png') as ImageProvider,
          ),
        ),
        const SizedBox(height: 12),
        // الاسم بخط عريض وواضح
        Text(
          profile.fullName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontFamily: 'CabinetGrotesk', // أو خط مشروعك الأساسي
          ),
        ),
        const SizedBox(height: 4),
        // الـ Role بحروف كابيتال ولون الـ Primary
        Text(
          profile.role.toUpperCase(),
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 13,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        // البايو الحقيقي بداخل مسافات مريحة للعين
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            profile.bio ?? 'Building the future through innovative tech.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grayColor,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}