import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';

/// Full-width primary action for the submit-idea flow.
class SubmitIdeaSubmitButton extends StatelessWidget {
  const SubmitIdeaSubmitButton({
    super.key,
    required this.onPressed,
    required this.enabled,
  });

  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: enabled ? onPressed : null,
        icon: CustomSvgPicture(
          path: AppImages.rocketSvg,
          color: enabled
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurface.withValues(alpha: 0.38),
          width: 22,
          height: 22,
        ),
        label: Text(
          'Submit Idea',
          style: theme.textTheme.titleMedium?.copyWith(
            color: enabled
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface.withValues(alpha: 0.38),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}