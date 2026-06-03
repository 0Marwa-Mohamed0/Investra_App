import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';
import 'package:investra/features/messages/domain/entities/chat_thread_item.dart';
import 'package:investra/features/messages/presentation/widgets/chat_bubble.dart';
import 'package:investra/features/messages/presentation/widgets/chat_attachment_bottom_sheet.dart';
import 'package:investra/features/messages/presentation/widgets/message_input_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});

  final ChatContact user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  final ChatSupabaseService _service = ChatSupabaseService();

  late List<ChatThreadItem> _items;
  bool _showJumpToLatest = false;
  bool _loading = true;

  // ✅ عداد الرسائل الجديدة للـ Jump button
  int _newMessageCount = 0;

  RealtimeChannel? _channel;

  ChatContact get _user => widget.user;

  // ─────────────────────────────────────────────────────────────────────────
  @override
  void initState() {
    super.initState();
    _items = [];
    _scrollController.addListener(_handleScroll);
    _loadMessages();
    _subscribeRealtime();

    // ✅ علّم الرسائل كمقروءة فور دخول الشاشة
    _service.markMessagesAsRead(_user.id);
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // ── تحميل الرسائل من Supabase ────────────────────────────────────────────
  Future<void> _loadMessages() async {
    try {
      final msgs = await _service.fetchMessages(_user.id);
      if (!mounted) return;

      final List<ChatThreadItem> items = [];
      String? lastDate;

      for (final msg in msgs) {
        const dateLabel = 'TODAY';
        if (lastDate != dateLabel) {
          items.add(const ChatDateSeparatorItem(dateLabel));
          lastDate = dateLabel;
        }
        items.add(ChatMessageItem(msg));
      }

      setState(() {
        _items = items;
        _loading = false;
      });

      WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(animated: false),
      );
    } catch (e) {
      if (mounted) setState(() => _loading = false);
    }
  }

  // ── ✅ Realtime ────────────────────────────────────────────────────────────
  void _subscribeRealtime() {
    _channel = _service.subscribeToMessages(
      chatId: _user.id,

      // رسالة جديدة وصلت من الطرف التاني
      onNewMessage: (msg) {
        if (!mounted) return;

        // لو الرسالة مني أنا → مش محتاج نضيفها تاني (optimistic UI بالفعل ضافها)
        if (msg.isFromUser) return;

        // ✅ علّمها كمقروءة فوراً لأني داخل الشاشة
        _service.markMessagesAsRead(_user.id);

        setState(() {
          _items.add(ChatMessageItem(msg));
          // لو المستخدم مش في الأسفل → زوّد العداد
          if (_showJumpToLatest) _newMessageCount++;
        });

        // لو كان في الأسفل → اسكرول أوتوماتيك
        if (!_showJumpToLatest) {
          WidgetsBinding.instance.addPostFrameCallback(
                (_) => _scrollToBottom(animated: true),
          );
        }
      },

      // ✅ تحديث حالة القراءة — الطرف التاني فتح الشات وقرأ رسائلي
      onMessageRead: (messageId, isRead) {
        if (!mounted) return;
        setState(() {
          for (int i = 0; i < _items.length; i++) {
            final item = _items[i];
            if (item is ChatMessageItem &&
                item.message.id == messageId &&
                item.message.isFromUser) {
              // ✅ حوّل علامة الصح الواحدة لعلامتين
              _items[i] =
                  ChatMessageItem(item.message.copyWith(isRead: true));
            }
          }
        });
      },
    );
  }

  // ── scroll helpers ────────────────────────────────────────────────────────
  void _handleScroll() {
    if (!_scrollController.hasClients) return;
    final p = _scrollController.position;
    final atBottom = p.pixels >= p.maxScrollExtent - 48;
    final show = !atBottom;
    if (show != _showJumpToLatest) {
      setState(() {
        _showJumpToLatest = show;
        // لو رجع للأسفل → صفّر العداد
        if (!show) _newMessageCount = 0;
      });
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
    setState(() => _newMessageCount = 0);
  }

  // ── إرسال رسالة ──────────────────────────────────────────────────────────
  Future<void> _send() async {
    final t = _messageController.text.trim();
    if (t.isEmpty) return;

    _messageController.clear();

    // Optimistic UI — أضف الرسالة فوراً
    final optimisticMsg = ChatMessage(
      id: 'local_${DateTime.now().microsecondsSinceEpoch}',
      text: t,
      isFromUser: true,
      timeLabel: _timeNow(),
      isRead: false,
    );

    setState(() => _items.add(ChatMessageItem(optimisticMsg)));
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _scrollToBottom(animated: true),
    );

    try {
      await _service.sendMessage(chatId: _user.id, text: t);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل الإرسال: $e')),
        );
      }
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

  // ─────────────────────────────────────────────────────────────────────────
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
                    _user.roleSubtitle.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary.withOpacity(0.75),
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
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
              clipBehavior: Clip.none,
              children: [
                // ── قائمة الرسائل ─────────────────────────────────
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

                // ✅ زرار "اسكرول للأسفل" مع عداد الرسائل الجديدة
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
                          onTap: () => _scrollToBottom(),
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
                                  _newMessageCount > 0
                                      ? '$_newMessageCount New Message${_newMessageCount > 1 ? 's' : ''}'
                                      : 'Jump to latest',
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(
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
            onAttachment: () => ChatAttachmentBottomSheet.show(context),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// PRIVATE WIDGETS (بدون تغيير — نفس الكود القديم)
// ════════════════════════════════════════════════════════════════════════════

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
          backgroundImage:
          imageUrl != null ? NetworkImage(imageUrl!) : null,
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
