import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/messages/data/messages_mock_data_source.dart';
import 'package:investra/feature/messages/domain/entities/chat_contact.dart';
import 'package:investra/feature/messages/domain/entities/chat_message.dart';
import 'package:investra/feature/messages/domain/entities/chat_thread_item.dart';
import 'package:investra/feature/messages/presentation/widgets/chat_bubble.dart';
import 'package:investra/feature/messages/presentation/widgets/message_input_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});

  final ChatContact user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  late List<ChatThreadItem> _items;
  bool _showJumpToLatest = false;

  ChatContact get _user => widget.user;

  @override
  void initState() {
    super.initState();
    _items = List<ChatThreadItem>.of(
      MessagesMockDataSource.initialThreadFor(_user.id),
    );
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToBottom(animated: false),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) return;
    final p = _scrollController.position;
    final atBottom = p.pixels >= p.maxScrollExtent - 48;
    final show = !atBottom;
    if (show != _showJumpToLatest) {
      setState(() => _showJumpToLatest = show);
    }
  }

  void _scrollToBottom({bool animated = true}) {
    if (!_scrollController.hasClients) return;
    final target = _scrollController.position.maxScrollExtent;
    if (animated) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
      );
    } else {
      _scrollController.jumpTo(target);
    }
  }

  String _timeNow() {
    final t = DateTime.now();
    final h24 = t.hour;
    final m = t.minute;
    final h12 = h24 == 0
        ? 12
        : h24 > 12
        ? h24 - 12
        : h24;
    final ampm = h24 < 12 ? 'AM' : 'PM';
    return '$h12:${m.toString().padLeft(2, '0')} $ampm';
  }

  void _send() {
    final t = _messageController.text.trim();
    if (t.isEmpty) return;
    final sentAt = _timeNow();

    MessagesMockDataSource.appendUserMessage(
      contactId: _user.id,
      text: t,
      timeLabel: sentAt,
    );

    setState(() {
      _messageController.clear();
      _items.add(
        ChatMessageItem(
          ChatMessage(
            id: 'm_${DateTime.now().microsecondsSinceEpoch}_local',
            text: t,
            isFromUser: true,
            timeLabel: sentAt,
            isRead: true,
          ),
        ),
      );
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(animated: true);
      if (_showJumpToLatest) {
        setState(() => _showJumpToLatest = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topic = _user.topicLabel != null
        ? 'Regarding project: ${_user.topicLabel}'
        : 'Regarding project: Active conversation';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: CustomSvgPicture(
            path: AppImages.backSvg,
            color: theme.colorScheme.primary,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Row(
          children: [
            _HeaderAvatar(
              imageUrl: _user.avatarUrl,
              isOnline: _user.isOnline,
              name: _user.fullName,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _user.fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _user.roleSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary.withValues(alpha: 0.75),
                      letterSpacing: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(
              path: AppImages.videoSvg,
              color: AppColors.grayColor,
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(
              path: AppImages.infoOutlineSvg,
              color: AppColors.grayColor,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ProjectTopicBanner(text: topic),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    if (item is ChatDateSeparatorItem) {
                      return ChatDatePill(label: item.label);
                    }
                    if (item is ChatMessageItem) {
                      return ChatBubble(
                        message: item.message,
                        showPeerAvatar: !item.message.isFromUser,
                        peerAvatarUrl: _user.avatarUrl,
                        peerInitial: _user.fullName,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                if (_showJumpToLatest)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 12,
                    child: Center(
                      child: Material(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: InkWell(
                          onTap: _scrollToBottom,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.bgColor,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '1 New Message',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppColors.bgColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          MessageInputBar(
            controller: _messageController,
            onSend: _send,
            onAttachment: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Attachment')));
            },
            onDocument: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Document')));
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({
    required this.imageUrl,
    required this.isOnline,
    required this.name,
  });

  final String? imageUrl;
  final bool isOnline;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.bgGray,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.green1Color,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
