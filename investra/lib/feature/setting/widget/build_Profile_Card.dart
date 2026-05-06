import 'dart:io'; // مهم جداً للتعامل مع الصور من الجهاز
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildProfileCard extends StatelessWidget {
  final String name;
  final String? imageUrl; // رابط الصورة (Network)
  final File? imageFile; // ملف الصورة المختار من المعرض (Local)
  final VoidCallback onEditProfile; // وظيفة الضغط لتغيير الصورة

  const BuildProfileCard({
    super.key,
    required this.name,
    required this.onEditProfile,
    this.imageUrl,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // قسم الصورة مع زر التعديل
          GestureDetector(
            onTap: onEditProfile,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildImageWidget(),
                ),
                // أيقونة التعديل (القلم)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // بيانات المستخدم
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'programmer',
                  style: TextStyle(color: AppColors.gray2Color),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // شارة ELITE FOUNDER
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.submissionColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'ELITE FOUNDER',
                    style: TextStyle(
                      color: AppColors.darkGray,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لاختيار مصدر الصورة الصحيح
  Widget _buildImageWidget() {
    const double size = 80;
    const String placeholder =
        'https://i.pinimg.com/736x/a4/be/2d/a4be2d9b169649eae96098785afad294.jpg';

    if (imageFile != null) {
      // إذا اختار المستخدم صورة من المعرض
      return Image.file(
        imageFile!,
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    } else {
      // إذا كان يستخدم رابطاً أو الصورة الافتراضية
      return Image.network(
        (imageUrl != null && imageUrl!.isNotEmpty) ? imageUrl! : placeholder,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: size,
          height: size,
          color: AppColors.gray2Color,
          child: const Icon(Icons.person, color: Colors.white),
        ),
      );
    }
  }
}
