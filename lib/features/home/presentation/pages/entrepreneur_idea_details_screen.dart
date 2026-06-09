// ═══════════════════════════════════════════════════════════════════════════
// 📁 المسار: lib/features/home/presentation/pages/entrepreneur_idea_details_screen.dart
// ℹ️  استبدل الملف القديم بهذا الملف بالكامل
// ═══════════════════════════════════════════════════════════════════════════

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:open_filex/open_filex.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EntrepreneurIdeaDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> ideaData;

  const EntrepreneurIdeaDetailsScreen({
    super.key,
    required this.ideaData,
  });

  @override
  State<EntrepreneurIdeaDetailsScreen> createState() =>
      _EntrepreneurIdeaDetailsScreenState();
}

class _EntrepreneurIdeaDetailsScreenState
    extends State<EntrepreneurIdeaDetailsScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _pitchController;

  String? _category;
  static const List<String> _categories = [
    'Technology',
    'Healthcare',
    'Finance',
    'Consumer',
    'Other',
  ];

  List<String> _existingDocUrls = [];
  final Map<int, File> _replacedFiles = {};
  final Map<int, String> _replacedFileNames = {};

  // ✅ قائمة العقود الجديدة (بتترفع في bucket 'contracts')
  final List<File> _newContractFiles = [];
  final List<String> _newContractFileNames = [];

  late String _originalTitle;
  late String _originalCategory;
  late String _originalDescription;
  late List<String> _originalDocUrls;

  bool _hasChanges = false;
  bool _isSaving = false;
  bool _isOpeningDoc = false;

  final _supabase = Supabase.instance.client;
  final _dio = Dio();

  @override
  void initState() {
    super.initState();

    _originalTitle = widget.ideaData['title']?.toString() ?? '';
    _originalCategory = widget.ideaData['category']?.toString() ?? '';
    _originalDescription = widget.ideaData['description']?.toString() ?? '';

    _titleController = TextEditingController(text: _originalTitle);
    _pitchController = TextEditingController(text: _originalDescription);

    _category = _categories.contains(_originalCategory)
        ? _originalCategory
        : null;

    final rawDocs = widget.ideaData['idea_docs'];
    if (rawDocs is List) {
      _existingDocUrls = rawDocs.map((e) => e.toString()).toList();
    }
    _originalDocUrls = List.from(_existingDocUrls);

    _titleController.addListener(_detectChanges);
    _pitchController.addListener(_detectChanges);
  }

  @override
  void dispose() {
    _titleController.removeListener(_detectChanges);
    _pitchController.removeListener(_detectChanges);
    _titleController.dispose();
    _pitchController.dispose();
    _dio.close();
    super.dispose();
  }

  void _detectChanges() {
    final docsChanged = _docListsDiffer(_existingDocUrls, _originalDocUrls);
    final changed =
        _titleController.text.trim() != _originalTitle.trim() ||
            (_category ?? '') != _originalCategory ||
            _pitchController.text.trim() != _originalDescription.trim() ||
            _replacedFiles.isNotEmpty ||
            _newContractFiles.isNotEmpty ||
            docsChanged;

    if (changed != _hasChanges) setState(() => _hasChanges = changed);
  }

  bool _docListsDiffer(List<String> a, List<String> b) {
    if (a.length != b.length) return true;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return true;
    }
    return false;
  }

  String _docLabel(String url, int index) {
    if (url.contains('bp_')) return 'Business Plan';
    if (url.contains('fs_')) return 'Feasibility Study';
    // ✅ العقود اللي اترفعت في bucket contracts بتيجي URL فيه كلمة contracts
    if (url.contains('contract_') || url.contains('/contracts/')) {
      return 'Contract';
    }
    return 'Document ${index + 1}';
  }

  bool _isContractUrl(String url) =>
      url.contains('contract_') || url.contains('/contracts/');

  void _reindexReplacementMaps(int removedIndex) {
    final newFiles = <int, File>{};
    final newNames = <int, String>{};
    for (final entry in _replacedFiles.entries) {
      final key = entry.key;
      if (key < removedIndex) {
        newFiles[key] = entry.value;
        newNames[key] = _replacedFileNames[key]!;
      } else if (key > removedIndex) {
        newFiles[key - 1] = entry.value;
        newNames[key - 1] = _replacedFileNames[key]!;
      }
    }
    _replacedFiles
      ..clear()
      ..addAll(newFiles);
    _replacedFileNames
      ..clear()
      ..addAll(newNames);
  }

  Future<void> _pickReplacementFile(int docIndex) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null && mounted) {
      setState(() {
        _replacedFiles[docIndex] = File(result.files.single.path!);
        _replacedFileNames[docIndex] = result.files.single.name;
      });
      _detectChanges();
    }
  }

  Future<void> _addContractFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null && mounted) {
      setState(() {
        _newContractFiles.add(File(result.files.single.path!));
        _newContractFileNames.add(result.files.single.name);
      });
      _detectChanges();
    }
  }

  Future<void> _replaceNewContract(int index) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null && mounted) {
      setState(() {
        _newContractFiles[index] = File(result.files.single.path!);
        _newContractFileNames[index] = result.files.single.name;
      });
      _detectChanges();
    }
  }

  void _removeNewContract(int index) {
    setState(() {
      _newContractFiles.removeAt(index);
      _newContractFileNames.removeAt(index);
    });
    _detectChanges();
  }

  void _deleteExistingDoc(int index) {
    setState(() {
      _reindexReplacementMaps(index);
      _existingDocUrls.removeAt(index);
    });
    _detectChanges();
  }

  String _extensionFromUrl(String url) {
    final path = Uri.tryParse(url)?.path ?? url;
    final dot = path.lastIndexOf('.');
    if (dot != -1 && dot < path.length - 1) {
      return path.substring(dot);
    }
    return '.pdf';
  }

  Future<String> _downloadToTemp(String url) async {
    final ext = _extensionFromUrl(url);
    final fileName =
        'investra_doc_${DateTime.now().millisecondsSinceEpoch}$ext';
    final savePath = '${Directory.systemTemp.path}/$fileName';
    await _dio.download(url, savePath);
    return savePath;
  }

  Future<void> _openDocument({File? localFile, String? remoteUrl}) async {
    if (_isOpeningDoc) return;
    setState(() => _isOpeningDoc = true);

    try {
      late final String filePath;

      if (localFile != null) {
        filePath = localFile.path;
      } else if (remoteUrl != null && remoteUrl.isNotEmpty) {
        filePath = await _downloadToTemp(remoteUrl);
      } else {
        _showSnack('No file available.');
        return;
      }

      final result = await OpenFilex.open(filePath);
      if (result.type != ResultType.done && mounted) {
        _showSnack(result.message);
      }
    } catch (e) {
      if (mounted) _showSnack('Error opening file: $e');
    } finally {
      if (mounted) setState(() => _isOpeningDoc = false);
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _saveChanges() async {
    final ideaId = widget.ideaData['id']?.toString();
    if (ideaId == null) return;

    setState(() => _isSaving = true);

    try {
      List<String> updatedDocUrls = List.from(_existingDocUrls);

      // 1) رفع الملفات البديلة في ideas_docs (نفس الـ bucket الأصلي)
      for (final entry in _replacedFiles.entries) {
        final index = entry.key;
        final file = entry.value;
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${_replacedFileNames[index]}';

        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', file);

        final newUrl = _supabase.storage
            .from('ideas_docs')
            .getPublicUrl('public/$fileName');

        if (index < updatedDocUrls.length) {
          updatedDocUrls[index] = newUrl;
        } else {
          updatedDocUrls.add(newUrl);
        }
      }

      // ✅ 2) رفع العقود الجديدة في bucket منفصل اسمه 'contracts'
      for (int i = 0; i < _newContractFiles.length; i++) {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${_newContractFileNames[i]}';

        await _supabase.storage
            .from('contracts')
            .upload('public/$fileName', _newContractFiles[i]);

        final newUrl = _supabase.storage
            .from('contracts')
            .getPublicUrl('public/$fileName');

        updatedDocUrls.add(newUrl);
      }

      // 3) تحديث جدول ideas
      await _supabase.from('ideas').update({
        'title': _titleController.text.trim(),
        'description': _pitchController.text.trim(),
        'category': _category ?? _originalCategory,
        'idea_docs': updatedDocUrls,
      }).eq('id', ideaId);

      if (mounted) {
        _originalTitle = _titleController.text.trim();
        _originalDescription = _pitchController.text.trim();
        _originalCategory = _category ?? _originalCategory;
        _existingDocUrls = updatedDocUrls;
        _originalDocUrls = List.from(updatedDocUrls);

        _replacedFiles.clear();
        _replacedFileNames.clear();
        _newContractFiles.clear();
        _newContractFileNames.clear();

        setState(() => _hasChanges = false);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Changes saved successfully! ✅')),
        );

        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving changes: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final hasAnyDocs =
        _existingDocUrls.isNotEmpty || _newContractFiles.isNotEmpty;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, theme, textTheme),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us about your project',
                  style: textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // ── Idea Title ──────────────────────────────────────────
                TextFormField(
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Idea Title',
                    hintText: 'Enter a catchy name for your idea',
                  ),
                ),
                const SizedBox(height: 16),

                // ── Category ───────────────────────────────────────────
                InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _category,
                      hint: Text(
                        'Select a category',
                        style: textTheme.bodyMedium
                            ?.copyWith(color: AppColors.gray2Color),
                      ),
                      icon: CustomSvgPicture(
                        path: AppImages.downSvg,
                        color: theme.colorScheme.primary,
                        width: 20,
                        height: 20,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      items: _categories
                          .map((c) => DropdownMenuItem<String>(
                          value: c, child: Text(c)))
                          .toList(),
                      onChanged: (value) {
                        setState(() => _category = value);
                        _detectChanges();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // ── Pitch Description ──────────────────────────────────
                TextFormField(
                  controller: _pitchController,
                  minLines: 4,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    labelText: 'Pitch Description',
                    hintText: 'What problem are you solving and how?',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 28),

                // ── Documents ──────────────────────────────────────────
                if (hasAnyDocs) ...[
                  Text(
                    'Uploaded Documents',
                    style: textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // الوثائق الموجودة
                  ...List.generate(_existingDocUrls.length, (i) {
                    final url = _existingDocUrls[i];
                    final isReplaced = _replacedFiles.containsKey(i);
                    final label = isReplaced
                        ? '${_replacedFileNames[i]!}  (new)'
                        : _docLabel(url, i);
                    final isContract = _isContractUrl(url);

                    return _DocumentRow(
                      label: label,
                      isReplaced: isReplaced,
                      onOpen: () {
                        if (isReplaced) {
                          _openDocument(localFile: _replacedFiles[i]);
                        } else {
                          _openDocument(remoteUrl: url);
                        }
                      },
                      onReplace: () => _pickReplacementFile(i),
                      onDelete: isContract ? () => _deleteExistingDoc(i) : null,
                    );
                  }),

                  // العقود الجديدة (لسه مترفعتش)
                  ...List.generate(_newContractFiles.length, (i) {
                    return _DocumentRow(
                      label: _newContractFileNames[i],
                      isReplaced: true,
                      onOpen: () =>
                          _openDocument(localFile: _newContractFiles[i]),
                      onReplace: () => _replaceNewContract(i),
                      onDelete: () => _removeNewContract(i),
                    );
                  }),

                  const SizedBox(height: 8),
                ],

                // ── Add Contract Button ────────────────────────────────
                _AddContractButton(onPressed: _addContractFile),
                const SizedBox(height: 32),

                // ── Submit Changes Button ──────────────────────────────
                _SubmitChangesButton(
                  enabled: _hasChanges && !_isSaving,
                  isLoading: _isSaving,
                  onPressed: _saveChanges,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),

          // Loading overlay أثناء فتح الملف
          if (_isOpeningDoc)
            const ColoredBox(
              color: Color(0x33000000),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(
      BuildContext context, ThemeData theme, TextTheme textTheme) {
    final userId = _supabase.auth.currentUser?.id ?? '';

    return AppBar(
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
        'Idea Details',
        style: textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        _NotificationBell(supabase: _supabase, userId: userId),
        const SizedBox(width: 8),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// WIDGETS
// ════════════════════════════════════════════════════════════════════════════

class _DocumentRow extends StatelessWidget {
  final String label;
  final bool isReplaced;
  final VoidCallback onOpen;
  final VoidCallback onReplace;
  final VoidCallback? onDelete;

  const _DocumentRow({
    required this.label,
    required this.isReplaced,
    required this.onOpen,
    required this.onReplace,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isReplaced
              ? AppColors.primaryColor.withValues(alpha: 0.45)
              : AppColors.secondary1Color,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // الضغط على هذا الجزء يفتح الملف
          Expanded(
            child: InkWell(
              onTap: onOpen,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Row(
                  children: [
                    Icon(
                      isReplaced
                          ? Icons.check_circle
                          : Icons.description_outlined,
                      color: isReplaced
                          ? AppColors.green1Color
                          : AppColors.primaryColor,
                      size: 26,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGray,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // أيقونات اليمين (حذف + استبدال)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onDelete != null) ...[
                  _DocIconButton(
                    icon: Icons.delete_outline,
                    color: AppColors.errorColor,
                    tooltip: 'Remove file',
                    size: 22,
                    onTap: onDelete!,
                  ),
                  const SizedBox(width: 8),
                ],
                _DocIconButton(
                  icon: Icons.sync,
                  color: AppColors.grayColor,
                  tooltip: 'Replace file',
                  size: 28,
                  onTap: onReplace,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DocIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final double size;
  final VoidCallback onTap;

  const _DocIconButton({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.secondary1Color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: size, color: color),
        ),
      ),
    );
  }
}

class _AddContractButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AddContractButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add, color: Colors.white, size: 22),
        label: const Text(
          'Add Contract',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _SubmitChangesButton extends StatelessWidget {
  final bool enabled;
  final bool isLoading;
  final VoidCallback onPressed;

  const _SubmitChangesButton({
    required this.enabled,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabledColor = theme.colorScheme.onSurface.withValues(alpha: 0.38);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: enabled ? onPressed : null,
        icon: isLoading
            ? const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : CustomSvgPicture(
          path: AppImages.editSvg,
          color: enabled ? theme.colorScheme.onPrimary : disabledColor,
          width: 20,
          height: 20,
        ),
        label: Text(
          isLoading ? 'Saving...' : 'Submit Changes',
          style: theme.textTheme.titleMedium?.copyWith(
            color: enabled ? theme.colorScheme.onPrimary : disabledColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor:
          enabled ? AppColors.primaryColor : AppColors.bgGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _NotificationBell extends StatelessWidget {
  final SupabaseClient supabase;
  final String userId;

  const _NotificationBell({
    required this.supabase,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase
          .from('notifications')
          .stream(primaryKey: ['id'])
          .eq('user_id', userId),
      builder: (context, snapshot) {
        final hasUnread =
            snapshot.data?.any((n) => n['is_read'] == false) ?? false;

        return Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: AppColors.primaryColor,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationsScreen(),
                ),
              ),
            ),
            if (hasUnread)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}