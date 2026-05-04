import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/submit/widget/submit_button.dart';

/// Multi-step idea submission form aligned with app design tokens.
class SubmitIdeaScreen extends StatefulWidget {
  const SubmitIdeaScreen({super.key});

  @override
  State<SubmitIdeaScreen> createState() => _SubmitIdeaScreenState();
}

class _SubmitIdeaScreenState extends State<SubmitIdeaScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _pitchController = TextEditingController();

  String? _category;
  bool _businessPlan = false;
  bool _pitchDeck = false;
  bool _financials = false;

  int _completedSteps = 0;
  double _progress = 0;
  bool _formComplete = false;

  static const List<String> _categories = [
    'Technology',
    'Healthcare',
    'Finance',
    'Consumer',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_onFormChanged);
    _pitchController.addListener(_onFormChanged);
    updateStepProgress();
  }

  @override
  void dispose() {
    _titleController.removeListener(_onFormChanged);
    _pitchController.removeListener(_onFormChanged);
    _titleController.dispose();
    _pitchController.dispose();
    super.dispose();
  }

  void _onFormChanged() => updateStepProgress();

  bool get _step1Complete =>
      _titleController.text.trim().isNotEmpty && _category != null;

  bool get _step2Complete => _pitchController.text.trim().isNotEmpty;

  bool get _step3Complete => _businessPlan || _pitchDeck || _financials;

  /// Updates step counter, progress bar, submit enabled state, and completed count.
  void updateStepProgress() {
    var steps = 0;
    if (_step1Complete) steps++;
    if (_step2Complete) steps++;
    if (_step3Complete) steps++;

    final nextProgress = steps / 3.0;
    final complete = steps == 3;

    setState(() {
      _completedSteps = steps;
      _progress = nextProgress;
      _formComplete = complete;
    });
  }

  String _stepSubtitle() {
    if (!_step1Complete) return 'Project Fundamentals';
    if (!_step2Complete) return 'Pitch Details';
    if (!_step3Complete) return 'Required Documents';
    return 'Ready to submit';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: CustomSvgPicture(
            path: AppImages.backSvg,
            color: theme.colorScheme.primary,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Submit Your Idea',
          style: textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Step $_completedSteps of 3',
                        style: textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _stepSubtitle(),
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.grayColor,
                        ),
                      ),
                    ],
                  ),
                ),
                _IdeaLeftBadge(theme: theme, textTheme: textTheme),
              ],
            ),
            const SizedBox(height: 12),
            _AnimatedProgressTrack(progress: _progress),
            const SizedBox(height: 24),
            Text(
              'Tell us about your project',
              style: textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Enter a catchy name for your idea',
                labelText: 'Idea Title',
              ),
            ),
            const SizedBox(height: 16),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Category',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _category,
                  hint: Text(
                    'Select a category',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray2Color,
                    ),
                  ),
                  icon: CustomSvgPicture(
                    path: AppImages.downSvg,
                    color: theme.colorScheme.primary,
                    width: 20,
                    height: 20,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  items: _categories
                      .map(
                        (c) => DropdownMenuItem<String>(
                          value: c,
                          child: Text(c),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() => _category = value);
                    updateStepProgress();
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _pitchController,
              minLines: 4,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: 'What problem are you solving and how?',
                labelText: 'Pitch Description',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Required Documents Checklist',
              style: textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Confirm you have these ready to share later in chat',
              style: textTheme.bodySmall?.copyWith(color: AppColors.grayColor),
            ),
            const SizedBox(height: 12),
            _ChecklistTile(
              label: 'Business Plan',
              value: _businessPlan,
              onChanged: (v) {
                setState(() => _businessPlan = v ?? false);
                updateStepProgress();
              },
            ),
            const SizedBox(height: 8),
            _ChecklistTile(
              label: 'Pitch Deck',
              value: _pitchDeck,
              onChanged: (v) {
                setState(() => _pitchDeck = v ?? false);
                updateStepProgress();
              },
            ),
            const SizedBox(height: 8),
            _ChecklistTile(
              label: 'Financials',
              value: _financials,
              onChanged: (v) {
                setState(() => _financials = v ?? false);
                updateStepProgress();
              },
            ),
            const SizedBox(height: 28),
            SubmitIdeaSubmitButton(
              enabled: _formComplete,
              onPressed: () {
                // Placeholder: wire to domain / use-case when backend exists.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Idea submitted')),
                );
              },
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                'By submitting, you agree to our Entrepreneur Terms of Service.',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(color: AppColors.gray2Color),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _IdeaLeftBadge extends StatelessWidget {
  const _IdeaLeftBadge({
    required this.theme,
    required this.textTheme,
  });

  final ThemeData theme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSvgPicture(
            path: AppImages.infoOutlineSvg,
            color: theme.colorScheme.primary,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 6),
          Text(
            '1 IDEA LEFT',
            style: textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedProgressTrack extends StatelessWidget {
  const _AnimatedProgressTrack({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 8,
                width: w,
                color: AppColors.bgGray,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeOutCubic,
                height: 8,
                width: w * progress.clamp(0.0, 1.0),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  const _ChecklistTile({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: AppColors.secondary1Color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.bgGray),
          ),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}