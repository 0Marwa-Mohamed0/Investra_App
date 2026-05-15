import 'package:flutter/material.dart';
import '../data/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;
  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundImage: profile.profilePicture != null
              ? NetworkImage(profile.profilePicture!)
              : const AssetImage('assets/images/default_pfp.png') as ImageProvider,
        ),
        const SizedBox(height: 10),
        Text(profile.fullName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(profile.role, style: const TextStyle(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(profile.bio ?? 'No bio available', textAlign: TextAlign.center),
        ),
      ],
    );
  }
}