import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/notification/data/notification_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        // الربط المباشر (Real-time) مع الجدول اللي أنشأتيه في Supabase
        stream: supabase
            .from('notifications')
            .stream(primaryKey: ['id'])
            .eq('user_id', userId)
            .order('created_at', ascending: false),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No notifications found",
                  style: TextStyle(color: AppColors.gray2Color)),
            );
          }

          final notifications = snapshot.data!
              .map((json) => NotificationModel.fromJson(json))
              .toList();

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return _buildNotificationItem(context, notifications[index], supabase);
            },
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, NotificationModel item, SupabaseClient supabase) {
    return GestureDetector(
      onTap: () async {
        // تحديث الإشعار ليصبح "مقروء" عند الضغط عليه
        await supabase.from('notifications').update({'is_read': true}).eq('id', item.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: item.isRead ? Colors.white : const Color(0xFFF0F7FF), // تمييز غير المقروء
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a'), // صورة تجريبية
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.content,
                        style: const TextStyle(color: AppColors.gray2Color, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Text(
                  _formatTimestamp(item.createdAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
            // إظهار الأزرار فقط لو كان نوع الإشعار طلب شات أو استثمار
            if (item.type == 'chat' || item.type == 'invest') ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Accept", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Decline", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              )
            ],
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays > 0) return "${diff.inDays}d ago";
    if (diff.inHours > 0) return "${diff.inHours}h ago";
    return "${diff.inMinutes}m ago";
  }
}