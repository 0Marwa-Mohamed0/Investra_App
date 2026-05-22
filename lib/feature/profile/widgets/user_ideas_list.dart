import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../../IdeaDetails/presentation/Page/idea_details_screen.dart';

class UserIdeasList extends StatelessWidget {
  final List<Map<String, dynamic>> ideas;
  const UserIdeasList({super.key, required this.ideas});

  @override
  Widget build(BuildContext context) {
    if (ideas.isEmpty) {
      return const Center(
        child: Text(
          'No ideas pitched yet.',
          style: TextStyle(color: AppColors.grayColor, fontSize: 14),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: ideas.length,
      itemBuilder: (context, index) {
        final idea = ideas[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IdeaDetailsScreen(idea: idea),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.bgGray),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary1Color,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lightbulb_outline, color: AppColors.primaryColor),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        idea['title'] ?? 'No Title',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        idea['description'] ?? 'No description available.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, color: AppColors.grayColor, height: 1.3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grayColor),
              ],
            ),
          ),
        );
      },
    );
  }
}