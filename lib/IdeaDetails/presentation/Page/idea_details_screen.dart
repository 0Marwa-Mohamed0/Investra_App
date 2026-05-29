import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/idea_logic.dart';
import '../Widgets/category_image_header.dart';
import '../Widgets/action_buttons_section.dart';
import 'package:investra/feature/profile/screens/profile_screen.dart';
import '../Widgets/ai_investor_rating_card.dart';

class IdeaDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> idea;
  const IdeaDetailsScreen({super.key, required this.idea});

  @override
  State<IdeaDetailsScreen> createState() => _IdeaDetailsScreenState();
}

class _IdeaDetailsScreenState extends State<IdeaDetailsScreen> {
  final IdeaLogic _logic = IdeaLogic();
  bool _isLoading = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _recordView();
  }

  Future<void> _recordView() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;

      if (userId != null) {
        await supabase.from('idea_views').insert({
          'idea_id': widget.idea['id'],
          'viewer_id': userId,
        });
      }
    } catch (e) {
      debugPrint('Note: View not recorded: $e');
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
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryColor, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'IDEA DETAILS',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              letterSpacing: 1.1
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryImageHeader(
              imagePath: _logic.getCategoryImage(category),
              category: category,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.idea['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      height: 1.25,
                    ),
                  ),

                  const SizedBox(height: 4),

                  FutureBuilder<String>(
                    future: _logic.getEntrepreneurName(widget.idea['entrepreneur_id']?.toString() ?? ''),
                    builder: (context, snapshot) {
                      final entrepreneurName = snapshot.data ?? '...';

                      return GestureDetector(
                        onTap: () {
                          final String? entrepreneurId = widget.idea['entrepreneur_id']?.toString();
                          if (entrepreneurId != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(userId: entrepreneurId),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Posted $date by $entrepreneurName",
                          style: const TextStyle(
                            color: AppColors.grayColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  const AiInvestorRatingCard(),

                  const SizedBox(height: 14),

                  const Text(
                      "Project Description",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.blackColor)
                  ),
                  const SizedBox(height: 5),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        maxLines: _isExpanded ? null : 4,
                        overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13.5,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGray
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _isExpanded ? "Read Less" : "Read More",
                            style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (docs.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    const Text("Required Documents", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.blackColor)),
                    const SizedBox(height: 8),
                    ...docs.map((docUrl) {
                      bool isBP = docUrl.toString().contains('bp_');
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary2Color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.bgGray),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.insert_drive_file, color: AppColors.primaryColor, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                isBP ? "Business Plan" : "Feasibility Study",
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ),
                            const Icon(Icons.check_circle, color: AppColors.green1Color, size: 16),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                  const SizedBox(height: 16),
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