import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/presentation/pages/chat_screen.dart';
import 'package:investra/features/messages/presentation/widgets/message_tile.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  State<MessagesListScreen> createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  final _service = ChatSupabaseService();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  Timer? _searchDebounce;
  Timer? _realtimeDebounce;
  String _searchQuery = '';
  List<ChatContact> _allContacts = [];
  bool _loading = true;

  // ✅ Stream subscription على جدول message
  StreamSubscription<List<Map<String, dynamic>>>? _streamSub;

  // ─────────────────────────────────────────────────────────────────────────
  @override
  void initState() {
    super.initState();
    _loadChats();
    _startStream();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _realtimeDebounce?.cancel();
    _streamSub?.cancel();
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  // ── جلب القائمة من Supabase ───────────────────────────────────────────────
  Future<void> _loadChats() async {
    try {
      final contacts = await _service.fetchChats();
      if (mounted) {
        setState(() {
          _allContacts = contacts;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _loading = false);
    }
  }

  // ✅ .stream() على جدول message
  // بيتحدث تلقائياً عند أي INSERT (رسالة جديدة) أو UPDATE (is read اتغير)
  // → نعمل _loadChats() بـ debounce عشان نحدث الـ unreadCount
  void _startStream() {
    _streamSub = _service.streamAllMessages().listen((_) {
      _realtimeDebounce?.cancel();
      _realtimeDebounce =
          Timer(const Duration(milliseconds: 400), _loadChats);
    });
  }

  // ── فلترة وترتيب ─────────────────────────────────────────────────────────
  List<ChatContact> _filterAndSort(List<ChatContact> contacts) {
    final q = _searchQuery.trim().toLowerCase();
    final filtered = q.isEmpty
        ? List<ChatContact>.from(contacts)
        : contacts.where((c) {
      return c.fullName.toLowerCase().contains(q) ||
          c.lastMessagePreview.toLowerCase().contains(q);
    }).toList();

    filtered.sort((a, b) {
      final timeA = a.lastMessageTime ?? DateTime(2000);
      final timeB = b.lastMessageTime ?? DateTime(2000);
      return timeB.compareTo(timeA);
    });

    return filtered;
  }

  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final visible = _filterAndSort(_allContacts);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'MESSAGES',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Search Bar ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.58),
                  width: 1.6,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                focusNode: _searchFocus,
                controller: _searchController,
                cursorColor: theme.colorScheme.primary,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.blackColor),
                onChanged: (value) {
                  _searchDebounce?.cancel();
                  _searchDebounce =
                      Timer(const Duration(milliseconds: 320), () {
                        if (mounted) {
                          setState(
                                  () => _searchQuery = _searchController.text);
                        }
                      });
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.bgColor,
                  hintText: 'Search messages or people',
                  hintStyle: theme.textTheme.bodySmall
                      ?.copyWith(color: AppColors.gray2Color),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: CustomSvgPicture(
                      path: AppImages.searchSvg,
                      color: AppColors.grayColor,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.8,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── قائمة الشاتات ──────────────────────────────────────────────
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : visible.isEmpty
                ? Center(
              child: Text(
                'No matches',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.gray2Color,
                ),
              ),
            )
                : RefreshIndicator(
              onRefresh: _loadChats,
              child: ListView.separated(
                padding:
                const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: visible.length,
                separatorBuilder: (_, __) =>
                const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final c = visible[index];
                  return MessageTile(
                    contact: c,
                    lastMessagePreview: c.lastMessagePreview,
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => ChatScreen(user: c),
                        ),
                      );
                      // ✅ بعد الرجوع مباشرة → أعد التحميل
                      _loadChats();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}