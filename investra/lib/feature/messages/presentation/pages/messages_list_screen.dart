import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/messages/data/messages_mock_data_source.dart';
import 'package:investra/feature/messages/domain/entities/chat_contact.dart'
    show ChatContact;
import 'package:investra/feature/messages/presentation/pages/chat_screen.dart';
import 'package:investra/feature/messages/presentation/widgets/message_tile.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  State<MessagesListScreen> createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  final List<ChatContact> _all = MessagesMockDataSource.allContacts;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  Timer? _debounce;
  String _searchQuery = '';

  String _latestPreview(ChatContact contact) {
    return MessagesMockDataSource.lastMessagePreviewFor(
      contact.id,
      fallback: contact.lastMessagePreview,
    );
  }

  List<ChatContact> get _visible {
    final q = _searchQuery.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all.where((c) {
      return c.fullName.toLowerCase().contains(q) ||
          _latestPreview(c).toLowerCase().contains(q);
    }).toList();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.secondary2Color,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'MESSAGES',
          style: theme.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.58),
                  width: 1.6,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                focusNode: _searchFocus,
                controller: _searchController,
                cursorColor: theme.colorScheme.primary,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.blackColor,
                ),
                onChanged: (_) {
                  _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 320), () {
                    if (mounted) {
                      setState(() => _searchQuery = _searchController.text);
                    }
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.bgColor,
                  hintText: 'Search messages or people',
                  hintStyle: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.gray2Color,
                  ),
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
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
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
          Expanded(
            child: _visible.isEmpty
                ? Center(
                    child: Text(
                      'No matches',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.gray2Color,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: _visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final c = _visible[index];
                      return MessageTile(
                        contact: c,
                        lastMessagePreview: _latestPreview(c),
                        onTap: () async {
                          await Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => ChatScreen(user: c),
                            ),
                          );
                          if (mounted) {
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
