import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/notification/data/notification_model.dart';
import 'package:investra/feature/profile/screens/profile_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryColor, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: supabase
            .from('notifications')
            .stream(primaryKey: ['id'])
            .eq('user_id', userId)
            .order('created_at', ascending: false),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No notifications yet",
                style: TextStyle(color: AppColors.grayColor),
              ),
            );
          }

          final notifications = snapshot.data!
              .map((json) => NotificationModel.fromJson(json))
              .toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) =>
                _buildNotificationItem(context, notifications[index], supabase, userId),
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationModel item, SupabaseClient supabase, String myId) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.isRead ? AppColors.bgColor : AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: item.isRead ? AppColors.bgGray : AppColors.primaryColor.withOpacity(0.4),
          width: item.isRead ? 1.0 : 1.6,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          try {
            await supabase
                .from('notifications')
                .update({'is_read': true})
                .eq('id', item.id);
          } catch (e) {
            debugPrint("Error marking notification as read: $e");
          }

          if (item.type == 'invest' || item.type == 'chat') {
            /* // TODO: فتح تفاصيل الفكرة من جهة رائد الأعمال
            if (context.mounted && item.ideaId != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EntrepreneurIdeaDetailsScreen(ideaId: item.ideaId),
                ),
              );
            }
            */
            return;
          }

          if (item.requestId == null) return;
          try {
            final requestData = await supabase
                .from('requests')
                .select('sender_id, receiver_id')
                .eq('id', item.requestId!)
                .single();

            String targetUserId = (item.type == 'chat_accepted')
                ? requestData['receiver_id']
                : requestData['sender_id'];

            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(userId: targetUserId),
                ),
              );
            }
          } catch (e) {
            debugPrint("Error fetching target profile ID: $e");
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                if (item.requestId == null) return;
                try {
                  final requestData = await supabase
                      .from('requests')
                      .select('sender_id')
                      .eq('id', item.requestId!)
                      .single();

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(userId: requestData['sender_id']),
                      ),
                    );
                  }
                } catch (e) {
                  debugPrint("Error navigating to profile: $e");
                }
              },
              child: CircleAvatar(
                backgroundColor: item.isRead ? AppColors.bgGray : AppColors.primaryColor,
                child: Icon(
                  item.isRead ? Icons.notifications_none : Icons.notifications_active,
                  color: item.isRead ? AppColors.grayColor : AppColors.bgColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: item.isRead ? AppColors.grayColor : AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.content,
                    style: const TextStyle(
                      color: AppColors.gray2Color,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _getFormattedTime(item.createdAt),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.grayColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedTime(DateTime createdAt) {
    final localDateTime = createdAt.toLocal();
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final notificationDate = DateTime(localDateTime.year, localDateTime.month, localDateTime.day);
    final differenceInDays = today.difference(notificationDate).inDays;

    if (differenceInDays == 0) {
      return DateFormat('hh:mm a').format(localDateTime);
    } else if (differenceInDays == 1) {
      return 'Yesterday';
    } else if (differenceInDays < 7) {
      return '$differenceInDays d ago';
    } else {
      return DateFormat('dd MMM').format(localDateTime);
    }
  }
}