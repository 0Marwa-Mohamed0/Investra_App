import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/notification/data/notification_model.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

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
        // استماع فوري للتغييرات في جدول الإشعارات الخاص بالمستخدم الحالي
        stream: supabase
            .from('notifications')
            .stream(primaryKey: ['id'])
            .eq('user_id', userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No notifications yet"));
          }

          final notifications = snapshot.data!
              .map((json) => NotificationModel.fromJson(json))
              .toList();

          // ترتيب الإشعارات من الأحدث للأقدم
          notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) =>
                _buildNotificationItem(context, notifications[index], supabase),
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationModel item, SupabaseClient supabase) {
    final chatService = ChatSupabaseService();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.isRead ? Colors.white : const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.notifications, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.content,
                        style: const TextStyle(
                            color: AppColors.gray2Color, fontSize: 13)),
                    Text(
                      // ميرنا: استخدمنا toLocal هنا عشان الوقت يظهر بتوقيت مصر (GMT+3) بدل جرينتش
                      DateFormat('hh:mm a').format(item.createdAt.toLocal()),
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // إظهار أزرار التحكم فقط إذا كان نوع الإشعار يتطلب رد ولم يتم قراءته بعد
          if ((item.type == 'chat' || item.type == 'invest') && !item.isRead) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        // التأكد من وجود البيانات المطلوبة لتجنب خطأ Null Check
                        if (item.requestId == null || item.ideaId == null) {
                          throw Exception("Missing Request ID or Idea ID");
                        }

                        // 1. جلب الـ sender_id (المستخدم الذي أرسل الطلب) من جدول requests
                        final requestData = await supabase
                            .from('requests')
                            .select('sender_id')
                            .eq('id', item.requestId!)
                            .single();

                        final String realSenderId = requestData['sender_id'];

                        // 2. تحديث حالة الطلب في قاعدة البيانات إلى مقبول
                        await supabase
                            .from('requests')
                            .update({'status': 'accepted'})
                            .eq('id', item.requestId!);

                        // 3. إنشاء أو جلب المحادثة بين الطرفين لهذه الفكرة المحددة
                        await chatService.getOrCreateChat(
                          otherUserId: realSenderId,
                          ideaId: item.ideaId!,
                        );

                        // 4. تحديث الإشعار ليصبح مقروءاً
                        await supabase
                            .from('notifications')
                            .update({'is_read': true})
                            .eq('id', item.id);

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Chat created! You can now start messaging.")),
                          );
                        }
                      } catch (e) {
                        debugPrint("Error in Accept process: $e");
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error: ${e.toString()}")),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Accept", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      try {
                        // تحديث الطلب ليكون مرفوضاً وتحديث حالة الإشعار
                        await supabase
                            .from('requests')
                            .update({'status': 'declined'})
                            .eq('id', item.requestId!);

                        await supabase
                            .from('notifications')
                            .update({'is_read': true})
                            .eq('id', item.id);
                      } catch (e) {
                        debugPrint("Error in Decline process: $e");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Decline"),
                  ),
                ),
              ],
            )
          ],
        ],
      ),
    );
  }
}