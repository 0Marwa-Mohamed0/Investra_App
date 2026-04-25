import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';

class MessageInputBar extends StatelessWidget {
  const MessageInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onAttachment,
    this.onDocument,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onAttachment;
  final VoidCallback? onDocument;

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
                    suffixIcon: IconButton(
                      onPressed: onDocument,
                      icon: CustomSvgPicture(
                        path: AppImages.documentSvg,
                        color: AppColors.grayColor,
                        width: 20,
                        height: 20,
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
