import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';

// ── ملف/صورة جاهزة للإرسال (قبل الرفع لـ Supabase) ─────────────────────────
enum PendingAttachmentType { image, document }

class PendingAttachment {
  const PendingAttachment._({
    required this.type,
    this.file,
    this.bytes,
    this.fileName,
  });

  final PendingAttachmentType type;
  final File? file;
  final Uint8List? bytes;
  final String? fileName;

  factory PendingAttachment.image({required File file}) {
    return PendingAttachment._(
      type: PendingAttachmentType.image,
      file: file,
    );
  }

  factory PendingAttachment.document({
    required Uint8List bytes,
    required String fileName,
  }) {
    return PendingAttachment._(
      type: PendingAttachmentType.document,
      bytes: bytes,
      fileName: fileName,
    );
  }
}

class MessageInputBar extends StatelessWidget {
  const MessageInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onAttachment,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onAttachment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 0,
      color: AppColors.bgColor,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onAttachment,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.secondary1Color,
                  foregroundColor: AppColors.primaryColor,
                ),
                icon: CustomSvgPicture(
                  path: AppImages.addSvg,
                  color: AppColors.primaryColor,
                  width: 22,
                  height: 22,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  style: theme.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondary2Color,
                    hintText: 'Type a message...',
                    hintStyle: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.gray2Color,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(color: AppColors.bgGray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(color: AppColors.bgGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Material(
                color: AppColors.primaryColor,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onSend,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomSvgPicture(
                      path: AppImages.sendSvg,
                      color: AppColors.bgColor,
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}