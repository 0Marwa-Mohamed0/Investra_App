import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investra/core/styles/colors.dart';

class ChatAttachmentBottomSheet extends StatelessWidget {
  const ChatAttachmentBottomSheet({
    super.key,
    required this.onDocumentTap,
    required this.onImageTap,
    required this.onNdaTap,
  });

  final Future<void> Function() onDocumentTap;
  final Future<void> Function() onImageTap;
  final Future<void> Function() onNdaTap;

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return ChatAttachmentBottomSheet(
          onDocumentTap: () async {
            Navigator.of(sheetContext).pop();
            await pickDocument(context);
          },
          onImageTap: () async {
            Navigator.of(sheetContext).pop();
            await _pickImageFromGallery(context);
          },
          onNdaTap: () async {
            Navigator.of(sheetContext).pop();
            _onNdaClicked();
          },
        );
      },
    );
  }

  /// Shared document picker (same flow as the attachment sheet "Document" action).
  static Future<void> pickDocument(
    BuildContext context, {
    void Function(String fileName)? onFilePicked,
  }) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.isEmpty) return;

    final selectedFile = result.files.single;
    if (!context.mounted) return;

    onFilePicked?.call(selectedFile.name);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected document: ${selectedFile.name}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static Future<void> _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected image: ${image.name}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void _onNdaClicked() {
    debugPrint('NDA Clicked');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF1B2635) : AppColors.bgColor;
    final tileColor = isDark
        ? const Color(0xFF233144)
        : AppColors.secondary2Color;
    final titleColor = theme.colorScheme.onSurface;
    final subtitleColor = theme.colorScheme.onSurface.withValues(alpha: 0.65);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Material(
          color: surfaceColor,
          elevation: 16,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 18),
                _AttachmentActionTile(
                  icon: Icons.description_outlined,
                  title: 'Document',
                  subtitle: 'Pick any file from your device',
                  iconColor: const Color(0xFF3B82F6),
                  tileColor: tileColor,
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                  onTap: onDocumentTap,
                ),
                const SizedBox(height: 12),
                _AttachmentActionTile(
                  icon: Icons.photo_library_outlined,
                  title: 'Images',
                  subtitle: 'Choose a photo from gallery',
                  iconColor: const Color(0xFF10B981),
                  tileColor: tileColor,
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                  onTap: onImageTap,
                ),
                const SizedBox(height: 12),
                _AttachmentActionTile(
                  icon: Icons.assignment_outlined,
                  title: 'Contract (NDA)',
                  subtitle: 'Share NDA details',
                  iconColor: const Color(0xFFF59E0B),
                  tileColor: tileColor,
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                  onTap: onNdaTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AttachmentActionTile extends StatelessWidget {
  const _AttachmentActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.tileColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color tileColor;
  final Color titleColor;
  final Color subtitleColor;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: tileColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 23),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: subtitleColor,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, size: 22, color: subtitleColor),
            ],
          ),
        ),
      ),
    );
  }
}
