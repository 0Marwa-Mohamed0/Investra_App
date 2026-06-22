import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:investra/features/messages/presentation/pages/nda_screen.dart';
import 'package:investra/features/messages/presentation/widgets/message_input_bar.dart';

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

  static Future<void> show(
      BuildContext context, {
        required String chatId,
        required void Function(PendingAttachment) onAttachmentPicked,
      }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return ChatAttachmentBottomSheet(
          onDocumentTap: () async {
            Navigator.of(sheetContext).pop();
            final attachment = await _pickDocument(context);
            if (attachment != null) onAttachmentPicked(attachment);
          },
          onImageTap: () async {
            Navigator.of(sheetContext).pop();
            final attachment = await _pickImage(context);
            if (attachment != null) onAttachmentPicked(attachment);
          },
          onNdaTap: () async {
            Navigator.of(sheetContext).pop();

            final service = ChatSupabaseService();
            final isEntrepreneur = await service.isEntrepreneur();
            if (!context.mounted) return;

            if (isEntrepreneur) {
              try {
                await service.sendNdaRequest(chatId: chatId);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('NDA request sent to investor ✓'),
                      backgroundColor: AppColors.primaryColor,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to send NDA: $e'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              }
            } else {
              await Navigator.of(context).push<bool>(
                MaterialPageRoute(
                  builder: (_) => NdaScreen(chatId: chatId),
                ),
              );
            }
          },
        );
      },
    );
  }

  static Future<PendingAttachment?> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked == null) return null;
    return PendingAttachment.image(file: File(picked.path));
  }

  static Future<PendingAttachment?> _pickDocument(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null || result.files.isEmpty) return null;

    final file = result.files.single;
    if (file.bytes == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not read file'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return null;
    }

    return PendingAttachment.document(
      bytes: file.bytes!,
      fileName: file.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF1B2635) : AppColors.bgColor;
    final tileColor =
    isDark ? const Color(0xFF233144) : AppColors.secondary2Color;
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
                  subtitle: 'Send NDA request to investor',
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