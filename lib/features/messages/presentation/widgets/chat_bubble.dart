import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    this.showPeerAvatar = true,
    this.peerAvatarUrl,
    this.peerInitial,
    this.onSignNda,
  });

  final ChatMessage message;
  final bool showPeerAvatar;
  final String? peerAvatarUrl;
  final String? peerInitial;
  // ✅ callback لما الإنفستور يضغط Sign NDA
  final VoidCallback? onSignNda;

  @override
  Widget build(BuildContext context) {
    final isOutgoing = message.isFromUser;

    // ✅ لو رسالة NDA، نعرض bubble خاص
    if (message.isNda) {
      return _NdaBubble(
        isOutgoing: isOutgoing,
        timeLabel: message.timeLabel,
        isRead: message.isRead,
        onSignNda: onSignNda,
        showPeerAvatar: showPeerAvatar,
        peerAvatarUrl: peerAvatarUrl,
        peerInitial: peerInitial,
      );
    }

    // رسالة نصية عادية
    final theme = Theme.of(context);

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
      ),
      child: Column(
        crossAxisAlignment:
        isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: isOutgoing
                  ? AppColors.primaryColor
                  : AppColors.secondary1Color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isOutgoing ? 18 : 4),
                bottomRight: Radius.circular(isOutgoing ? 4 : 18),
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                message.text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color:
                  isOutgoing ? AppColors.bgColor : AppColors.blackColor,
                  height: 1.35,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.timeLabel,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.gray2Color,
                  fontSize: 11,
                ),
              ),
              if (isOutgoing) ...[
                const SizedBox(width: 4),
                Icon(
                  message.isRead ? Icons.done_all : Icons.done,
                  size: 16,
                  color: message.isRead
                      ? const Color(0xFF34B7F1)
                      : AppColors.gray2Color,
                ),
              ],
            ],
          ),
        ],
      ),
    );

    if (isOutgoing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [bubble],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showPeerAvatar) ...[
            _SmallAvatar(avatarUrl: peerAvatarUrl, label: peerInitial),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 36),
          bubble,
        ],
      ),
    );
  }
}


class _NdaBubble extends StatelessWidget {
  const _NdaBubble({
    required this.isOutgoing,
    required this.timeLabel,
    required this.isRead,
    required this.onSignNda,
    required this.showPeerAvatar,
    this.peerAvatarUrl,
    this.peerInitial,
  });

  final bool isOutgoing;
  final String timeLabel;
  final bool isRead;
  final VoidCallback? onSignNda;
  final bool showPeerAvatar;
  final String? peerAvatarUrl;
  final String? peerInitial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
      ),
      child: Column(
        crossAxisAlignment:
        isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isOutgoing
                  ? AppColors.primaryColor.withOpacity(0.12)
                  : AppColors.secondary1Color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isOutgoing ? 18 : 4),
                bottomRight: Radius.circular(isOutgoing ? 4 : 18),
              ),
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.35),
                width: 1.2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.assignment_outlined,
                        color: Color(0xFFF59E0B),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NDA Agreement',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          'Non-Disclosure Agreement',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.gray2Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ✅ زر Sign NDA يظهر بس للإنفستور (incoming)
                if (!isOutgoing && onSignNda != null) ...[
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onSignNda,
                      icon: const Icon(Icons.draw_outlined,
                          size: 16, color: Colors.white),
                      label: const Text(
                        'Sign NDA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
                // ✅ للإنتريبرينور يظهر "Pending signature"
                if (isOutgoing) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.hourglass_empty_rounded,
                          size: 13, color: Color(0xFFF59E0B)),
                      const SizedBox(width: 4),
                      Text(
                        'Pending investor signature',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: const Color(0xFFF59E0B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeLabel,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.gray2Color,
                  fontSize: 11,
                ),
              ),
              if (isOutgoing) ...[
                const SizedBox(width: 4),
                Icon(
                  isRead ? Icons.done_all : Icons.done,
                  size: 16,
                  color: isRead
                      ? const Color(0xFF34B7F1)
                      : AppColors.gray2Color,
                ),
              ],
            ],
          ),
        ],
      ),
    );

    if (isOutgoing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [bubble],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showPeerAvatar) ...[
            _SmallAvatar(avatarUrl: peerAvatarUrl, label: peerInitial),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 36),
          bubble,
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

class _SmallAvatar extends StatelessWidget {
  const _SmallAvatar({this.avatarUrl, this.label});

  final String? avatarUrl;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: AppColors.bgGray,
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      child: avatarUrl == null
          ? Text(
        (label != null && label!.isNotEmpty)
            ? label![0].toUpperCase()
            : '?',
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      )
          : null,
    );
  }
}

class ProjectTopicBanner extends StatelessWidget {
  const ProjectTopicBanner({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: AppColors.secondary1Color,
      child: Row(
        children: [
          CustomSvgPicture(
            path: AppImages.idea2Svg,
            color: AppColors.primaryColor,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatDatePill extends StatelessWidget {
  const ChatDatePill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.bgGray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.darkGray,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}