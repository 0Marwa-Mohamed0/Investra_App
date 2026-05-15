import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // مهم جداً
import '../../domain/idea_logic.dart';
import '../Widgets/category_image_header.dart';
import '../Widgets/action_buttons_section.dart';

class IdeaDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> idea;
  const IdeaDetailsScreen({super.key, required this.idea});

  @override
  State<IdeaDetailsScreen> createState() => _IdeaDetailsScreenState();
}

class _IdeaDetailsScreenState extends State<IdeaDetailsScreen> {
  final IdeaLogic _logic = IdeaLogic();
  bool _isLoading = false;
  bool _isExpanded = false; // للتحكم في الـ Read More

  @override
  void initState() {
    super.initState();
    _recordView(); // تسجيل المشاهدة بمجرد فتح الصفحة
  }

  // دالة تسجيل المشاهدة في جدول idea_views
  Future<void> _recordView() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;

      if (userId != null) {
        await supabase.from('idea_views').insert({
          'idea_id': widget.idea['id'],
          'viewer_id': userId,
        });
        debugPrint('View recorded successfully!');
      }
    } catch (e) {
      debugPrint('Note: View not recorded (possibly duplicate or error): $e');
    }
  }

  Future<void> _handleAction(bool isChat) async {
    setState(() => _isLoading = true);
    try {
      await _logic.submitAction(
        ideaId: widget.idea['id'].toString(),
        entrepreneurId: widget.idea['entrepreneur_id']?.toString() ?? '',
        ideaTitle: widget.idea['title'] ?? '',
        isChatRequest: isChat,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: AppColors.green1Color, content: Text('Request sent!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: AppColors.errorColor, content: Text('Request failed.')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String category = widget.idea['category'] ?? 'General';
    final List<dynamic> docs = widget.idea['idea_docs'] ?? [];
    final String description = widget.idea['description'] ?? 'No description provided.';
    final String date = widget.idea['created_at'] != null
        ? DateFormat.yMMMd().format(DateTime.parse(widget.idea['created_at']))
        : 'Recently';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryImageHeader(
              imagePath: _logic.getCategoryImage(category),
              onBack: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.toUpperCase(), style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.idea['title'] ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                  FutureBuilder<String>(
                    future: _logic.getEntrepreneurName(widget.idea['entrepreneur_id']?.toString() ?? ''),
                    builder: (context, snapshot) {
                      return Text("Posted $date by ${snapshot.data ?? '...'}",
                          style: const TextStyle(color: AppColors.grayColor, fontSize: 14));
                    },
                  ),

                  const SizedBox(height: 25),
                  const Text("Project Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  // --- تطبيق خاصية Read More ---
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        maxLines: _isExpanded ? null : 4,
                        overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _isExpanded ? "Read Less" : "Read More",
                            style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (docs.isNotEmpty) ...[
                    const SizedBox(height: 25),
                    const Text("Required Documents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ...docs.map((docUrl) {
                      bool isBP = docUrl.toString().contains('bp_');
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.bgGray),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.description, color: AppColors.primaryColor),
                            const SizedBox(width: 10),
                            Expanded(child: Text(isBP ? "Business Plan" : "Feasibility Study")),
                            const Icon(Icons.check_circle, color: AppColors.green1Color, size: 20),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                  const SizedBox(height: 35),
                  ActionButtonsSection(isLoading: _isLoading, onAction: _handleAction),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}