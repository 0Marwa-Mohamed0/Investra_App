### File: D:\FlutterProjects\Investra_App\lib\core\constants\app_fonts.dart
`dart
abstract class AppFonts {
  static const String dMSerif = 'DMSerif';
}


``n
### File: D:\FlutterProjects\Investra_App\lib\core\constants\app_images.dart
`dart
abstract class AppImages {
  static const String joinInvestra = 'assets/images/join_investra.svg';
  static const String profile = 'assets/images/profile.png';
  static const String technology = 'assets/images/technology.png';
  static const String verifiedBadge = 'assets/images/Verified_Badge.png';
  static const String applogo = 'assets/images/App_logo.png';
  static const String logo = 'assets/images/logo22.png';
  static const String background = 'assets/images/Background.png';


  //
  static const String chatSvg = 'assets/icons/Chat.svg';
  static const String logoSvg = 'assets/icons/logo22Svg.svg';
  static const String appLogoSvg = 'assets/icons/App_logoSvg.svg';
  static const String linkedinSvg = 'assets/icons/Linkedin.svg';
  static const String googleSvg = 'assets/icons/google_svg.svg';
  static const String backSvg = 'assets/icons/back_svg.svg';
  static const String addSvg = 'assets/icons/add.svg';
  static const String aichatbotSvg = 'assets/icons/ai_chatbot.svg';
  static const String appearanceSvg = 'assets/icons/appearance.svg';
  static const String documentSvg = 'assets/icons/Document.svg';
  static const String downSvg = 'assets/icons/down.svg';
  static const String ecoStreamSvg = 'assets/icons/ecoStream.svg';
  static const String editSvg = 'assets/icons/edit.svg';
  static const String goSvg = 'assets/icons/go.svg';
  static const String helpSvg = 'assets/icons/help.svg';
  static const String homeSvg = 'assets/icons/home.svg';
  static const String ideaSvg = 'assets/icons/idea.svg';
  static const String idea2Svg = 'assets/icons/idea2.svg';
  static const String infoOutlineSvg = 'assets/icons/info_outline.svg';
  static const String lockSvg = 'assets/icons/lock.svg';
  static const String logoutSvg = 'assets/icons/logout.svg';
  static const String memdersSvg = 'assets/icons/memders.svg';
  static const String messegeSvg = 'assets/icons/messege.svg';
  static const String notificationSvg = 'assets/icons/notification.svg';
  static const String notification2Svg = 'assets/icons/notification2.svg';
  static const String passwordSvg = 'assets/icons/password.svg';
  static const String profileSvg = 'assets/icons/profile.svg';
  static const String rocketSvg = 'assets/icons/rocket.svg';
  static const String searchSvg = 'assets/icons/search.svg';
  static const String securitySvg = 'assets/icons/security.svg';
  static const String sendSvg = 'assets/icons/send.svg';
  static const String settingSvg = 'assets/icons/setting.svg';
  static const String smartPackSvg = 'assets/icons/smartPack.svg';
  static const String verifiedSvg = 'assets/icons/Verified.svg';
  static const String videoSvg = 'assets/icons/video.svg';
  static const String warningSvg = 'assets/icons/warning.svg';
  static const String powerSvg = 'assets/icons/power.svg';


  //mirna add
  static const String robotIdeaAi= 'assets/images/Robot-Brain.jpg';
  static const String medCare= 'assets/images/online-marketing-hIgeoQjS_iE-unsplash.jpg';
  static const String finance= 'assets/images/nick-chong-N__BnvQ_w18-unsplash.jpg';
  static const String technology_idea= 'assets/images/conny-schneider-xuTJZ7uD7PI-unsplash.jpg';


//finalsss
  static const String small_logo= 'assets/images/small_logo.png';
  static const String big_logo= 'assets/images/big_logo';

}


``n
### File: D:\FlutterProjects\Investra_App\lib\core\constants\app_strings.dart
`dart
class AppStrings {
  static const String appName = 'Investra';
  static const String welcomeBack = 'Welcome back';
  static const String login = 'Log In';
  static const String signUp = 'Sign Up';
  static const String submitIdea = 'Submit Idea';
  static const String errorOccurred = 'An error occurred';
  static const String success = 'Success';
}


``n
### File: D:\FlutterProjects\Investra_App\lib\core\errors\failures.dart
`dart
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No Internet Connection']);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}


``n
### File: D:\FlutterProjects\Investra_App\lib\core\styles\colors.dart
`dart
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xff1E4B76);
  static const Color secondary1Color = Color(0xffF1F5F9);
  static const Color secondary2Color = Color(0xffF8FAFC);
  static const Color bgColor = Color(0xffFFFFFF);
  static const Color grayColor = Color(0xff64748B);
  static const Color gray2Color = Color(0xff6B7280);
  static const Color bgGray = Color(0xffE2E8F0);
  static const Color darkGray = Color(0xff334155);
  static const Color green1Color = Color(0xff16A34A);
  static const Color lightgreen = Color(0xffF0FDF4);
  static const Color darkgreen = Color(0xff2D6A4F);
  static const Color green4Color = Color(0xff4CAF50);
  static const Color submissionColor = Color(0xff94F990);
  static const Color errorColor = Color(0xffBA1A1A);
  static const Color lightRedColor = Color(0xffFFDAD6);
  static const Color blackColor = Color(0xff0F172A);
  static const Color yellowColor = Color(0xffFBBF24);
  static const Color lightyellow = Color(0xffFEFCE8);
  static const Color bg = Color(0xffF6F7F8);
}


``n
### File: D:\FlutterProjects\Investra_App\lib\core\widgets\custom_snackbar.dart
`dart
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, AppColors.green1Color);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, AppColors.errorColor);
  }

  static void _show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\core\widgets\custom_svg_picture.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    this.color,
    required this.path,
    this.width,
    this.height,
  });

  final String path;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\ai_chatbot\data\models\ai_chat_model.dart
`dart
import 'dart:convert';

class AiSession {
  final String sessionId;
  final String userId;
  final String title;
  final String? lastMessageSnippet;
  final DateTime createdAt;

  AiSession({
    required this.sessionId,
    required this.userId,
    required this.title,
    this.lastMessageSnippet,
    required this.createdAt,
  });

  factory AiSession.fromJson(Map<String, dynamic> json) {
    return AiSession(
      sessionId: json['session_id'] ?? '',
      userId: json['user_id'] ?? '',
      title: json['title'] ?? 'Chat',
      lastMessageSnippet: json['last_message_snippet'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'user_id': userId,
      'title': title,
      'last_message_snippet': lastMessageSnippet,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class AiMessage {
  final String messageId;
  final String sessionId;
  final String senderRole;
  final String content;
  final String? fileUrl;
  final String? fileName;
  final DateTime createdAt;

  AiMessage({
    required this.messageId,
    required this.sessionId,
    required this.senderRole,
    required this.content,
    this.fileUrl,
    this.fileName,
    required this.createdAt,
  });

  bool get isAi => senderRole == 'assistant';

  factory AiMessage.fromJson(Map<String, dynamic> json) {
    return AiMessage(
      messageId: json['message_id'] ?? '',
      sessionId: json['session_id'] ?? '',
      senderRole: json['sender_role'] ?? 'user',
      content: json['content'] ?? '',
      fileUrl: json['file_url'],
      fileName: json['file_name'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'session_id': sessionId,
      'sender_role': senderRole,
      'content': content,
      'file_url': fileUrl,
      'file_name': fileName,
      'created_at': createdAt.toIso8601String(),
    };
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\ai_chatbot\presentation\pages\ai_chatbot_screen.dart
`dart
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:intl/intl.dart';
import 'ai_chat_history_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Base URL of the Investra AI backend (FastAPI on Railway)
const String kAiBackendBaseUrl = 'https://investraapp-production.up.railway.app';

class AiChatbotScreen extends StatefulWidget {
  final Function(bool)? onScroll;
  final String? existingSessionId;

  const AiChatbotScreen({super.key, this.onScroll, this.existingSessionId});

  @override
  State<AiChatbotScreen> createState() => _AiChatbotScreenState();
}

class _AiChatbotScreenState extends State<AiChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  final _supabase = Supabase.instance.client;
  final _dio = Dio();

  String? _currentSessionId;
  String _userName = "User";
  bool _isLoading = true;
  bool _isMenuOpen = false;
  bool _isSending = false;
  bool _isAiTyping = false;

  File? _selectedFile;
  String? _selectedFileName;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  Future<void> _initializeChat() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      final userData = await _supabase.from('User').select('FullName').eq('userid', user.id).maybeSingle();
      if (userData != null && mounted) {
        setState(() => _userName = userData['FullName']);
      }

      if (widget.existingSessionId != null) {
        if (mounted) {
          setState(() {
            _currentSessionId = widget.existingSessionId;
            _isLoading = false;
          });
        }
      } else {
        await _createNewChatSession(user.id);
      }
    } catch (e) {
      debugPrint("Init Error: $e");
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _createNewChatSession(String userId) async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final nowStr = DateTime.now().toIso8601String();

      final newSession = await _supabase.from('AI_Sessions').insert({
        'user_id': userId,
        'title': 'Chat ${DateFormat('MMM d, h:mm a').format(DateTime.now())}',
        'created_at': nowStr,
      }).select().single();

      final sessionId = newSession['session_id'];

      await _supabase.from('AI_Messages').insert({
        'session_id': sessionId,
        'sender_role': 'assistant',
        'content': 'Hi $_userName, I am your Investra AI\nhow can I help you today',
        'created_at': nowStr,
      });

      if (mounted) {
        setState(() {
          _currentSessionId = sessionId;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _pickFile() async {
    setState(() => _isMenuOpen = false);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && mounted) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _selectedFileName = result.files.single.name;
      });
    }
  }

  Future<void> _handleSendMessage() async {
    if (_isSending || _currentSessionId == null) return;
    final text = _messageController.text.trim();
    if (text.isEmpty && _selectedFile == null) return;

    _messageController.clear();
    final fileToSend = _selectedFile;
    final fileNameToSend = _selectedFileName;

    setState(() {
      _selectedFile = null;
      _selectedFileName = null;
      _isSending = true;
    });

    _messageFocusNode.requestFocus();

    try {
      String? uploadedFileUrl;
      if (fileToSend != null) {
        String storagePath = 'chat_files/${DateTime.now().millisecondsSinceEpoch}_$fileNameToSend';
        await _supabase.storage.from('chat_files').upload(storagePath, fileToSend);
        uploadedFileUrl = _supabase.storage.from('chat_files').getPublicUrl(storagePath);
      }

      await _supabase.from('AI_Messages').insert({
        'session_id': _currentSessionId,
        'sender_role': 'user',
        'content': text,
        'file_url': uploadedFileUrl,
        'file_name': fileNameToSend,
        'created_at': DateTime.now().toUtc().toIso8601String(),
      });

      if (text.isNotEmpty) {
        await _requestAiReply(text);
      }
    } catch (e) {
      debugPrint("Send Error: $e");
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  Future<void> _requestAiReply(String message) async {
    if (mounted) setState(() => _isAiTyping = true);
    try {
      final history = await _fetchRecentHistory();

      await _dio.post(
        '$kAiBackendBaseUrl/chat',
        data: FormData.fromMap({
          'message': message,
          'history': jsonEncode(history),
          'session_id': _currentSessionId,
          'user_id': _supabase.auth.currentUser?.id ?? '',
        }),
      );
    } catch (e) {
      String errorDetail;
      if (e is DioException) {
        errorDetail = "status: ${e.response?.statusCode}\nbody: ${e.response?.data}";
      } else {
        errorDetail = e.toString();
      }
      debugPrint("AI Reply Error -> $errorDetail");

      try {
        await _supabase.from('AI_Messages').insert({
          'session_id': _currentSessionId,
          'sender_role': 'assistant',
          'content': "Sorry, I couldn't reach the AI service right now.\n\n[debug] $errorDetail",
          'created_at': DateTime.now().toIso8601String(),
        });
      } catch (_) {}
    } finally {
      if (mounted) setState(() => _isAiTyping = false);
    }
  }

  Future<List<Map<String, String>>> _fetchRecentHistory() async {
    if (_currentSessionId == null) return [];
    try {
      final rows = await _supabase
          .from('AI_Messages')
          .select('sender_role, content')
          .eq('session_id', _currentSessionId!)
          .order('created_at', ascending: true)
          .limit(20);

      return (rows as List)
          .map((m) => {
        'role': (m['sender_role'] ?? 'user').toString(),
        'content': (m['content'] ?? '').toString(),
      })
          .where((m) => m['content']!.isNotEmpty)
          .toList();
    } catch (e) {
      debugPrint("History fetch error: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isMenuOpen = false),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          centerTitle: true,
          title: const Text("AI CONSULTANT",
              style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: const Icon(Icons.history, color: AppColors.primaryColor),
              onPressed: () async {
                final selectedSessionId = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(builder: (context) => const AiChatHistoryScreen()),
                );

                if (selectedSessionId != null && mounted) {
                  setState(() {
                    _currentSessionId = selectedSessionId;
                  });
                }
              },
            )
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
            : Stack(
          children: [
            Column(
              children: [
                Expanded(child: _buildMessagesStream()),
                _buildInputArea(),
              ],
            ),
            if (_isMenuOpen)
              Positioned(bottom: 90, left: 20, child: _buildSimpleMenu()),
          ],
        ),
      ),
    );
  }

  Widget _buildMessagesStream() {
    if (_currentSessionId == null) return const SizedBox();
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase
          .from('AI_Messages')
          .stream(primaryKey: ['message_id'])
          .eq('session_id', _currentSessionId!)
          .order('created_at', ascending: true),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading messages", style: TextStyle(color: AppColors.errorColor)));
        }
        if (!snapshot.hasData) return const SizedBox();

        // --- Ø§Ù„ØªØ¹Ø¯ÙŠÙ„ Ù‡Ù†Ø§: ÙØ±Ø² Ø§Ù„Ø±Ø³Ø§Ø¦Ù„ ÙŠØ¯ÙˆÙŠØ§Ù‹ Ù„Ø¶Ù…Ø§Ù† Ø§Ù„ØªØ±ØªÙŠØ¨ ---
        final messages = List<Map<String, dynamic>>.from(snapshot.data!);
        messages.sort((a, b) {
          DateTime timeA = DateTime.tryParse(a['created_at']?.toString() ?? '') ?? DateTime.now();
          DateTime timeB = DateTime.tryParse(b['created_at']?.toString() ?? '') ?? DateTime.now();
          return timeA.compareTo(timeB);
        });

        final itemCount = messages.length + (_isAiTyping ? 1 : 0);

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index < messages.length) {
              return _buildChatBubble(messages[index]);
            }
            return _buildTypingIndicator();
          },
        );
      },
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.secondary1Color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(Map<String, dynamic> msg) {
    bool isAi = msg['sender_role'] == 'assistant';
    String time = "";
    try {
      if (msg['created_at'] != null) {
        time = DateFormat('h:mm a').format(
            DateTime.parse(msg['created_at']).toUtc().toLocal()
        );
      }
    } catch (_) {}

    return Padding(
      key: ValueKey(msg['message_id']),
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: isAi ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
            decoration: BoxDecoration(
              color: isAi ? AppColors.secondary1Color : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (msg['content'] != null && msg['content'].toString().isNotEmpty)
                  Text(
                    msg['content'],
                    style: TextStyle(color: isAi ? AppColors.blackColor : Colors.white),
                  ),
                if (msg['file_url'] != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isAi ? AppColors.grayColor.withAlpha(40) : Colors.white.withAlpha(30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.insert_drive_file, size: 18, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            msg['file_name'] ?? "File",
                            style: const TextStyle(color: Colors.blueAccent, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 4, left: 4),
            child: Text(time, style: const TextStyle(fontSize: 10, color: AppColors.grayColor)),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
      child: Column(
        children: [
          if (_selectedFile != null) _buildFilePreview(),
          Row(
            children: [
              IconButton(
                icon: Icon(_isMenuOpen ? Icons.close : Icons.add_circle_outline,
                    color: AppColors.primaryColor, size: 30),
                onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
              ),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  focusNode: _messageFocusNode,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    filled: true,
                    fillColor: AppColors.secondary1Color,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _handleSendMessage,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                  child: _isSending
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Icon(Icons.send, color: Colors.white, size: 20),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleMenu() {
    return Material(
      elevation: 8,
      shadowColor: AppColors.blackColor.withAlpha(50),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 170,
        decoration: BoxDecoration(color: AppColors.secondary2Color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: SvgPicture.asset('assets/icons/ai_chatbot.svg', width: 20, height: 20, color: AppColors.primaryColor),
              title: const Text("New Chat", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() {
                  _isMenuOpen = false;
                  _selectedFile = null;
                  _selectedFileName = null;
                });
                final user = _supabase.auth.currentUser;
                if (user != null) _createNewChatSession(user.id);
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.attach_file, color: AppColors.primaryColor),
              title: const Text("Upload File", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
              onTap: _pickFile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePreview() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.secondary1Color, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          const Icon(Icons.file_copy, color: AppColors.primaryColor),
          const SizedBox(width: 10),
          Expanded(child: Text(_selectedFileName ?? "File", style: const TextStyle(fontWeight: FontWeight.bold))),
          IconButton(
            icon: const Icon(Icons.cancel, color: AppColors.errorColor),
            onPressed: () => setState(() { _selectedFile = null; _selectedFileName = null; }),
          ),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\ai_chatbot\presentation\pages\ai_chat_history_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/features/ai_chatbot/data/models/ai_chat_model.dart';
import 'ai_chatbot_screen.dart' show kAiBackendBaseUrl;

class AiChatHistoryScreen extends StatefulWidget {
  const AiChatHistoryScreen({super.key});

  @override
  State<AiChatHistoryScreen> createState() => _AiChatHistoryScreenState();
}

class _AiChatHistoryScreenState extends State<AiChatHistoryScreen> {
  final _supabase = Supabase.instance.client;
  final _dio = Dio();

  List<AiSession> _allSessions = [];
  List<AiSession> _filteredSessions = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchHistory();
    _searchController.addListener(_filterChats);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchHistory() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      final data = await _supabase
          .from('AI_Sessions')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      final sessions =
      (data as List).map((json) => AiSession.fromJson(json)).toList();

      if (mounted) {
        setState(() {
          _allSessions = sessions;
          _filteredSessions = _allSessions;
          _isLoading = false;
        });
      }

      // After showing the list, lazily generate smart titles for any
      // sessions that still have the default "Chat <date/time>" title
      // and already have at least one AI reply to base a title on.
      _generateMissingTitles(sessions);
    } catch (e) {
      debugPrint("History Error: $e");
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _generateMissingTitles(List<AiSession> sessions) async {
    for (final session in sessions) {
      final hasDefaultTitle = session.title.startsWith('Chat ');
      final hasReply = session.lastMessageSnippet != null &&
          session.lastMessageSnippet!.trim().isNotEmpty;

      if (!hasDefaultTitle || !hasReply) continue;

      try {
        final response = await _dio.post(
          '$kAiBackendBaseUrl/generate-title',
          data: FormData.fromMap({'session_id': session.sessionId}),
        );

        final newTitle = response.data is Map ? response.data['title'] : null;
        if (newTitle == null || newTitle is! String || !mounted) continue;

        setState(() {
          _allSessions = _allSessions
              .map((s) => s.sessionId == session.sessionId
              ? AiSession(
            sessionId: s.sessionId,
            userId: s.userId,
            title: newTitle,
            lastMessageSnippet: s.lastMessageSnippet,
            createdAt: s.createdAt,
          )
              : s)
              .toList();
          _filterChats();
        });
      } catch (e) {
        debugPrint("Title gen error for ${session.sessionId}: $e");
      }
    }
  }

  void _filterChats() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSessions = _allSessions.where((session) {
        return session.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  String _formatDate(DateTime date) {
    DateTime now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return DateFormat('h:mm a').format(date.toLocal());
    } else {
      return DateFormat('MMM d, yyyy').format(date.toLocal());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Chat History",
          style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search conversations...",
                prefixIcon: const Icon(Icons.search, color: AppColors.grayColor),
                filled: true,
                fillColor: AppColors.secondary1Color,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                : _filteredSessions.isEmpty
                ? const Center(child: Text("No history found", style: TextStyle(color: AppColors.grayColor)))
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredSessions.length,
              itemBuilder: (context, index) {
                final session = _filteredSessions[index];
                return _buildChatCard(session);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatCard(AiSession session) {
    String formattedSubDate = DateFormat('MMM d, yyyy').format(session.createdAt.toLocal()).toUpperCase();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: AppColors.blackColor.withAlpha(10),
              blurRadius: 5
          )
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.secondary1Color,
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(
            'assets/icons/ai_chatbot.svg',
            width: 24,
            height: 24,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
                  session.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
                  overflow: TextOverflow.ellipsis,
                )
            ),
            const SizedBox(width: 8),
            Text(
                _formatDate(session.createdAt),
                style: const TextStyle(color: AppColors.grayColor, fontSize: 12)
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            formattedSubDate,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.grayColor),
          ),
        ),
        onTap: () {
          Navigator.pop(context, session.sessionId);
        },
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\data\services\auth_service.dart
`dart
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> login(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<String> updateUserSessionAndGetRole(String userId) async {
    await _supabase
        .from('User')
        .update({'last_login': DateTime.now().toIso8601String()})
        .eq('userid', userId);

    Map<String, dynamic>? data;
    for (int i = 0; i < 2; i++) {
      data = await _supabase
          .from('User')
          .select('role')
          .eq('userid', userId)
          .maybeSingle();
      if (data != null) break;
      await Future.delayed(const Duration(seconds: 1));
    }

    if (data == null) {
      throw 'User record not found in database.';
    }

    return data['role'] ?? 'Unknown';
  }

  Future<Map<String, dynamic>?> checkUserRecord(String userId) async {
    return await _supabase
        .from('User')
        .select()
        .eq('userid', userId)
        .maybeSingle();
  }

  Future<void> createUserRecord({
    required String userId,
    required String email,
    required String name,
    required String role,
  }) async {
    await _supabase.from('User').upsert({
      'userid': userId,
      'FullName': name,
      'email': email,
      'role': role,
      'createdat': DateTime.now().toIso8601String(),
    });
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': name,
        'user_type': role,
      },
    );
  }

  Future<void> signInWithOAuth(OAuthProvider provider) async {
    await _supabase.auth.signInWithOAuth(
      provider,
      redirectTo: 'io.supabase.flutter://login-callback',
    );
  }

  Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(
      email,
      redirectTo: 'io.supabase.flutter://login-callback',
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\pages\forgot_password_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/services/auth_service.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  Future<void> _handleReset() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showSnackBar('Please enter your email address', AppColors.errorColor);
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar('Please enter a valid email address', AppColors.errorColor);
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _authService.resetPassword(email);
      if (mounted) {
        _showSnackBar('Password reset link sent to your email!', AppColors.green1Color);
        Navigator.pop(context);
      }
    } on AuthException catch (error) {
      _showSnackBar(error.message, AppColors.errorColor);
    } catch (error) {
      _showSnackBar('Error: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.blackColor),
        title: const Text("Reset Password", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(30),
              const Text(
                "Forgot Your Password?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor),
              ),
              const Gap(10),
              const Text(
                "Enter your email address and we will send you a link to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grayColor, fontSize: 14, height: 1.5),
              ),
              const Gap(40),
              AuthTextField(controller: _emailController, label: "Email Address", hint: "name@example.com", icon: Icons.email_outlined),
              const Gap(10),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _handleReset,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Send Reset Link", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\pages\login_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/services/auth_service.dart';
import 'package:investra/core/styles/colors.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import 'role_selection_screen.dart';
import 'package:investra/features/onboarding/presentation/pages/onboarding_screen.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_button.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_entrepreneur_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_investor_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _obscurePassword = true;
  dynamic _authSubscription;

  @override
  void initState() {
    super.initState();
    // Ù…Ø±Ø§Ù‚Ø¨Ø© Ø§Ù„Ø¯Ø®ÙˆÙ„ Ø§Ù„Ø°ÙƒÙŠ Ù„Ù„Ù€ OAuth (Ø¬ÙˆØ¬Ù„)
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      if (session != null && data.event == AuthChangeEvent.signedIn) {
        final userRecord = await _authService.checkUserRecord(session.user.id);

        if (mounted) {
          // Ø§Ù„ÙØ­Øµ Ø§Ù„Ø°ÙƒÙŠ: Ù„Ù„ØªØ£ÙƒØ¯ Ù…Ù† Ø£Ù† Ø§Ù„Ø³Ø¬Ù„ Ù…ÙˆØ¬ÙˆØ¯ ÙˆÙ…Ø®ØªØ§Ø± Ø±ÙˆÙ„ Ø­Ù‚ÙŠÙ‚ÙŠ ÙˆÙ„ÙŠØ³ ÙØ§Ø±ØºØ§Ù‹ Ø¨Ø³Ø¨Ø¨ Ø§Ù„ØªØ±ÙŠØ¬Ø±
          if (userRecord != null && userRecord['role'] != null && userRecord['role'].toString().isNotEmpty && userRecord['role'] != 'Unknown') {
            final userRole = await _authService.updateUserSessionAndGetRole(session.user.id);
            _navigateBasedOnRole(userRole);
          } else {
            // Ù…Ø³ØªØ®Ø¯Ù… Ø¬Ø¯ÙŠØ¯ Ù…Ø³Ø¬Ù„ Ø¨Ø¬ÙˆØ¬Ù„ -> Ù†Ø­ÙˆÙ„Ù‡ Ù„Ø´Ø§Ø´Ø© Ø§Ø®ØªÙŠØ§Ø± Ø§Ù„Ù€ Role Ù„ØªÙƒÙ…Ù„Ø© Ø¨ÙŠØ§Ù†Ø§ØªÙ‡ Ø£ÙˆÙ„ Ù…Ø±Ø©
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill in all fields', AppColors.errorColor);
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar('Please enter a valid email address', AppColors.errorColor);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _authService.login(email, password);
      if (response.user != null) {
        final userRole = await _authService.updateUserSessionAndGetRole(response.user!.id);
        if (mounted) {
          _showSnackBar('Login Completed Successfully!', AppColors.green1Color);
          _navigateBasedOnRole(userRole);
        }
      }
    } on AuthException catch (error) {
      String msg = error.message == 'Invalid login credentials' ? 'Wrong email or password.' : error.message;
      _showSnackBar(msg, AppColors.errorColor);
    } catch (error) {
      _showSnackBar('Error: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: color),
      );
    }
  }

  void _navigateBasedOnRole(String role) {
    final Widget nextScreen = (role == 'Investor') ? const MainAppInvestorScreen() : const MainAppEntrepreneurScreen();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            );
          },
        ),
        title: const Text(
          "Investra",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(40),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                textAlign: TextAlign.center,
              ),
              const Gap(12),
              const Text(
                "Manage your portfolio and track\ninvestments",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grayColor, fontSize: 16, height: 1.5),
              ),
              const Gap(40),
              AuthTextField(controller: _emailController, label: "Email Address", hint: "name@example.com", icon: Icons.email_outlined),
              AuthTextField(
                controller: _passwordController,
                label: "Password",
                hint: "********",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                  child: const Text("Forgot Password?", style: TextStyle(color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              const Gap(24),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Log In", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const Gap(40),
              const Row(
                children: [
                  Expanded(child: Divider(color: AppColors.bgGray)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("OR CONTINUE WITH", style: TextStyle(color: AppColors.grayColor, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider(color: AppColors.bgGray)),
                ],
              ),
              const Gap(24),
              SocialAuthButton(
                label: "Continue with Google",
                iconPath: 'assets/icons/google_svg.svg',
                onPressed: () => _authService.signInWithOAuth(OAuthProvider.google),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(color: AppColors.grayColor, fontSize: 14)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationScreen())),
                    child: const Text("Sign up for free", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\pages\register_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/services/auth_service.dart';
import 'login_screen.dart';
import 'role_selection_screen.dart';
import 'package:investra/features/onboarding/presentation/pages/onboarding_screen.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_button.dart';
import '../widgets/account_type_toggle.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_entrepreneur_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_investor_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedType = "Investor";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _obscurePassword = true;
  dynamic _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      if (session != null && data.event == AuthChangeEvent.signedIn) {
        final userRecord = await _authService.checkUserRecord(session.user.id);
        if (mounted) {


          if (userRecord != null && userRecord['role'] != null && userRecord['role'].toString().isNotEmpty && userRecord['role'] != 'Unknown') {
            final userRole = await _authService.updateUserSessionAndGetRole(session.user.id);
            final Widget nextScreen = (userRole == 'Investor') ? const MainAppInvestorScreen() : const MainAppEntrepreneurScreen();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
          } else {


            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  bool _isPasswordSecure(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$').hasMatch(password);
  }

  Future<void> _signUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill in all fields', AppColors.errorColor);
      return;
    }

    if (name.length < 3) {
      _showSnackBar('Name must be at least 3 characters', AppColors.errorColor);
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar('Please enter a valid email address', AppColors.errorColor);
      return;
    }

    if (!_isPasswordSecure(password)) {
      _showSnackBar('Password must be at least 8 characters and contain both letters and numbers', AppColors.errorColor);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _authService.signUp(email: email, password: password, name: name, role: selectedType);
      if (mounted && response.user != null) {
        _showSnackBar('Registration successful! Please check your email.', AppColors.green1Color);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } on AuthException catch (error) {
      _showSnackBar(error.message, AppColors.errorColor);
    } catch (error) {
      _showSnackBar('Error: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            );
          },
        ),
        title: const Text("Create Account", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(15),
              _buildHeroImage(),
              const Gap(20),
              const Text("Account Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.grayColor)),
              const Gap(8),
              AccountTypeToggle(selectedType: selectedType, onTypeChanged: (type) => setState(() => selectedType = type)),
              const Gap(20),
              AuthTextField(controller: _nameController, label: "Full Name", hint: "John Doe", icon: Icons.person_outline),
              AuthTextField(controller: _emailController, label: "Email Address", hint: "john@example.com", icon: Icons.email_outlined),
              AuthTextField(
                controller: _passwordController,
                label: "Password",
                hint: "********",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              const Gap(5),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _signUp,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Create Account", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const Gap(15),
              _buildLoginLink(),
              const Gap(20),
              _buildSocialAuthRow(),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroImage() => Container(
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: const DecorationImage(image: AssetImage('assets/images/Background.png'), fit: BoxFit.cover),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [Colors.black.withOpacity(0.8), Colors.transparent], begin: Alignment.bottomLeft),
      ),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Join Investra", style: TextStyle(color: AppColors.bgColor, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1)),
          Gap(4),
          Text("Start your investment journey or pitch your\nnext big idea today.", style: TextStyle(color: AppColors.secondary1Color, fontSize: 12, height: 1.3)),
        ],
      ),
    ),
  );

  Widget _buildLoginLink() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Already have an account? ", style: TextStyle(color: AppColors.grayColor, fontSize: 14)),
      GestureDetector(
        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
        child: const Text("Log in", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    ],
  );

  Widget _buildSocialAuthRow() => Column(
    children: [
      const Row(
        children: [
          Expanded(child: Divider(color: AppColors.bgGray)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("OR REGISTER WITH", style: TextStyle(color: AppColors.grayColor, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Divider(color: AppColors.bgGray)),
        ],
      ),
      const Gap(15),
      SocialAuthButton(
        label: "Continue with Google",
        iconPath: 'assets/icons/google_svg.svg',
        onPressed: () => _authService.signInWithOAuth(OAuthProvider.google),
      ),
    ],
  );
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\pages\role_selection_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/services/auth_service.dart';
import '../widgets/account_type_toggle.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_entrepreneur_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_investor_screen.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedType = "Investor";
  final _authService = AuthService();
  bool _isLoading = false;

  Future<void> _completeRegistration() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      final String fullName = user.userMetadata?['full_name'] ?? user.userMetadata?['name'] ?? 'Google User';
      final String email = user.email ?? '';

      await _authService.createUserRecord(
        userId: user.id,
        name: fullName,
        email: email,
        role: selectedType,
      );

      if (mounted) {
        _showSnackBar('Account setup completed successfully!', AppColors.green1Color);
        _navigateBasedOnRole(selectedType);
      }
    } catch (error) {
      _showSnackBar('Error saving account profile: $error', AppColors.errorColor);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _navigateBasedOnRole(String role) {
    final Widget nextScreen = (role == 'Investor') ? const MainAppInvestorScreen() : const MainAppEntrepreneurScreen();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Complete Your Profile", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "One Last Step!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.blackColor),
              ),
              const Gap(10),
              const Text(
                "Please select your account type to personalize your Investra experience.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grayColor, fontSize: 14, height: 1.5),
              ),
              const Gap(40),
              const Text("Account Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.grayColor)),
              const Gap(8),
              AccountTypeToggle(
                selectedType: selectedType,
                onTypeChanged: (type) => setState(() => selectedType = type),
              ),
              const Gap(40),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : _completeRegistration,
                  child: _isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.bgColor, strokeWidth: 2))
                      : const Text("Get Started", style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\widgets\account_type_toggle.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class AccountTypeToggle extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const AccountTypeToggle({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: _buildToggleBtn("Investor")),
          Expanded(child: _buildToggleBtn("Entrepreneur")),
        ],
      ),
    );
  }

  Widget _buildToggleBtn(String type) {
    final bool isActive = selectedType == type;
    return GestureDetector(
      onTap: () => onTypeChanged(type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? AppColors.bgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isActive ? [BoxShadow(color: AppColors.blackColor.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))] : null,
        ),
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? AppColors.primaryColor : AppColors.grayColor,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\widgets\auth_text_field.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 56,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: const TextStyle(fontSize: 15, color: AppColors.blackColor),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: AppColors.grayColor, fontSize: 15),
                filled: true,
                fillColor: AppColors.secondary2Color,
                prefixIcon: Icon(icon, color: AppColors.grayColor, size: 20),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.secondary1Color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                ),
                suffixIcon: isPassword && onToggleVisibility != null
                    ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: AppColors.grayColor,
                    size: 20,
                  ),
                  onPressed: onToggleVisibility,
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\auth\presentation\widgets\social_auth_button.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/core/styles/colors.dart';

class SocialAuthButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0),
          side: const BorderSide(color: AppColors.secondary1Color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: AppColors.secondary2Color,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconPath.endsWith('.svg')
                ? SvgPicture.asset(iconPath, width: 16)
                : Image.asset(iconPath, width: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\help\presentation\pages\help_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/settings/presentation/widgets/build_icon_container.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor, // Ø§Ø³ØªØ®Ø¯Ø§Ù… Ù„ÙˆÙ† Ø§Ù„Ø®Ù„ÙÙŠØ© Ø§Ù„Ù…ÙˆØ­Ø¯ Ù„Ù„ØªØ·Ø¨ÙŠÙ‚
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "How can we help?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 25),

            // Ù‚Ø³Ù… Ø§Ù„Ø£Ø³Ø¦Ù„Ø© Ø§Ù„Ø´Ø§Ø¦Ø¹Ø© Ø§Ù„Ù…Ø¯Ù…Ø¬ (ØªÙØªØ­ ÙˆØªØºÙ„Ù‚ ÙÙŠ Ù†ÙØ³ Ø§Ù„ØµÙØ­Ø©)
            const Text(
              "Top Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFAQExpandable(
              "How do I start investing?",
              "You can start by choosing a project from the marketplace and clicking 'Invest Now'.",
            ),
            _buildFAQExpandable(
              "Is my data secure?",
              "Yes, Investra uses bank-grade encryption to protect your financial and personal data.",
            ),
            _buildFAQExpandable(
              "How to withdraw profits?",
              "Profits can be withdrawn directly to your linked bank account after the project cycle ends.",
            ),

            const SizedBox(height: 35),

            // Ù‚Ø³Ù… Ø§Ù„ØªÙˆØ§ØµÙ„ Ø§Ù„Ù…Ø¨Ø§Ø´Ø±
            const Text(
              "Contact Us Directly",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            _buildContactOption(
              icon: Icons.headset_mic_outlined,
              title: "Live Support",
              trailingText: "Online",
            ),
            _buildContactOption(
              icon: Icons.mail_outline_rounded,
              title: "Email Us",
              trailingText: "support@investra.com",
            ),
            _buildContactOption(
              icon: Icons.phone_outlined,
              title: "Phone",
              trailingText: "+201007410619",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ÙˆÙŠØ¯Ø¬ÙŠØª Ù„Ù„Ø£Ø³Ø¦Ù„Ø© Ø§Ù„Ø´Ø§Ø¦Ø¹Ø© Ø§Ù„ØªÙŠ ØªÙØªØ­ ÙÙŠ Ù†ÙØ³ Ø§Ù„Ù…ÙƒØ§Ù†
  Widget _buildFAQExpandable(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        iconColor: AppColors.primaryColor,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              answer,
              style: const TextStyle(color: AppColors.darkGray, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // ÙˆÙŠØ¯Ø¬ÙŠØª Ù„Ø®ÙŠØ§Ø±Ø§Øª Ø§Ù„ØªÙˆØ§ØµÙ„
  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          buildIconContainer(
            icon: Icon(icon, color: AppColors.primaryColor, size: 22),
          ),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          Text(
            trailingText,
            style: const TextStyle(color: AppColors.grayColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\pages\entrepreneur_home_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/home/presentation/pages/entrepreneur_idea_details_screen.dart';
import 'package:investra/features/home/presentation/widgets/build_chat_request.dart';
import 'package:investra/features/home/presentation/widgets/build_idea_card.dart';
import 'package:investra/features/home/presentation/widgets/build_section_header.dart';
import 'package:investra/features/home/presentation/widgets/build_submission_card.dart';
import 'package:investra/features/home/presentation/widgets/build_submit_button.dart';
import 'package:investra/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EntrepreneurHomeScreen extends StatelessWidget {
  final ScrollController? scrollController;

  const EntrepreneurHomeScreen({super.key, this.scrollController});

  Future<String> getUserName(String userId) async {
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase
          .from('User')
          .select('FullName')
          .eq('userid', userId)
          .maybeSingle();
      return data?['FullName']?.toString() ?? 'Entrepreneur';
    } catch (e) {
      return 'User';
    }
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id ?? '';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          ' Investra',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          _buildNotificationIcon(supabase, userId),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: supabase
                .from('ideas')
                .stream(primaryKey: ['id']).eq('entrepreneur_id', userId),
            builder: (context, snapshot) {
              final ideasList = snapshot.data ?? [];
              final int count = ideasList.length;
              final bool reachedLimit = count >= 2;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(userId),
                  const SizedBox(height: 24),
                  // âœ… Ø§Ù„Ù€ submission card ÙŠØ¹Ø±Ø¶ Ø§Ù„Ù€ limit ØªÙ„Ù‚Ø§Ø¦ÙŠØ§Ù‹
                  BuildSubmissionCard(
                    currentCount: count,
                    maxLimit: 2,
                    remainingSlots: (2 - count).clamp(0, 2),
                  ),
                  const SizedBox(height: 24),
                  const BuildSectionHeader(
                    title: 'Your Active Ideas',
                    action: '',
                  ),
                  const SizedBox(height: 8),
                  _buildIdeaSection(context, ideasList),
                  // âœ… Ø²Ø± Submit Ø¨Ø³ Ø¥Ø°Ø§ Ù…Ø§ ÙˆØµÙ„ Ø§Ù„Ù€ limit â€” Ø¨Ø¯ÙˆÙ† Ø±Ø³Ø§Ù„Ø© Ø¥Ø¶Ø§ÙÙŠØ©
                  if (!reachedLimit) ...[
                    const SizedBox(height: 12),
                    const BuildSubmitButton(),
                  ],
                  const SizedBox(height: 24),
                  const BuildSectionHeader(
                    title: 'Recent Chat Requests',
                    action: '',
                  ),
                  const SizedBox(height: 8),
                  _buildChatRequestsStream(supabase, userId),
                  const SizedBox(height: 80),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String userId) {
    return FutureBuilder<String>(
      future: getUserName(userId),
      builder: (context, nameSnapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, ${nameSnapshot.data ?? '...'}!',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            const Text(
              'Ready to scale your next big thing?',
              style: TextStyle(fontSize: 14, color: AppColors.gray2Color),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChatRequestsStream(SupabaseClient supabase, String userId) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase
          .from('requests')
          .stream(primaryKey: ['id']).eq('receiver_id', userId),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildEmptyState('No requests found.');
        }

        final pendingChatRequests = snapshot.data!.where((req) {
          final isPending = req['status'] == 'pending';
          final content = (req['content'] ?? '').toString().toLowerCase();
          final isInvestment = content.contains('investment') ||
              req['type'] == 'invest';
          return isPending && !isInvestment;
        }).take(3).toList();

        if (pendingChatRequests.isEmpty) {
          return _buildEmptyState('No pending chat requests.');
        }

        return Column(
          children: pendingChatRequests.map((req) {
            final String requestId = req['id'].toString();
            final String investorId = req['sender_id'] ?? '';
            final String? ideaId = req['idea_id']?.toString();

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BuildChatRequest(
                name: 'Investor Inquiry',
                company: req['content'] ?? 'Interested in your idea',
                icon: Icons.chat_bubble_outline,
                onAcceptTap: () => _processAccept(
                  supabase,
                  requestId,
                  userId,
                  investorId,
                  ideaId,
                  context,
                ),

                onDeclineTap: () =>
                    _processDecline(supabase, requestId, context),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> _processAccept(
      SupabaseClient supabase,
      String requestId,
      String userId,
      String investorId,
      String? ideaId,
      BuildContext context,
      ) async {
    try {
      await supabase
          .from('requests')
          .update({'status': 'accepted'}).eq('id', requestId);

      if (ideaId != null) {
        final existingChat = await supabase
            .from('chat')
            .select('chat_id')
            .eq('entrepreneur_id', userId)
            .eq('investor_id', investorId)
            .eq('idea_id', ideaId)
            .maybeSingle();

        if (existingChat == null) {
          await supabase.from('chat').insert({
            'entrepreneur_id': userId,
            'investor_id': investorId,
            'idea_id': ideaId,
          });
        }

        await supabase.from('notifications').insert({
          'user_id': investorId,
          'title': 'Request Accepted! ðŸŽ‰',
          'content':
          'Your request has been accepted. You can start chatting now!',
          'type': 'chat_accepted',
          'is_read': false,
          'idea_id': ideaId,
          'request_id': requestId,
        });
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chat created! Connection established.')),
        );
      }
    } catch (e) {
      debugPrint('Error accepting request: $e');
    }
  }

  Future<void> _processDecline(
      SupabaseClient supabase,
      String requestId,
      BuildContext context,
      ) async {
    try {
      await supabase
          .from('requests')
          .update({'status': 'rejected'}).eq('id', requestId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Request declined.')),
        );
      }
    } catch (e) {
      debugPrint('Error declining request: $e');
    }
  }

  Widget _buildIdeaSection(
      BuildContext context,
      List<Map<String, dynamic>> ideasList,
      ) {
    if (ideasList.isEmpty) {
      return _buildEmptyState('No ideas posted yet.');
    }

    ideasList.sort((a, b) {
      final aDate = a['created_at'];
      final bDate = b['created_at'];
      if (aDate == null && bDate == null) return 0;
      if (aDate == null) return 1;
      if (bDate == null) return -1;
      return bDate.toString().compareTo(aDate.toString());
    });

    return Column(
      children: ideasList.map((idea) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      EntrepreneurIdeaDetailsScreen(ideaData: idea),
                ),
              );
            },
            child: BuildIdeaCard(
              title: idea['title'] ?? 'Untitled',
              description: idea['description'] ?? 'No Description',
              aiScore: idea['ai_rating']?.toString() ?? '0.0',
              views: idea['views']?.toString() ?? '0',
              viewTrend: idea['trend']?.toString() ?? '+0%',
              activeInquiries: idea['inquiries_count'] ?? 0,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNotificationIcon(SupabaseClient supabase, String userId) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase
          .from('notifications')
          .stream(primaryKey: ['id']).eq('user_id', userId),
      builder: (context, snapshot) {
        final hasUnread = snapshot.data?.any((n) => !n['is_read']) ?? false;
        return IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsScreen(),
            ),
          ),
          icon: Stack(
            children: [
              SvgPicture.asset(
                AppImages.notificationSvg,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              if (hasUnread)
                Positioned(
                  right: 0,
                  top: 0,
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
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String msg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary1Color),
      ),
      child: Center(
        child: Text(
          msg,
          style: const TextStyle(color: AppColors.grayColor),
        ),
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\pages\entrepreneur_idea_details_screen.dart
`dart
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// ðŸ“ Ø§Ù„Ù…Ø³Ø§Ø±: lib/features/home/presentation/pages/entrepreneur_idea_details_screen.dart
// â„¹ï¸  Ø§Ø³ØªØ¨Ø¯Ù„ Ø§Ù„Ù…Ù„Ù Ø§Ù„Ù‚Ø¯ÙŠÙ… Ø¨Ù‡Ø°Ø§ Ø§Ù„Ù…Ù„Ù Ø¨Ø§Ù„ÙƒØ§Ù…Ù„
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

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

  // âœ… ÙŠØªÙ… ØªÙ…Ø±ÙŠØ±Ù‡Ù… ÙÙ‚Ø· Ù„Ù…Ø§ Ø§Ù„Ø´Ø§Ø´Ø© Ø¨ØªÙÙØªØ­ Ù…Ù† Ø¥Ø´Ø¹Ø§Ø± Ø§Ø³ØªØ«Ù…Ø§Ø±:
  // investorId = Ù‡ÙˆÙŠØ© Ø§Ù„Ù…Ø³ØªØ«Ù…Ø± Ø§Ù„Ù„ÙŠ Ù‚Ø¯Ù‘Ù… Ø§Ù„Ø·Ù„Ø¨ (sender_id Ù…Ù† Ø¬Ø¯ÙˆÙ„ requests)
  // requestId  = id Ø§Ù„Ø·Ù„Ø¨ Ù†ÙØ³Ù‡ (Ù…Ù† Ø¬Ø¯ÙˆÙ„ requests) Ø¹Ø´Ø§Ù† Ù†Ø­Ø¯Ù‘Ø« Ø­Ø§Ù„ØªÙ‡ Ø¨Ø¹Ø¯ Ø§Ù„ØªÙ…ÙˆÙŠÙ„
  final String? investorId;
  final String? requestId;

  const EntrepreneurIdeaDetailsScreen({
    super.key,
    required this.ideaData,
    this.investorId,
    this.requestId,
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

  // âœ… Ù‚Ø§Ø¦Ù…Ø© Ø§Ù„Ø¹Ù‚ÙˆØ¯ Ø§Ù„Ø¬Ø¯ÙŠØ¯Ø© (Ø¨ØªØªØ±ÙØ¹ ÙÙŠ bucket 'contracts')
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
    // âœ… Ø§Ù„Ø¹Ù‚ÙˆØ¯ Ø§Ù„Ù„ÙŠ Ø§ØªØ±ÙØ¹Øª ÙÙŠ bucket contracts Ø¨ØªÙŠØ¬ÙŠ URL ÙÙŠÙ‡ ÙƒÙ„Ù…Ø© contracts
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

    // âœ… Ù†Ø­ÙØ¸ Ù‡Ø§ÙŠ Ø§Ù„Ù‚ÙŠÙ…Ø© Ù‡Ù†Ø§ Ù‚Ø¨Ù„ Ù…Ø§ Ù†ÙØ¶ÙŠ Ø§Ù„Ù‚Ø§ÙŠÙ…Ø© Ø¨Ø§Ù„Ø£Ø³ÙÙ„ Ø¨Ø¹Ø¯ Ø§Ù„Ø±ÙØ¹ØŒ
    // Ù„Ø£Ù†Ù‡Ø§ Ø¨ØªØ­Ø¯Ø¯ Ø¥Ø°Ø§ Ù„Ø§Ø²Ù… Ù†Ø¹Ù…Ù„ Ø¹Ù…Ù„ÙŠØ© "Funding" ÙƒØ§Ù…Ù„Ø© Ø¨Ø¹Ø¯ Ø§Ù„Ø­ÙØ¸.
    final bool hadNewContract = _newContractFiles.isNotEmpty;

    try {
      List<String> updatedDocUrls = List.from(_existingDocUrls);

      // 1) Ø±ÙØ¹ Ø§Ù„Ù…Ù„ÙØ§Øª Ø§Ù„Ø¨Ø¯ÙŠÙ„Ø© ÙÙŠ ideas_docs (Ù†ÙØ³ Ø§Ù„Ù€ bucket Ø§Ù„Ø£ØµÙ„ÙŠ)
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

      // âœ… 2) Ø±ÙØ¹ Ø§Ù„Ø¹Ù‚ÙˆØ¯ Ø§Ù„Ø¬Ø¯ÙŠØ¯Ø© ÙÙŠ bucket Ù…Ù†ÙØµÙ„ Ø§Ø³Ù…Ù‡ 'contracts'
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

      // 3) ØªØ­Ø¯ÙŠØ« Ø¬Ø¯ÙˆÙ„ ideas (Ø§Ù„Ø¹Ù†ÙˆØ§Ù†ØŒ Ø§Ù„ÙˆØµÙØŒ Ø§Ù„ØªØµÙ†ÙŠÙØŒ Ø§Ù„Ù…Ø³ØªÙ†Ø¯Ø§Øª)
      await _supabase.from('ideas').update({
        'title': _titleController.text.trim(),
        'description': _pitchController.text.trim(),
        'category': _category ?? _originalCategory,
        'idea_docs': updatedDocUrls,
      }).eq('id', ideaId);

      // âœ… 4) Ù„Ùˆ Ù‡Ø§ÙŠ Ø§Ù„Ø´Ø§Ø´Ø© Ù…ÙØªÙˆØ­Ø© Ù…Ù† Ø¥Ø´Ø¹Ø§Ø± Ø§Ø³ØªØ«Ù…Ø§Ø± ÙˆØªÙ… Ø±ÙØ¹ Ø¹Ù‚Ø¯ Ø¬Ø¯ÙŠØ¯ØŒ
      // Ù†Ø¹Ù…Ù„ Ø¹Ù…Ù„ÙŠØ© "ØªÙ…ÙˆÙŠÙ„" ÙƒØ§Ù…Ù„Ø©:
      //   - ØªØ­ÙˆÙŠÙ„ Ø­Ø§Ù„Ø© Ø§Ù„ÙÙƒØ±Ø© Ù…Ù† pending Ø¥Ù„Ù‰ funded
      //   - ØªØ³Ø¬ÙŠÙ„ Ø§Ù„Ø§Ø³ØªØ«Ù…Ø§Ø± Ø¨Ø¬Ø¯ÙˆÙ„ investments (Ø±Ø¨Ø· investor_id Ø¨Ù€ idea_id)
      //   - ØªØ­Ø¯ÙŠØ« Ø­Ø§Ù„Ø© Ø§Ù„Ù€ request Ø§Ù„Ù…Ø±ØªØ¨Ø· Ù„Ù€ funded
      //   - Ø¥Ø±Ø³Ø§Ù„ Ø¥Ø´Ø¹Ø§Ø± ØªØ£ÙƒÙŠØ¯ Ù„Ù„Ù…Ø³ØªØ«Ù…Ø±
      if (hadNewContract && widget.investorId != null) {
        await _supabase
            .from('ideas')
            .update({'status': 'funded'}).eq('id', ideaId);

        await _supabase.from('investments').insert({
          'investor_id': widget.investorId,
          'idea_id': ideaId,
          'investment_date': DateTime.now().toIso8601String(),
        });

        if (widget.requestId != null) {
          await _supabase
              .from('requests')
              .update({'status': 'funded'}).eq('id', widget.requestId!);
        }

        await _supabase.from('notifications').insert({
          'user_id': widget.investorId,
          'title': 'Investment Confirmed! ðŸŽ‰',
          'content':
          'Your investment in "${_titleController.text.trim()}" has been confirmed and the contract is signed.',
          'type': 'funded',
          'is_read': false,
          'idea_id': ideaId,
        });
      }

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
          const SnackBar(content: Text('Changes saved successfully! âœ…')),
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

                // â”€â”€ Idea Title â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                TextFormField(
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Idea Title',
                    hintText: 'Enter a catchy name for your idea',
                  ),
                ),
                const SizedBox(height: 16),

                // â”€â”€ Category â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

                // â”€â”€ Pitch Description â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

                // â”€â”€ Documents â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                if (hasAnyDocs) ...[
                  Text(
                    'Uploaded Documents',
                    style: textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Ø§Ù„ÙˆØ«Ø§Ø¦Ù‚ Ø§Ù„Ù…ÙˆØ¬ÙˆØ¯Ø©
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

                  // Ø§Ù„Ø¹Ù‚ÙˆØ¯ Ø§Ù„Ø¬Ø¯ÙŠØ¯Ø© (Ù„Ø³Ù‡ Ù…ØªØ±ÙØ¹ØªØ´)
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

                // â”€â”€ Add Contract Button â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                _AddContractButton(onPressed: _addContractFile),
                const SizedBox(height: 32),

                // â”€â”€ Submit Changes Button â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
                _SubmitChangesButton(
                  enabled: _hasChanges && !_isSaving,
                  isLoading: _isSaving,
                  onPressed: _saveChanges,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),

          // Loading overlay Ø£Ø«Ù†Ø§Ø¡ ÙØªØ­ Ø§Ù„Ù…Ù„Ù
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

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// WIDGETS
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

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
          // Ø§Ù„Ø¶ØºØ· Ø¹Ù„Ù‰ Ù‡Ø°Ø§ Ø§Ù„Ø¬Ø²Ø¡ ÙŠÙØªØ­ Ø§Ù„Ù…Ù„Ù
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
          // Ø£ÙŠÙ‚ÙˆÙ†Ø§Øª Ø§Ù„ÙŠÙ…ÙŠÙ† (Ø­Ø°Ù + Ø§Ø³ØªØ¨Ø¯Ø§Ù„)
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

``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\pages\home_screen.dart
`dart


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\pages\investor_home_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/home/presentation/widgets/build_filters.dart';
import 'package:investra/features/home/presentation/widgets/build_post_card.dart';
import 'package:investra/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:investra/features/idea_details/presentation/pages/idea_details_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InvestorHomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  const InvestorHomeScreen({super.key, required this.scrollController});

  @override
  State<InvestorHomeScreen> createState() => _InvestorHomeScreenState();
}

class _InvestorHomeScreenState extends State<InvestorHomeScreen> {
  String _categoryFilter = 'All';
  double _ratingFilter = 0.0;

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.secondary2Color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          ' Investra',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: supabase.from('notifications').stream(primaryKey: ['id']),
            builder: (context, snapshot) {
              final unread = snapshot.data?.where((n) =>
              n['user_id'] == userId && n['is_read'] == false)
                  .toList() ??
                  [];
              bool hasUnread = unread.isNotEmpty;

              return Stack(
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const NotificationsScreen())),
                    icon: SvgPicture.asset(AppImages.notificationSvg,
                        colorFilter: const ColorFilter.mode(
                            AppColors.primaryColor, BlendMode.srcIn)),
                  ),
                  if (hasUnread)
                    Positioned(
                        right: 12,
                        top: 12,
                        child: Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle))),
                ],
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildFilters(
                  selectedCategory: _categoryFilter,
                  selectedRating: _ratingFilter,
                  onCategoryChanged: (val) =>
                      setState(() => _categoryFilter = val),
                  onRatingChanged: (val) =>
                      setState(() => _ratingFilter = val),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Investment Opportunities',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                ),
                const SizedBox(height: 18),
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: supabase
                      .from('ideas')
                      .stream(primaryKey: ['id']).order('created_at'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return const Center(
                          child: CircularProgressIndicator());

                    var ideas = snapshot.data ?? [];

                    // âœ… ÙÙ„ØªØ± Ø§Ù„Ù€ category
                    if (_categoryFilter != 'All') {
                      ideas = ideas
                          .where((i) =>
                      (i['category']?.toString().toLowerCase() ??
                          '') ==
                          _categoryFilter.toLowerCase())
                          .toList();
                    }

                    // âœ… Ø§Ù„ØªØ¹Ø¯ÙŠÙ„: ÙÙ„ØªØ± Ø§Ù„Ù€ rating Ù…Ø·Ø¨Ù‚ Ù‡Ù„Ù‚
                    if (_ratingFilter > 0) {
                      ideas = ideas
                          .where((i) =>
                      (i['ai_rating'] ?? 0).toDouble() >=
                          _ratingFilter)
                          .toList();
                    }

                    if (ideas.isEmpty)
                      return const Center(
                          child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text("No ideas found.")));

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ideas.length,
                      itemBuilder: (context, index) {
                        final idea = ideas[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: BuildPostcard(
                            category: (idea['category'] ?? 'General')
                                .toString()
                                .toUpperCase(),
                            title: idea['title'] ?? 'No Title',
                            description: idea['description'] ?? '',
                            rating: (idea['ai_rating'] ?? 0).toDouble(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      IdeaDetailsScreen(idea: idea),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_chat_request.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildChatRequest extends StatelessWidget {
  const BuildChatRequest({
    super.key,
    required this.name,
    required this.company,
    required this.icon,
    this.onAcceptTap,   // Ø¥Ø¶Ø§ÙØ© Ø¨Ø§Ø±Ø§Ù…ÙŠØªØ± Ù‚Ø¨ÙˆÙ„ Ø§Ù„Ø·Ù„Ø¨
    this.onDeclineTap,  // Ø¥Ø¶Ø§ÙØ© Ø¨Ø§Ø±Ø§Ù…ÙŠØªØ± Ø±ÙØ¶ Ø§Ù„Ø·Ù„Ø¨
  });

  final String name;
  final String company;
  final IconData icon;
  final VoidCallback? onAcceptTap;
  final VoidCallback? onDeclineTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFF2C8C8C),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.gray2Color,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onDeclineTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.close, size: 18, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onAcceptTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.green1Color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check, size: 18, color: AppColors.secondary2Color),
            ),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_filters.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/core/styles/colors.dart';

// --- ÙˆÙŠØ¯Ø¬Øª Ø§Ù„Ø²Ø± (FilterButton) ---
class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.text,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryColor : AppColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E3E8)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.bgColor : AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 6),
            SvgPicture.asset(
              'assets/icons/down.svg',
              height: 12,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.bgColor : AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

// --- ÙˆÙŠØ¯Ø¬Øª ØªØ¬Ù…ÙŠØ¹ Ø§Ù„ÙÙ„Ø§ØªØ± (BuildFilters) Ù…Ø¹ ØªÙ†Ø³ÙŠÙ‚ Ø§Ù„Ù‚Ø§Ø¦Ù…Ø© ---
class BuildFilters extends StatelessWidget {
  final String selectedCategory;
  final double selectedRating;
  final Function(String) onCategoryChanged;
  final Function(double) onRatingChanged;

  const BuildFilters({
    super.key,
    required this.selectedCategory,
    required this.selectedRating,
    required this.onCategoryChanged,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ÙÙ„ØªØ± Ø§Ù„Ø£Ù‚Ø³Ø§Ù…
        Expanded(
          child: PopupMenuButton<String>(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: AppColors.bgColor, // Ø®Ù„ÙÙŠØ© Ø§Ù„Ù‚Ø§Ø¦Ù…Ø©
            offset: const Offset(0, 50), // ØªØ¸Ù‡Ø± Ø£Ø³ÙÙ„ Ø§Ù„Ø²Ø± Ù‚Ù„ÙŠÙ„Ø§Ù‹
            onSelected: onCategoryChanged,
            itemBuilder: (context) => ['All', 'Technology', 'Business', 'Healthtech', 'AI']
                .map((cat) => PopupMenuItem(
              value: cat,
              child: Text(
                cat,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ))
                .toList(),
            child: FilterButton(
              text: selectedCategory == 'All' ? 'Categories' : selectedCategory,
              selected: selectedCategory != 'All',
            ),
          ),
        ),
        const SizedBox(width: 10),
        // ÙÙ„ØªØ± Ø§Ù„ØªÙ‚ÙŠÙŠÙ…
        Expanded(
          child: PopupMenuButton<double>(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: AppColors.bgColor,
            offset: const Offset(0, 50),
            onSelected: onRatingChanged,
            itemBuilder: (context) => [0.0, 3.0, 4.0, 4.5]
                .map((rate) => PopupMenuItem(
              value: rate,
              child: Text(
                rate == 0.0 ? 'All Ratings' : '$rate+ Stars',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ))
                .toList(),
            child: FilterButton(
              text: selectedRating == 0.0 ? 'AI Rating' : '$selectedRating+',
              selected: selectedRating > 0,
            ),
          ),
        ),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_idea_card.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildIdeaCard extends StatelessWidget {
  final String title;
  final String description;
  final String aiScore;
  final String views;
  final String viewTrend;
  final int activeInquiries;

  const BuildIdeaCard({
    super.key,
    required this.title,
    required this.description,
    required this.aiScore,
    required this.views,
    required this.viewTrend,
    required this.activeInquiries,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary1Color),
      ),
      child: Row(
        children: [
          // Ø§Ù„Ø¹Ù†ÙˆØ§Ù† ÙˆØ§Ù„ÙˆØµÙ
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(description,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.grayColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.visibility_outlined,
                        size: 13, color: AppColors.gray2Color),
                    const SizedBox(width: 4),
                    Text('$views views',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray2Color)),
                    const SizedBox(width: 12),
                    const Icon(Icons.chat_bubble_outline,
                        size: 13, color: AppColors.gray2Color),
                    const SizedBox(width: 4),
                    Text('$activeInquiries inquiries',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray2Color)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // AI Score badge
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.lightgreen,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(Icons.bolt, size: 13, color: AppColors.green1Color),
                Text('$aiScore',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green1Color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_post_card.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildPostcard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final double rating;
  final VoidCallback? onTap; // Ø¯Ù‡ Ø§Ù„Ù„ÙŠ Ù‡ÙŠÙ†ÙØ° Ø§Ù„Ø§Ù†ØªÙ‚Ø§Ù„ Ù„Ù„ØµÙØ­Ø© Ø§Ù„ØªØ§Ù†ÙŠØ©

  const BuildPostcard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.rating,
    this.onTap,
  });

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(Icon(
        i <= rating ? Icons.star : (i - rating < 1 ? Icons.star_half : Icons.star_border),
        size: 14,
        color: AppColors.yellowColor,
      ));
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondary2Color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primaryColor),
                ),
              ),
              _buildRatingStars(rating),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.darkGray)),
          const SizedBox(height: 8),
          Text(description, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: AppColors.gray2Color)),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: onTap, // Ù‡Ù†Ø§ Ø¨Ù†Ø´ØºÙ„ Ø§Ù„Ù€ onTap Ø§Ù„Ù„ÙŠ Ø¨Ø§Ø¹ØªÙŠÙ†Ù‡ Ù…Ù† Ø§Ù„Ù‡ÙˆÙ…
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('View Details', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          )
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_search_bar.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.gray2Color, BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          const Text(
            'Search startup ideas...',
            style: TextStyle(
              color: AppColors.gray2Color,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_section_header.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSectionHeader extends StatelessWidget {
  const BuildSectionHeader({
    super.key,
    required this.title,
    required this.action,
  });

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.darkGray,
          ),
        ),
        if (action.isNotEmpty)
          Text(
            action,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          )
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_submission_card.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSubmissionCard extends StatelessWidget {
  final int currentCount;
  final int maxLimit;
  final int remainingSlots;

  const BuildSubmissionCard({
    super.key,
    required this.currentCount,
    required this.maxLimit,
    required this.remainingSlots,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = maxLimit > 0 ? (currentCount / maxLimit) : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Idea Submission Limit',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGray,
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$currentCount / $maxLimit',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 8,
              backgroundColor: const Color(0xFFD6DCE5),
              valueColor:
              const AlwaysStoppedAnimation(AppColors.primaryColor),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            '$remainingSlots slots remaining for your account',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.gray2Color,
            ),
          ),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\build_submit_button.dart
`dart
// import 'package:flutter/material.dart';
// import 'package:investra/core/styles/colors.dart';

// class BuildSubmitButton extends StatelessWidget {
//   const BuildSubmitButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 56,
//       decoration: BoxDecoration(
//         color: AppColors.primaryColor,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x22000000),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           )
//         ],
//       ),
//       child: const Center(
//         child: Text(
//           'âŠ• Submit New Idea',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 15,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/submit_idea/presentation/pages/submit_idea_screen.dart';

class BuildSubmitButton extends StatelessWidget {
  const BuildSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ø§Ù„Ø§Ù†ØªÙ‚Ø§Ù„ Ù„ØµÙØ­Ø© ØªÙ‚Ø¯ÙŠÙ… Ø§Ù„ÙÙƒØ±Ø©
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SubmitIdeaScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(
                alpha: 0.1,
              ), // ØªÙ‚Ù„ÙŠÙ„ Ø­Ø¯Ø© Ø§Ù„Ø¸Ù„ Ù‚Ù„ÙŠÙ„Ø§Ù‹ Ù„ÙŠÙƒÙˆÙ† Ø§Ø­ØªØ±Ø§ÙÙŠØ§Ù‹
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'âŠ• Submit New Idea',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\home\presentation\widgets\filter_button.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/core/styles/colors.dart';


class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.text,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryColor : AppColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E3E8)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.bgColor : AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 6),
            SvgPicture.asset(
              'assets/icons/down.svg',
              height: 12,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.bgColor : AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

// --- Ø§Ù„ÙˆÙŠØ¯Ø¬Øª Ø§Ù„Ù„ÙŠ Ø¨ÙŠØ¬Ù…Ø¹ Ø§Ù„ÙÙ„Ø§ØªØ± ÙÙŠ Ø§Ù„Ù‡ÙˆÙ… ---
class BuildFilters extends StatelessWidget {
  final String selectedCategory;
  final double selectedRating;
  final Function(String) onCategoryChanged;
  final Function(double) onRatingChanged;

  const BuildFilters({
    super.key,
    required this.selectedCategory,
    required this.selectedRating,
    required this.onCategoryChanged,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ÙÙ„ØªØ± Ø§Ù„Ø£Ù‚Ø³Ø§Ù… (Category)
        Expanded(
          child: PopupMenuButton<String>(
            onSelected: onCategoryChanged,
            itemBuilder: (context) => ['All', 'Technology', 'Fintech', 'Healthtech', 'AI']
                .map((cat) => PopupMenuItem(value: cat, child: Text(cat)))
                .toList(),
            child: FilterButton(
              text: selectedCategory == 'All' ? 'Categories' : selectedCategory,
              selected: selectedCategory != 'All',
            ),
          ),
        ),
        const SizedBox(width: 10),
        // ÙÙ„ØªØ± Ø§Ù„ØªÙ‚ÙŠÙŠÙ… (AI Rating)
        Expanded(
          child: PopupMenuButton<double>(
            onSelected: onRatingChanged,
            itemBuilder: (context) => [0.0, 3.0, 4.0, 4.5]
                .map((rate) => PopupMenuItem(
              value: rate,
              child: Text(rate == 0.0 ? 'All Ratings' : '$rate+ Stars'),
            ))
                .toList(),
            child: FilterButton(
              text: selectedRating == 0.0 ? 'AI Rating' : '$selectedRating+',
              selected: selectedRating > 0,
            ),
          ),
        ),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\data\models\request_model.dart
`dart
class RequestModel {
  final dynamic id;
  final dynamic ideaId;
  final String senderId;
  final String receiverId;
  final String content;
  final String status;
  final DateTime createdAt;

  RequestModel({
    required this.id, required this.ideaId, required this.senderId,
    required this.receiverId, required this.content, required this.status,
    required this.createdAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      ideaId: json['idea_id'],
      senderId: json['sender_id']?.toString() ?? '',
      receiverId: json['receiver_id']?.toString() ?? '',
      content: json['content'] ?? '',
      status: json['status'] ?? 'pending',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\domain\idea_logic.dart
`dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/constants/app_images.dart';

class IdeaLogic {
  final _supabase = Supabase.instance.client;

  Future<String> getEntrepreneurName(String? userId) async {
    if (userId == null || userId.isEmpty) return 'Unknown User';
    try {
      final data = await _supabase
          .from('User')
          .select('FullName')
          .eq('userid', userId)
          .maybeSingle();

      return data?['FullName'] ?? 'Unknown User';
    } catch (e) {
      print("Error fetching name: $e");
      return 'Unknown User';
    }
  }

  String getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'technology':
        return AppImages.technology_idea;
      case 'finance':
        return AppImages.finance;
      case 'healthcare':
        return AppImages.medCare;
      case 'ai':
        return AppImages.robotIdeaAi;
      default:
        return AppImages.technology_idea;
    }
  }

  Future<void> submitAction({
    required String ideaId,
    required String entrepreneurId,
    required String ideaTitle,
    required bool isChatRequest,
  }) async {
    final myId = _supabase.auth.currentUser?.id;
    if (myId == null) throw Exception("Please login first");

    try {
      final String requestContent = isChatRequest
          ? 'Chat Request for: $ideaTitle'
          : 'Investment Interest in: $ideaTitle';

      await _supabase.from('requests').insert({
        'idea_id': ideaId,
        'sender_id': myId,
        'receiver_id': entrepreneurId,
        'content': requestContent,
        'status': 'pending',
      });

      print("Success: Request sent. Supabase Trigger will handle the notification.");
    } catch (e) {
      print("Submit Error Details: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getIdeaById(String ideaId) async {
    try {
      return await _supabase
          .from('ideas')
          .select()
          .eq('id', ideaId)
          .maybeSingle();
    } catch (e) {
      print("Error fetching idea: $e");
      return null;
    }
  }


  Future<String?> getInvestorIdFromRequest(String requestId) async {
    try {
      final data = await _supabase
          .from('requests')
          .select('sender_id')
          .eq('id', requestId)
          .maybeSingle();
      return data?['sender_id']?.toString();
    } catch (e) {
      print("Error fetching investor id: $e");
      return null;
    }
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\presentation\pages\idea_details_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/idea_logic.dart';
import '../Widgets/category_image_header.dart';
import '../Widgets/action_buttons_section.dart';
import 'package:investra/features/profile/presentation/pages/profile_screen.dart';
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
          const SnackBar(
              backgroundColor: AppColors.green1Color,
              content: Text('Request sent!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: AppColors.errorColor,
              content: Text('Request failed.')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _docLabel(String url, int index) {
    if (url.contains('bp_')) return 'Business Plan';
    if (url.contains('fs_')) return 'Feasibility Study';
    if (url.contains('/contracts/') || url.contains('contract_')) {
      return 'Contract';
    }
    return 'Document ${index + 1}';
  }

  bool _isContract(String url) =>
      url.contains('/contracts/') || url.contains('contract_');

  @override
  Widget build(BuildContext context) {
    final String category = widget.idea['category'] ?? 'General';
    final List<String> docs = [
      widget.idea['business_plan_url'],
      widget.idea['feasibility_study_url'],
    ].whereType<String>().toList();

    final String description =
        widget.idea['description'] ?? 'No description provided.';
    final String date = widget.idea['created_at'] != null
        ? DateFormat.yMMMd()
        .format(DateTime.parse(widget.idea['created_at']))
        : 'Recently';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: AppColors.primaryColor, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'IDEA DETAILS',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 1.1,
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
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                    future: _logic.getEntrepreneurName(
                        widget.idea['entrepreneur_id']?.toString() ?? ''),
                    builder: (context, snapshot) {
                      final entrepreneurName = snapshot.data ?? '...';
                      return GestureDetector(
                        onTap: () {
                          final String? entrepreneurId =
                          widget.idea['entrepreneur_id']?.toString();
                          if (entrepreneurId != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfileScreen(userId: entrepreneurId),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Posted $date by $entrepreneurName',
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

                  AiInvestorRatingCard(
                    rating: (widget.idea['ai_rating'] ?? 0).toDouble(),
                  ),
                  const SizedBox(height: 14),

                  const Text(
                    'Project Description',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        maxLines: _isExpanded ? null : 4,
                        overflow: _isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.5,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGray,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() => _isExpanded = !_isExpanded),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _isExpanded ? 'Read Less' : 'Read More',
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (docs.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    const Text(
                      'Required Documents',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(height: 8),
                    ...docs.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String url = entry.value;
                      final bool isContract = _isContract(url);
                      final String label = _docLabel(url, index);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: isContract
                              ? AppColors.primaryColor.withOpacity(0.06)
                              : AppColors.secondary2Color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isContract
                                ? AppColors.primaryColor.withOpacity(0.25)
                                : AppColors.bgGray,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isContract
                                  ? Icons.gavel_rounded
                                  : Icons.insert_drive_file,
                              color: AppColors.primaryColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                label,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                            ),
                            Icon(
                              isContract
                                  ? Icons.lock_outline
                                  : Icons.check_circle,
                              color: isContract
                                  ? AppColors.grayColor
                                  : AppColors.green1Color,
                              size: 16,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],

                  const SizedBox(height: 16),
                  ActionButtonsSection(
                      isLoading: _isLoading, onAction: _handleAction),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\presentation\widgets\action_buttons_section.dart
`dart
import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';

class ActionButtonsSection extends StatelessWidget {
  final bool isLoading;
  final Future<void> Function(bool isChat) onAction;

  const ActionButtonsSection({super.key, required this.isLoading, required this.onAction});

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));

    return Column(
      children: [
        _buildButton(
          label: "Request Chat",
          isPrimary: true,
          onPressed: () => onAction(true),
        ),
        const SizedBox(height: 12),
        _buildButton(
          label: "Invest",
          isPrimary: false,
          onPressed: () => onAction(false),
        ),
      ],
    );
  }

  Widget _buildButton({required String label, required bool isPrimary, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primaryColor : AppColors.bgColor,
          side: isPrimary ? BorderSide.none : const BorderSide(color: AppColors.primaryColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isPrimary ? AppColors.bgColor : AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\presentation\widgets\ai_investor_rating_card.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class AiInvestorRatingCard extends StatelessWidget {
  final double rating;

  const AiInvestorRatingCard({
    super.key,
    this.rating = 0,
  });

  String _getPotentialLabel(double r) {
    if (r >= 4) return "High Potential";
    if (r >= 2.5) return "Medium Potential";
    return "Low Potential";
  }

  Color _getPotentialColor(double r) {
    if (r >= 4) return AppColors.darkgreen;
    if (r >= 2.5) return Colors.orange;
    return Colors.red;
  }

  Widget _buildStars() {
    return Row(
      children: List.generate(5, (i) {
        IconData icon;
        if (rating >= i + 1) {
          icon = Icons.star;
        } else if (rating >= i + 0.5) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: Colors.amber, size: 18);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.lightgreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.submissionColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.psychology, color: AppColors.darkgreen, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "AI INVESTOR RATING",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkgreen),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _buildStars(),
                    const SizedBox(width: 6),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.grayColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _getPotentialColor(rating),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.trending_up, color: Colors.white, size: 14),
                const SizedBox(width: 4),
                Text(
                  _getPotentialLabel(rating),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\presentation\widgets\category_image_header.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class CategoryImageHeader extends StatelessWidget {
  final String imagePath;
  final String category;

  const CategoryImageHeader({
    super.key,
    required this.imagePath,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,

      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                category.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\idea_details\presentation\widgets\documents_section.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class DocumentsSection extends StatelessWidget {
  final List<dynamic> docs;

  const DocumentsSection({super.key, required this.docs});

  @override
  Widget build(BuildContext context) {
    if (docs.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Required Documents",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // Ø¹Ø±Ø¶ Ù‚Ø§Ø¦Ù…Ø© Ø§Ù„Ù…Ù„ÙØ§Øª
        ...docs.map((docUrl) {
          // Ù…Ù†Ø·Ù‚ Ø¨Ø³ÙŠØ· Ù„ØªÙ…ÙŠÙŠØ² Ù†ÙˆØ¹ Ø§Ù„Ù…Ù„Ù Ù…Ù† Ø§Ù„Ø±Ø§Ø¨Ø·
          String label = docUrl.toString().contains('bp_')
              ? "Business Plan prepared"
              : "Financials prepared";

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.secondary1Color.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.primaryColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 15, color: AppColors.blackColor),
                  ),
                ),
                const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\main_app\presentation\pages\main_app_entrepreneur_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/home/presentation/pages/entrepreneur_home_screen.dart';
import 'package:investra/features/settings/presentation/pages/settings_screen.dart';
import 'package:investra/features/ai_chatbot/presentation/pages/ai_chatbot_screen.dart';
import 'package:investra/features/messages/presentation/pages/messages_list_screen.dart';

class MainAppEntrepreneurScreen extends StatefulWidget {
  const MainAppEntrepreneurScreen({super.key, this.selectedIndex});

  final int? selectedIndex;

  @override
  State<MainAppEntrepreneurScreen> createState() => MainAppEntrepreneurScreenState();
}

class MainAppEntrepreneurScreenState extends State<MainAppEntrepreneurScreen> {
  int currentIndex = 0;
  bool _isVisible = true;
  late ScrollController _scrollController;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _scrollController = ScrollController();

    screens = [
      EntrepreneurHomeScreen(scrollController: _scrollController),
      AiChatbotScreen(
        onScroll: (visible) {
          if (_isVisible != visible) setState(() => _isVisible = visible);
        },
      ),
      MessagesListScreen(),

      SettingsScreen(scrollController: _scrollController),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse) {
            if (_isVisible) setState(() => _isVisible = false);
          } else if (notification.direction == ScrollDirection.forward) {
            if (!_isVisible) setState(() => _isVisible = true);
          }
          return true;
        },
        child: IndexedStack(index: currentIndex, children: screens),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isVisible
            ? (kBottomNavigationBarHeight +
            MediaQuery.of(context).padding.bottom)
            : 0,
        child: Wrap(
          children: [_bottomNavBar()],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          _isVisible = true;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayColor,
      elevation: 10,
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.aichatbotSvg,
            color: AppColors.primaryColor,
          ),
          label: 'AI Chatbot',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.chatSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.chatSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\main_app\presentation\pages\main_app_investor_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/home/presentation/pages/investor_home_screen.dart';
import 'package:investra/features/settings/presentation/pages/settings_screen.dart';
import 'package:investra/features/ai_chatbot/presentation/pages/ai_chatbot_screen.dart';
import 'package:investra/features/messages/presentation/pages/messages_list_screen.dart';

class MainAppInvestorScreen extends StatefulWidget {
  const MainAppInvestorScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppInvestorScreen> createState() => MainAppInvestorScreenState();
}

class MainAppInvestorScreenState extends State<MainAppInvestorScreen> {
  int currentIndex = 0;
  bool _isVisible = true;
  late ScrollController _scrollController;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _scrollController = ScrollController();

    screens = [
      InvestorHomeScreen(scrollController: _scrollController),
      AiChatbotScreen(
        onScroll: (visible) {
          if (_isVisible != visible) setState(() => _isVisible = visible);
        },
      ),
      const MessagesListScreen(),
      SettingsScreen(scrollController: _scrollController),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse) {
            if (_isVisible) setState(() => _isVisible = false);
          } else if (notification.direction == ScrollDirection.forward) {
            if (!_isVisible) setState(() => _isVisible = true);
          }
          return true;
        },
        child: IndexedStack(index: currentIndex, children: screens),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isVisible
            ? (kBottomNavigationBarHeight +
            MediaQuery.of(context).padding.bottom)
            : 0,
        child: Wrap(
          children: [_bottomNavBar()],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          _isVisible = true;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayColor,
      elevation: 10,
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.aichatbotSvg,
            color: AppColors.primaryColor,
          ),
          label: 'AI Chatbot',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.chatSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.chatSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\main_app\presentation\pages\main_app_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
  }

  List<Widget> screens = [
    // HomeScreen(),
    // AIChatbotScreen(),
    // SearchScreen(),
    // ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.aichatbotSvg,
            color: AppColors.primaryColor,
          ),
          label: 'AI CHATBOT',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.searchSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.searchSvg,
            color: AppColors.primaryColor,
          ),
          label: 'search',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\data\chat_supabase_service.dart
`dart
import 'dart:io';
import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';

class ChatSupabaseService {
  final _sb = Supabase.instance.client;

  String get _myId => _sb.auth.currentUser!.id;

  // â”€â”€ 1. Ø¬ÙŠØ¨ ÙƒÙ„ Ø§Ù„Ø´Ø§ØªØ§Øª â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<List<ChatContact>> fetchChats() async {
    final rows = await _sb
        .from('chat')
        .select('''
          chat_id,
          idea_id,
          entrepreneur_id,
          investor_id,
          created_at,
          ideas(title),
          message(
            messageid,
            "Message text",
            "time stamp",
            sender_id,
            message_type
          )
        ''')
        .or('entrepreneur_id.eq.$_myId,investor_id.eq.$_myId');

    final List<ChatContact> contacts = [];

    for (final row in rows) {
      final bool iAmEntrepreneur = row['entrepreneur_id'] == _myId;
      final String peerId =
      iAmEntrepreneur ? row['investor_id'] : row['entrepreneur_id'];

      final profileRow = await _sb
          .from('User')
          .select('FullName')
          .eq('userid', peerId)
          .maybeSingle();

      String fullName = profileRow?['FullName'] ?? 'User';

      final p = await _sb
          .from('profile')
          .select('profile_picture, FullName')
          .eq('userid', peerId)
          .maybeSingle();
      final String? avatar = p?['profile_picture'];
      if (fullName == 'User' && p?['FullName'] != null) {
        fullName = p!['FullName'];
      }

      final List msgs = row['message'] ?? [];
      msgs.sort((a, b) =>
          (a['time stamp'] ?? '').compareTo(b['time stamp'] ?? ''));

      final lastMsg = msgs.isNotEmpty ? msgs.last : null;

      String preview = '...';
      if (lastMsg != null) {
        switch (lastMsg['message_type']) {
          case 'nda':
            preview = 'ðŸ“„ NDA Agreement';
            break;
          case 'image':
            preview = 'ðŸ“· Image';
            break;
          case 'document':
            preview = 'ðŸ“Ž Document';
            break;
          default:
            preview = lastMsg['Message text'] ?? '...';
        }
      }

      const int unreadCount = 0;

      final String timeAgo = lastMsg != null
          ? _formatTime(DateTime.parse(lastMsg['time stamp']).toLocal())
          : '';

      final String role =
      row['investor_id'] == peerId ? 'INVESTOR' : 'ENTREPRENEUR';

      contacts.add(ChatContact(
        id: row['chat_id'],
        fullName: fullName,
        roleSubtitle: role,
        avatarUrl: avatar,
        lastMessagePreview: preview,
        timeAgo: timeAgo,
        unreadCount: unreadCount,
        topicLabel: row['ideas']?['title'],
        lastMessageTime: lastMsg != null
            ? DateTime.parse(lastMsg['time stamp']).toLocal()
            : DateTime.parse(row['created_at']).toLocal(),
      ));
    }

    contacts.sort((a, b) =>
        (b.lastMessageTime ?? DateTime(2000))
            .compareTo(a.lastMessageTime ?? DateTime(2000)));

    return contacts;
  }

  // â”€â”€ 2. Ø¬ÙŠØ¨ Ø±Ø³Ø§Ø¦Ù„ Ø´Ø§Øª Ù…Ø¹ÙŠÙ† â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<List<ChatMessage>> fetchMessages(String chatId) async {
    final rows = await _sb
        .from('message')
        .select(
        'messageid, "Message text", sender_id, "time stamp", "is read", message_type')
        .eq('chat_id', chatId)
        .order('time stamp', ascending: true);

    return rows.map((r) {
      final dt = DateTime.tryParse(r['time stamp'] ?? '')?.toLocal();
      return ChatMessage(
        id: r['messageid'].toString(),
        text: r['Message text'] ?? '',
        isFromUser: r['sender_id'] == _myId,
        timeLabel: dt != null ? _formatTime(dt) : '',
        isRead: r['is read'] == true,
        messageType: r['message_type'] ?? 'text',
      );
    }).toList();
  }

  // â”€â”€ 3. Ø¨Ø¹Øª Ø±Ø³Ø§Ù„Ø© Ù†ØµÙŠØ© â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> sendMessage({
    required String chatId,
    required String text,
  }) async {
    await _sb.from('message').insert({
      'chat_id': chatId,
      'sender_id': _myId,
      'Message text': text,
      'is read': false,
      'message_type': 'text',
    });
  }

  // â”€â”€ 4. Ø¨Ø¹Øª Ø·Ù„Ø¨ NDA â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  // Ø§Ù„Ù€ entrepreneur Ø¨ÙŠØ³ØªØ®Ø¯Ù… Ù‡Ø§Ø¯ â€” Ø¨ÙŠØ¨Ø¹Øª Ø±Ø³Ø§Ù„Ø© Ù„Ù„Ù…Ø³ØªØ«Ù…Ø± ÙŠØ·Ù„Ø¨ Ù…Ù†Ù‡ ÙŠÙˆÙ‚Ø¹
  Future<void> sendNdaRequest({required String chatId}) async {
    await _sb.from('message').insert({
      'chat_id': chatId,
      'sender_id': _myId,
      'Message text':
      'Please review and sign the NDA agreement to proceed with viewing the project details.',
      'is read': false,
      'message_type': 'nda',
    });
  }

  // â”€â”€ 5. Ø±ÙØ¹ ØµÙˆØ±Ø© ÙˆØ¨Ø¹ØªÙ‡Ø§ â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> sendImage({
    required String chatId,
    required File imageFile,
  }) async {
    final ext = imageFile.path.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}_$_myId.$ext';

    await _sb.storage.from('chat_files').upload(fileName, imageFile);

    final publicUrl =
    _sb.storage.from('chat_files').getPublicUrl(fileName);

    await _sb.from('message').insert({
      'chat_id': chatId,
      'sender_id': _myId,
      'Message text': publicUrl,
      'is read': false,
      'message_type': 'image',
    });
  }

  // â”€â”€ 6. Ø±ÙØ¹ Ù…Ù„Ù ÙˆØ¨Ø¹ØªÙ‡ â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> sendDocument({
    required String chatId,
    required Uint8List bytes,
    required String fileName,
  }) async {
    final storageName =
        '${DateTime.now().millisecondsSinceEpoch}_$fileName';

    await _sb.storage
        .from('chat_files')
        .uploadBinary(storageName, bytes);

    final publicUrl =
    _sb.storage.from('chat_files').getPublicUrl(storageName);

    await _sb.from('message').insert({
      'chat_id': chatId,
      'sender_id': _myId,
      'Message text': publicUrl,
      'is read': false,
      'message_type': 'document',
    });
  }

  // â”€â”€ 7. Ø¹Ù„Ù‘Ù… Ø§Ù„Ø±Ø³Ø§Ø¦Ù„ ÙƒÙ…Ù‚Ø±ÙˆØ¡Ø© â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> markMessagesAsRead(String chatId) async {
    await _sb
        .from('message')
        .update({'is read': true})
        .eq('chat_id', chatId)
        .neq('sender_id', _myId)
        .eq('is read', false);
  }

  // â”€â”€ 8. Stream Ø±Ø³Ø§Ø¦Ù„ Ø´Ø§Øª Ù…Ø¹ÙŠÙ† â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Stream<List<Map<String, dynamic>>> streamMessages(String chatId) {
    return _sb
        .from('message')
        .stream(primaryKey: ['messageid'])
        .eq('chat_id', chatId)
        .order('time stamp', ascending: true);
  }

  // â”€â”€ 9. Stream ÙƒÙ„ Ø§Ù„Ø±Ø³Ø§Ø¦Ù„ (Ù„Ù„Ù€ messages list) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Stream<List<Map<String, dynamic>>> streamAllMessages() {
    return _sb.from('message').stream(primaryKey: ['messageid']);
  }

  // â”€â”€ 10. Ø¬ÙŠØ¨ Ø£Ùˆ Ø§Ø¹Ù…Ù„ Ø´Ø§Øª â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<String> getOrCreateChat({
    required String otherUserId,
    required String ideaId,
  }) async {
    final iAmEntrepreneur = await isEntrepreneur();
    final entrepreneurId = iAmEntrepreneur ? _myId : otherUserId;
    final investorId = iAmEntrepreneur ? otherUserId : _myId;

    final existing = await _sb
        .from('chat')
        .select('chat_id')
        .eq('entrepreneur_id', entrepreneurId)
        .eq('investor_id', investorId)
        .eq('idea_id', ideaId)
        .maybeSingle();

    if (existing != null) return existing['chat_id'];

    final created = await _sb
        .from('chat')
        .insert({
      'entrepreneur_id': entrepreneurId,
      'investor_id': investorId,
      'idea_id': ideaId,
    })
        .select('chat_id')
        .single();

    return created['chat_id'];
  }

  // â”€â”€ 11. ØªØ­Ù‚Ù‚ Ù…Ù† Ø§Ù„Ù€ role â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<bool> isEntrepreneur() async {
    final row = await _sb
        .from('User')
        .select('role')
        .eq('userid', _myId)
        .maybeSingle();
    return row?['role'] == 'Entrepreneur';
  }

  // â”€â”€ Helper: format time â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) {
      final h = dt.hour > 12
          ? dt.hour - 12
          : dt.hour == 0
          ? 12
          : dt.hour;
      final m = dt.minute.toString().padLeft(2, '0');
      final ampm = dt.hour < 12 ? 'AM' : 'PM';
      return '$h:$m $ampm';
    }
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${dt.day}/${dt.month}';
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\data\messages_mock_data_source.dart
`dart
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';
import 'package:investra/features/messages/domain/entities/chat_thread_item.dart';

/// In-memory mock data for the messaging feature (replace with API later).
class MessagesMockDataSource {
  const MessagesMockDataSource._();

  static const String _placeholder =
      'https://ui-avatars.com/api/?background=1E4B76&color=fff&name=';

  static final List<ChatContact> _contacts = [
     ChatContact(
      id: '1',
      fullName: 'Amina Khan',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'Check in',
      timeAgo: 'Yesterday',
      unreadCount: 2,
      isOnline: true,
      topicLabel: 'SolarTech Q4 Expansion',
      avatarUrl: '$_placeholder' 'Amina+Khan',
      lastMessageTime: DateTime(2023, 10, 26, 10, 5),
    ),
    ChatContact(
      id: '2',
      fullName: 'Jameson Oduro',
      roleSubtitle: 'VENTURE PARTNER',
      lastMessagePreview: 'See you soon',
      timeAgo: '5h',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'AgriNode Seed Round',
      avatarUrl: '$_placeholder' 'Jameson+Oduro',
      lastMessageTime: DateTime(2023, 10, 26, 9, 0),
    ),
    ChatContact(
      id: '3',
      fullName: 'Elena Kovac',
      roleSubtitle: 'L.P.',
      lastMessagePreview: 'Sent a photo',
      timeAgo: '2h',
      unreadCount: 1,
      isOnline: true,
      topicLabel: 'Finstack Due Diligence',
      avatarUrl: '$_placeholder' 'Elena+Kovac',
      lastMessageTime: DateTime(2023, 10, 26, 12, 0),
    ),
    ChatContact(
      id: '4',
      fullName: 'Ismail Al-Fadel',
      roleSubtitle: 'FAMILY OFFICE',
      lastMessagePreview: 'liked a message',
      timeAgo: '7d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'REIT follow-up',
      avatarUrl: '$_placeholder' 'Ismail+Al-Fadel',
      lastMessageTime: DateTime(2023, 10, 19, 14, 0),
    ),
    ChatContact(
      id: '5',
      fullName: 'Layla Saad',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'Weekend plan',
      timeAgo: '1d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Bridge round terms',
      avatarUrl: '$_placeholder' 'Layla+Saad',
      lastMessageTime: DateTime(2023, 10, 25, 18, 0),
    ),
    ChatContact(
      id: '6',
      fullName: 'Mirna omar',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'I will review the deck tonight.',
      timeAgo: '3h',
      unreadCount: 0,
      isOnline: true,
      topicLabel: 'SolarTech Q4 Expansion',
      avatarUrl: '$_placeholder' 'Mirna+Omar',
      lastMessageTime: DateTime(2023, 10, 26, 11, 0),
    ),
    ChatContact(
      id: '7',
      fullName: 'Omar Haddad',
      roleSubtitle: 'INVESTMENT DIRECTOR',
      lastMessagePreview: 'Can we move the call to Tuesday?',
      timeAgo: '1h',
      unreadCount: 0,
      isOnline: true,
      topicLabel: 'MENA expansion',
      avatarUrl: '$_placeholder' 'Omar+Haddad',
      lastMessageTime: DateTime(2023, 10, 26, 13, 0),
    ),
    ChatContact(
      id: '8',
      fullName: 'Sofia Reyes',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'Thanks for the cap table.',
      timeAgo: '4h',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Series A docs',
      avatarUrl: '$_placeholder' 'Sofia+Reyes',
      lastMessageTime: DateTime(2023, 10, 26, 10, 0),
    ),
    ChatContact(
      id: '9',
      fullName: 'Yuki Tanaka',
      roleSubtitle: 'STRATEGIC PARTNER',
      lastMessagePreview: 'Pushed the updated NDA to your email.',
      timeAgo: '6h',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'APAC intro',
      avatarUrl: '$_placeholder' 'Yuki+Tanaka',
      lastMessageTime: DateTime(2023, 10, 26, 8, 0),
    ),
    ChatContact(
      id: '10',
      fullName: 'Leo Vance',
      roleSubtitle: 'VENTURE PARTNER',
      lastMessagePreview: 'Let me sync with legal first.',
      timeAgo: '2d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Options pool',
      avatarUrl: '$_placeholder' 'Leo+Vance',
      lastMessageTime: DateTime(2023, 10, 24, 15, 0),
    ),
    ChatContact(
      id: '11',
      fullName: 'Hannah Brooks',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'Weekend plan',
      timeAgo: '3d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Dublin office visit',
      avatarUrl: '$_placeholder' 'Hannah+Brooks',
      lastMessageTime: DateTime(2023, 10, 23, 12, 0),
    ),
    ChatContact(
      id: '12',
      fullName: 'Ravi Patel',
      roleSubtitle: 'FAMILY OFFICE',
      lastMessagePreview: 'Numbers look solid in Q1.',
      timeAgo: '5d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Q1 review',
      avatarUrl: '$_placeholder' 'Ravi+Patel',
      lastMessageTime: DateTime(2023, 10, 21, 11, 0),
    ),
    ChatContact(
      id: '13',
      fullName: 'Claire DeLuca',
      roleSubtitle: 'L.P.',
      lastMessagePreview: 'I shared this with the committee.',
      timeAgo: '1d',
      unreadCount: 0,
      isOnline: true,
      topicLabel: 'Committee read-out',
      avatarUrl: '$_placeholder' 'Claire+DeLuca',
      lastMessageTime: DateTime(2023, 10, 25, 14, 0),
    ),
    ChatContact(
      id: '14',
      fullName: 'Niko Anders',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'Can we get a 15m slot tomorrow?',
      timeAgo: '8h',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Product demo',
      avatarUrl: '$_placeholder' 'Niko+Anders',
      lastMessageTime: DateTime(2023, 10, 26, 6, 0),
    ),
    ChatContact(
      id: '15',
      fullName: 'Maya Idris',
      roleSubtitle: 'VENTURE PARTNER',
      lastMessagePreview: 'Sent the LOI comments.',
      timeAgo: '12h',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'LOI review',
      avatarUrl: '$_placeholder' 'Maya+Idris',
      lastMessageTime: DateTime(2023, 10, 26, 2, 0),
    ),
    ChatContact(
      id: '16',
      fullName: 'Ethan Morse',
      roleSubtitle: 'FAMILY OFFICE',
      lastMessagePreview: 'Great meeting everyone.',
      timeAgo: 'Sat',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Advisory call',
      avatarUrl: '$_placeholder' 'Ethan+Morse',
      lastMessageTime: DateTime(2023, 10, 21, 9, 0),
    ),
    ChatContact(
      id: '17',
      fullName: 'Zara Nasser',
      roleSubtitle: 'ANGEL INVESTOR',
      lastMessagePreview: 'Uploading the signed PDF now.',
      timeAgo: '20m',
      unreadCount: 0,
      isOnline: true,
      topicLabel: 'SAFT closing',
      avatarUrl: '$_placeholder' 'Zara+Nasser',
      lastMessageTime: DateTime(2023, 10, 26, 13, 40),
    ),
    ChatContact(
      id: '18',
      fullName: 'Derek Wu',
      roleSubtitle: 'INVESTMENT DIRECTOR',
      lastMessagePreview: 'Pinging finance for a refresh.',
      timeAgo: '3d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Audit window',
      avatarUrl: '$_placeholder' 'Derek+Wu',
      lastMessageTime: DateTime(2023, 10, 23, 10, 0),
    ),
    ChatContact(
      id: '19',
      fullName: 'Irene Papadopoulos',
      roleSubtitle: 'L.P.',
      lastMessagePreview: 'Will follow up on EU regulations.',
      timeAgo: '4d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'Regulatory Q&A',
      avatarUrl: '$_placeholder' 'Irene+Pa',
      lastMessageTime: DateTime(2023, 10, 22, 11, 0),
    ),
    ChatContact(
      id: '20',
      fullName: 'Victor Mensa',
      roleSubtitle: 'STRATEGIC PARTNER',
      lastMessagePreview: 'Introduced you to the CFO.',
      timeAgo: '6d',
      unreadCount: 0,
      isOnline: false,
      topicLabel: 'CFO intro',
      avatarUrl: '$_placeholder' 'Victor+Mensa',
      lastMessageTime: DateTime(2023, 10, 20, 10, 0),
    ),
  ];

  static List<ChatContact> get allContacts => _contacts;

  static void markAsRead(String contactId) {
    final index = _contacts.indexWhere((c) => c.id == contactId);
    if (index != -1) {
      final old = _contacts[index];
      _contacts[index] = ChatContact(
        id: old.id,
        fullName: old.fullName,
        roleSubtitle: old.roleSubtitle,
        lastMessagePreview: old.lastMessagePreview,
        timeAgo: old.timeAgo,
        unreadCount: 0,
        isOnline: old.isOnline,
        avatarUrl: old.avatarUrl,
        topicLabel: old.topicLabel,
        lastMessageTime: old.lastMessageTime,
      );
    }
  }

  static void appendUserMessage({
    required String contactId,
    required String text,
    required String timeLabel,
  }) {
    final thread = _threadStore.putIfAbsent(
      contactId,
      () => List<ChatThreadItem>.of(_defaultThread),
    );

    thread.add(
      ChatMessageItem(
        ChatMessage(
          id: 'm_${DateTime.now().microsecondsSinceEpoch}',
          text: text,
          isFromUser: true,
          timeLabel: timeLabel,
          isRead: true,
        ),
      ),
    );

    // Update the contact preview in the list
    final index = _contacts.indexWhere((c) => c.id == contactId);
    if (index != -1) {
      final old = _contacts[index];
      _contacts[index] = ChatContact(
        id: old.id,
        fullName: old.fullName,
        roleSubtitle: old.roleSubtitle,
        lastMessagePreview: text,
        timeAgo: 'Just now',
        unreadCount: 0,
        isOnline: old.isOnline,
        avatarUrl: old.avatarUrl,
        topicLabel: old.topicLabel,
        lastMessageTime: DateTime.now(),
      );
    }
  }

  static final Map<String, List<ChatThreadItem>> _threadStore = {
    '1': List<ChatThreadItem>.of(_aminaThread),
    '6': List<ChatThreadItem>.of(_mirnaThread),
  };

  static List<ChatThreadItem> initialThreadFor(String contactId) {
    final existing = _threadStore[contactId];
    if (existing != null) {
      return List<ChatThreadItem>.of(existing);
    }

    final created = List<ChatThreadItem>.of(_defaultThread);
    _threadStore[contactId] = created;
    return List<ChatThreadItem>.of(created);
  }

  static String lastMessagePreviewFor(
    String contactId, {
    required String fallback,
  }) {
    final thread = _threadStore.putIfAbsent(
      contactId,
      () => List<ChatThreadItem>.of(_defaultThread),
    );

    for (var i = thread.length - 1; i >= 0; i--) {
      final item = thread[i];
      if (item is ChatMessageItem) {
        return item.message.text;
      }
    }
    return fallback;
  }

  static const List<ChatThreadItem> _mirnaThread = [
    ChatDateSeparatorItem('YESTERDAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'm1',
        text: 'Here is the updated forecastâ€”let me know if the assumptions look right on your side.',
        isFromUser: false,
        timeLabel: '4:12 PM',
        isRead: true,
      ),
    ),
    ChatMessageItem(
      ChatMessage(
        id: 'm2',
        text: 'Thanks, Mirna. I will align with the team and send a revised slide by evening.',
        isFromUser: true,
        timeLabel: '4:15 PM',
        isRead: true,
      ),
    ),
    ChatDateSeparatorItem('TODAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'm3',
        text: 'Noted. Can we add a one-pager on unit economics to the data room?',
        isFromUser: false,
        timeLabel: '9:20 AM',
        isRead: true,
      ),
    ),
  ];

  static const List<ChatThreadItem> _aminaThread = [
    ChatDateSeparatorItem('TODAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'a1',
        text: 'Check in on the diligence timeline when you can.',
        isFromUser: false,
        timeLabel: '10:05 AM',
        isRead: true,
      ),
    ),
  ];

  static const List<ChatThreadItem> _defaultThread = [
    ChatDateSeparatorItem('TODAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'd1',
        text: 'Let me know a good time to connect this week.',
        isFromUser: false,
        timeLabel: '11:00 AM',
        isRead: true,
      ),
    ),
  ];
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\domain\entities\chat_contact.dart
`dart
/// Conversation row / peer shown in the messages list and chat header.
class ChatContact {
  const ChatContact({
    required this.id,
    required this.fullName,
    required this.roleSubtitle,
    this.avatarUrl,
    required this.lastMessagePreview,
    required this.timeAgo,
    this.unreadCount = 0,
    this.isOnline = false,
    this.topicLabel,
    this.lastMessageTime,
  });

  final String id;
  final String fullName;
  final String roleSubtitle;
  final String? avatarUrl;
  final String lastMessagePreview;
  final String timeAgo;
  final int unreadCount;
  final bool isOnline;
  final String? topicLabel;
  final DateTime? lastMessageTime;
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\domain\entities\chat_message.dart
`dart
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.timeLabel,
    required this.isRead,
    this.messageType = 'text',
  });

  final String id;
  final String text;
  final bool isFromUser;
  final String timeLabel;
  final bool isRead;
  final String messageType;

  bool get isNda => messageType == 'nda';
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\domain\entities\chat_thread_item.dart
`dart
import 'package:investra/features/messages/domain/entities/chat_message.dart';

/// Union for rendering date chips vs message rows in [ListView].
sealed class ChatThreadItem {
  const ChatThreadItem();
}

class ChatDateSeparatorItem extends ChatThreadItem {
  const ChatDateSeparatorItem(this.label);
  final String label;
}

class ChatMessageItem extends ChatThreadItem {
  const ChatMessageItem(this.message);
  final ChatMessage message;
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\pages\chat_screen.dart
`dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';
import 'package:investra/features/messages/domain/entities/chat_thread_item.dart';
import 'package:investra/features/messages/presentation/pages/nda_screen.dart';
import 'package:investra/features/messages/presentation/widgets/chat_bubble.dart';
import 'package:investra/features/messages/presentation/widgets/chat_attachment_bottom_sheet.dart';
import 'package:investra/features/messages/presentation/widgets/message_input_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});
  final ChatContact user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  final ChatSupabaseService _service = ChatSupabaseService();

  StreamSubscription<List<Map<String, dynamic>>>? _streamSub;

  List<ChatThreadItem> _items = [];
  bool _showJumpToLatest = false;
  bool _isFirstLoad = true;
  int _newMessageCount = 0;

  final Set<String> _knownIds = {};

  ChatContact get _user => widget.user;
  String get _myId => Supabase.instance.client.auth.currentUser!.id;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _startStream();
    _service.markMessagesAsRead(_user.id);
  }

  @override
  void dispose() {
    _streamSub?.cancel();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // â”€â”€ Stream â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  void _startStream() {
    _streamSub = _service.streamMessages(_user.id).listen((rows) {
      if (!mounted) return;

      final String myId = _myId;
      final List<ChatThreadItem> items = [];
      String? lastDate;
      bool hasNewIncoming = false;

      for (final r in rows) {
        final msgId = r['messageid'].toString();
        final dt = DateTime.tryParse(r['time stamp'] ?? '')?.toLocal();
        final isFromUser = r['sender_id'] == myId;
        final isRead = r['is read'] == true;
        final messageType = r['message_type'] ?? 'text';

        if (!isFromUser && !_knownIds.contains(msgId) && !_isFirstLoad) {
          hasNewIncoming = true;
        }
        _knownIds.add(msgId);

        // â”€â”€ date separator â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
        final dateLabel = _dateLabel(dt);
        if (lastDate != dateLabel) {
          items.add(ChatDateSeparatorItem(dateLabel));
          lastDate = dateLabel;
        }

        items.add(ChatMessageItem(ChatMessage(
          id: msgId,
          text: r['Message text'] ?? '',
          isFromUser: isFromUser,
          timeLabel: dt != null ? _formatTimeLocal(dt) : '',
          isRead: isRead,
          messageType: messageType,
        )));
      }

      final wasFirstLoad = _isFirstLoad;
      setState(() {
        _items = items;
        _isFirstLoad = false;
        if (hasNewIncoming && _showJumpToLatest) _newMessageCount++;
      });

      if (wasFirstLoad) {
        WidgetsBinding.instance.addPostFrameCallback(
              (_) => _scrollToBottom(animated: false),
        );
      } else if (hasNewIncoming && !_showJumpToLatest) {
        WidgetsBinding.instance.addPostFrameCallback(
              (_) => _scrollToBottom(animated: true),
        );
      }

      if (hasNewIncoming) {
        _service.markMessagesAsRead(_user.id);
      }
    });
  }

  // â”€â”€ date label â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  String _dateLabel(DateTime? dt) {
    if (dt == null) return 'TODAY';
    final now = DateTime.now();
    final diff = DateTime(now.year, now.month, now.day)
        .difference(DateTime(dt.year, dt.month, dt.day))
        .inDays;
    if (diff == 0) return 'TODAY';
    if (diff == 1) return 'YESTERDAY';
    return '${dt.day}/${dt.month}/${dt.year}';
  }

  // â”€â”€ scroll â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  void _handleScroll() {
    if (!_scrollController.hasClients) return;
    final p = _scrollController.position;
    final atBottom = p.pixels >= p.maxScrollExtent - 48;
    final show = !atBottom;
    if (show != _showJumpToLatest) {
      setState(() {
        _showJumpToLatest = show;
        if (!show) _newMessageCount = 0;
      });
    }
  }

  void _scrollToBottom({bool animated = true}) {
    if (!_scrollController.hasClients) return;
    final target = _scrollController.position.maxScrollExtent;
    if (animated) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
      );
    } else {
      _scrollController.jumpTo(target);
    }
    setState(() => _newMessageCount = 0);
  }

  // â”€â”€ Ø¥Ø±Ø³Ø§Ù„ Ø±Ø³Ø§Ù„Ø© â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> _send() async {
    final t = _messageController.text.trim();
    if (t.isEmpty) return;
    _messageController.clear();

    final tempId = 'local_${DateTime.now().microsecondsSinceEpoch}';
    setState(() {
      _items.add(ChatMessageItem(ChatMessage(
        id: tempId,
        text: t,
        isFromUser: true,
        timeLabel: _timeNow(),
        isRead: false,
        messageType: 'text',
      )));
    });
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _scrollToBottom(animated: true),
    );

    try {
      await _service.sendMessage(chatId: _user.id, text: t);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send: $e')),
        );
        setState(() {
          _items.removeWhere(
                  (i) => i is ChatMessageItem && i.message.id == tempId);
        });
      }
    }
  }

  // â”€â”€ Ø§Ø³ØªÙ‚Ø¨Ø§Ù„ attachment (ØµÙˆØ±Ø©/Ù…Ù„Ù) Ù…Ù† Ø§Ù„Ø¨ÙˆØªÙˆÙ… Ø´ÙŠØª ÙˆØ¨Ø¹ØªÙ‡ â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> _onAttachmentPicked(PendingAttachment attachment) async {
    try {
      if (attachment.type == PendingAttachmentType.image) {
        await _service.sendImage(
          chatId: _user.id,
          imageFile: attachment.file!,
        );
      } else {
        await _service.sendDocument(
          chatId: _user.id,
          bytes: attachment.bytes!,
          fileName: attachment.fileName!,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send attachment: $e')),
        );
      }
    }
  }

  // â”€â”€ ÙØªØ­ NDA Ù„Ù„Ù…Ø³ØªØ«Ù…Ø± â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  void _openNdaForSigning() {
    Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => NdaScreen(chatId: _user.id)),
    );
  }

  String _formatTimeLocal(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) {
      final h = dt.hour > 12 ? dt.hour - 12 : dt.hour == 0 ? 12 : dt.hour;
      final m = dt.minute.toString().padLeft(2, '0');
      final ampm = dt.hour < 12 ? 'AM' : 'PM';
      return '$h:$m $ampm';
    }
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${dt.day}/${dt.month}';
  }

  String _timeNow() {
    final t = DateTime.now();
    final h24 = t.hour;
    final m = t.minute;
    final h12 = h24 == 0 ? 12 : h24 > 12 ? h24 - 12 : h24;
    final ampm = h24 < 12 ? 'AM' : 'PM';
    return '$h12:${m.toString().padLeft(2, '0')} $ampm';
  }

  // â”€â”€ Build â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topic = _user.topicLabel != null
        ? 'Regarding project: ${_user.topicLabel}'
        : 'Regarding project: Active conversation';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: CustomSvgPicture(
            path: AppImages.backSvg,
            color: theme.colorScheme.primary,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Row(
          children: [
            _HeaderAvatar(
              imageUrl: _user.avatarUrl,
              isOnline: _user.isOnline,
              name: _user.fullName,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _user.fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _user.roleSubtitle.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary.withOpacity(0.75),
                      letterSpacing: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(
              path: AppImages.videoSvg,
              color: AppColors.grayColor,
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(
              path: AppImages.infoOutlineSvg,
              color: AppColors.grayColor,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ProjectTopicBanner(text: topic),
          Expanded(
            child: _isFirstLoad
                ? const Center(child: CircularProgressIndicator())
                : Stack(
              clipBehavior: Clip.none,
              children: [
                ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    if (item is ChatDateSeparatorItem) {
                      return ChatDatePill(label: item.label);
                    }
                    if (item is ChatMessageItem) {
                      return ChatBubble(
                        message: item.message,
                        showPeerAvatar: !item.message.isFromUser,
                        peerAvatarUrl: _user.avatarUrl,
                        peerInitial: _user.fullName,
                        onSignNda: item.message.isNda &&
                            !item.message.isFromUser
                            ? _openNdaForSigning
                            : null,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                if (_showJumpToLatest)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 12,
                    child: Center(
                      child: Material(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: InkWell(
                          onTap: () => _scrollToBottom(),
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.bgColor,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _newMessageCount > 0
                                      ? '$_newMessageCount New Message${_newMessageCount > 1 ? 's' : ''}'
                                      : 'Jump to latest',
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(
                                    color: AppColors.bgColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          MessageInputBar(
            controller: _messageController,
            onSend: _send,
            onAttachment: () => ChatAttachmentBottomSheet.show(
              context,
              chatId: _user.id,
              onAttachmentPicked: _onAttachmentPicked,
            ),
          ),
        ],
      ),
    );
  }
}

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// PRIVATE WIDGETS
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({
    required this.imageUrl,
    required this.isOnline,
    required this.name,
  });

  final String? imageUrl;
  final bool isOnline;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.bgGray,
          backgroundImage:
          imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
              : null,
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.green1Color,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\pages\messages_list_screen.dart
`dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/presentation/pages/chat_screen.dart';
import 'package:investra/features/messages/presentation/widgets/message_tile.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  State<MessagesListScreen> createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  final _service = ChatSupabaseService();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  Timer? _searchDebounce;
  Timer? _realtimeDebounce;
  String _searchQuery = '';
  List<ChatContact> _allContacts = [];
  bool _loading = true;

  // âœ… Stream subscription Ø¹Ù„Ù‰ Ø¬Ø¯ÙˆÙ„ message
  StreamSubscription<List<Map<String, dynamic>>>? _streamSub;

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  @override
  void initState() {
    super.initState();
    _loadChats();
    _startStream();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _realtimeDebounce?.cancel();
    _streamSub?.cancel();
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  // â”€â”€ Ø¬Ù„Ø¨ Ø§Ù„Ù‚Ø§Ø¦Ù…Ø© Ù…Ù† Supabase â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Future<void> _loadChats() async {
    try {
      final contacts = await _service.fetchChats();
      if (mounted) {
        setState(() {
          _allContacts = contacts;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _loading = false);
    }
  }

  // âœ… .stream() Ø¹Ù„Ù‰ Ø¬Ø¯ÙˆÙ„ message
  // Ø¨ÙŠØªØ­Ø¯Ø« ØªÙ„Ù‚Ø§Ø¦ÙŠØ§Ù‹ Ø¹Ù†Ø¯ Ø£ÙŠ INSERT (Ø±Ø³Ø§Ù„Ø© Ø¬Ø¯ÙŠØ¯Ø©) Ø£Ùˆ UPDATE (is read Ø§ØªØºÙŠØ±)
  // â†’ Ù†Ø¹Ù…Ù„ _loadChats() Ø¨Ù€ debounce Ø¹Ø´Ø§Ù† Ù†Ø­Ø¯Ø« Ø§Ù„Ù€ unreadCount
  void _startStream() {
    _streamSub = _service.streamAllMessages().listen((_) {
      _realtimeDebounce?.cancel();
      _realtimeDebounce =
          Timer(const Duration(milliseconds: 400), _loadChats);
    });
  }

  // â”€â”€ ÙÙ„ØªØ±Ø© ÙˆØªØ±ØªÙŠØ¨ â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  List<ChatContact> _filterAndSort(List<ChatContact> contacts) {
    final q = _searchQuery.trim().toLowerCase();
    final filtered = q.isEmpty
        ? List<ChatContact>.from(contacts)
        : contacts.where((c) {
      return c.fullName.toLowerCase().contains(q) ||
          c.lastMessagePreview.toLowerCase().contains(q);
    }).toList();

    filtered.sort((a, b) {
      final timeA = a.lastMessageTime ?? DateTime(2000);
      final timeB = b.lastMessageTime ?? DateTime(2000);
      return timeB.compareTo(timeA);
    });

    return filtered;
  }

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final visible = _filterAndSort(_allContacts);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'MESSAGES',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // â”€â”€ Search Bar â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.58),
                  width: 1.6,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                focusNode: _searchFocus,
                controller: _searchController,
                cursorColor: theme.colorScheme.primary,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.blackColor),
                onChanged: (value) {
                  _searchDebounce?.cancel();
                  _searchDebounce =
                      Timer(const Duration(milliseconds: 320), () {
                        if (mounted) {
                          setState(
                                  () => _searchQuery = _searchController.text);
                        }
                      });
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.bgColor,
                  hintText: 'Search messages or people',
                  hintStyle: theme.textTheme.bodySmall
                      ?.copyWith(color: AppColors.gray2Color),
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
                    borderSide:
                    const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.transparent),
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

          // â”€â”€ Ù‚Ø§Ø¦Ù…Ø© Ø§Ù„Ø´Ø§ØªØ§Øª â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : visible.isEmpty
                ? Center(
              child: Text(
                'No matches',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.gray2Color,
                ),
              ),
            )
                : RefreshIndicator(
              onRefresh: _loadChats,
              child: ListView.separated(
                padding:
                const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: visible.length,
                separatorBuilder: (_, __) =>
                const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final c = visible[index];
                  return MessageTile(
                    contact: c,
                    lastMessagePreview: c.lastMessagePreview,
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => ChatScreen(user: c),
                        ),
                      );

                      _loadChats();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\pages\nda_screen.dart
`dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:signature/signature.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class _NdaData {
  final String entrepreneurName;
  final String entrepreneurId;
  final String investorName;
  final String investorId;
  final String ideaTitle;
  final String ideaId;

  const _NdaData({
    required this.entrepreneurName,
    required this.entrepreneurId,
    required this.investorName,
    required this.investorId,
    required this.ideaTitle,
    required this.ideaId,
  });
}

class NdaScreen extends StatefulWidget {
  const NdaScreen({super.key, required this.chatId});
  final String chatId;

  @override
  State<NdaScreen> createState() => _NdaScreenState();
}

class _NdaScreenState extends State<NdaScreen> {
  final _supabase = Supabase.instance.client;

  _NdaData? _ndaData;
  bool _loading = true;
  String? _error;
  bool _isSaving = false;

  late final SignatureController _signatureController;

  String get _myId => _supabase.auth.currentUser!.id;
  bool get _iAmInvestor => _ndaData?.investorId == _myId;


  @override
  void initState() {
    super.initState();
    _signatureController = SignatureController(
      penStrokeWidth: 2.5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
    _loadNdaData();
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }


  Future<void> _loadNdaData() async {
    try {
      final chatRow = await _supabase
          .from('chat')
          .select('entrepreneur_id, investor_id, idea_id')
          .eq('chat_id', widget.chatId)
          .single();

      final entrepreneurId = chatRow['entrepreneur_id'] as String;
      final investorId     = chatRow['investor_id']     as String;
      final ideaId         = chatRow['idea_id']         as String;

      final entrepreneurRow = await _supabase
          .from('User').select('FullName').eq('userid', entrepreneurId).single();
      final investorRow = await _supabase
          .from('User').select('FullName').eq('userid', investorId).single();
      final ideaRow = await _supabase
          .from('ideas').select('title').eq('id', ideaId).single();

      if (mounted) {
        setState(() {
          _ndaData = _NdaData(
            entrepreneurName: entrepreneurRow['FullName'] as String,
            entrepreneurId:   entrepreneurId,
            investorName:     investorRow['FullName']     as String,
            investorId:       investorId,
            ideaTitle:        ideaRow['title']            as String,
            ideaId:           ideaId,
          );
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() { _error = 'Failed to load NDA: $e'; _loading = false; });
    }
  }

  Future<Uint8List> _generatePdf(Uint8List signatureBytes) async {
    final pdf  = pw.Document();
    final d    = _ndaData!;
    final now  = DateTime.now();
    final date = '${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}';

    // ØªØ­ÙˆÙŠÙ„ Ø§Ù„ØªÙˆÙ‚ÙŠØ¹ Ù„Ù€ PdfImage
    final sigImage = pw.MemoryImage(signatureBytes);

    // Ø£Ù„ÙˆØ§Ù†
    const primaryColor = PdfColor.fromInt(0xFF1A3C5E);
    const lightGray    = PdfColor.fromInt(0xFFF5F5F5);
    const green        = PdfColor.fromInt(0xFF4CAF50);

    pw.TextStyle bodyStyle()    => const pw.TextStyle(fontSize: 11, lineSpacing: 1.5);
    pw.TextStyle boldStyle()    => pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, lineSpacing: 1.5);
    pw.TextStyle sectionStyle() => pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: primaryColor);
    pw.TextStyle titleStyle()   => pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: primaryColor);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        header: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text('NON-DISCLOSURE AGREEMENT (NDA)', style: titleStyle()),
            pw.SizedBox(height: 4),
            pw.Text('Generated through Investra Platform',
                style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
            pw.Divider(color: primaryColor, thickness: 1),
            pw.SizedBox(height: 8),
          ],
        ),
        footer: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Confidential Document',
                style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
            pw.Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
          ],
        ),
        build: (context) => [

          pw.Text('This Agreement is entered into on $date between:', style: bodyStyle()),
          pw.SizedBox(height: 12),

          pw.Container(
            padding: const pw.EdgeInsets.all(12),
            decoration: pw.BoxDecoration(
              color: lightGray,
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Entrepreneur (Disclosing Party):', style: sectionStyle()),
                pw.SizedBox(height: 4),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'Name: ', style: boldStyle()),
                  pw.TextSpan(text: d.entrepreneurName, style: bodyStyle()),
                ])),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'User ID: ', style: boldStyle()),
                  pw.TextSpan(text: d.entrepreneurId, style: bodyStyle()),
                ])),
                pw.SizedBox(height: 10),
                pw.Text('Investor (Receiving Party):', style: sectionStyle()),
                pw.SizedBox(height: 4),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'Name: ', style: boldStyle()),
                  pw.TextSpan(text: d.investorName, style: bodyStyle()),
                ])),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'User ID: ', style: boldStyle()),
                  pw.TextSpan(text: d.investorId, style: bodyStyle()),
                ])),
                pw.SizedBox(height: 10),
                pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: 'Idea Title: ', style: boldStyle()),
                  pw.TextSpan(text: d.ideaTitle, style: bodyStyle()),
                ])),
              ],
            ),
          ),

          pw.SizedBox(height: 16),


          _pdfSection('1. Purpose', sectionStyle(), bodyStyle(),
              'The purpose of this Agreement is to allow the Entrepreneur to share confidential business information, startup ideas, documents, feasibility studies, business plans, contracts, and related materials through the Investra platform for evaluation and potential investment discussions.'),

          _pdfSection('2. Confidential Information', sectionStyle(), bodyStyle(),
              'Confidential information includes but is not limited to:\n'
                  'â€¢ Business ideas and concepts\n'
                  'â€¢ Business plans\n'
                  'â€¢ Financial projections\n'
                  'â€¢ Feasibility studies\n'
                  'â€¢ Uploaded documents\n'
                  'â€¢ Product concepts\n'
                  'â€¢ Chat discussions and shared materials\n'
                  'â€¢ Contracts and investment documents\n'
                  'â€¢ Any files exchanged through the platform'),

          _pdfSection('3. Obligations of the Investor', sectionStyle(), bodyStyle(),
              'The Investor agrees:\n'
                  'â€¢ Not to copy, reproduce, distribute, or disclose confidential information to third parties\n'
                  'â€¢ Not to use shared information for personal, commercial, or competitive benefit without written permission\n'
                  'â€¢ Not to claim ownership of the entrepreneur\'s ideas, documents, or intellectual property\n'
                  'â€¢ To use the information only for evaluation and investment purposes\n'
                  'â€¢ To maintain confidentiality of all exchanged information'),

          _pdfSection('4. Ownership Rights', sectionStyle(), bodyStyle(),
              'All intellectual property rights, business ownership rights, and idea ownership remain exclusively with the Entrepreneur.\n\n'
                  'Signing this Agreement does not transfer ownership, licensing rights, or usage rights to the Investor.'),

          _pdfSection('5. Duration', sectionStyle(), bodyStyle(),
              'This Agreement shall remain valid for three (3) years from the signing date.'),

          _pdfSection('6. Breach of Agreement', sectionStyle(), bodyStyle(),
              'Unauthorized disclosure, copying, misuse, or unauthorized ownership claims regarding confidential information may result in legal action according to applicable laws.'),

          _pdfSection('7. Platform Record Acknowledgment', sectionStyle(), bodyStyle(),
              'Both parties acknowledge that this agreement, related files, signatures, timestamps, and transaction records may be stored within the Investra platform for documentation and verification purposes.'),

          _pdfSection('8. Acceptance', sectionStyle(), bodyStyle(),
              'By signing below, both parties acknowledge that they have read, understood, and accepted this agreement.'),

          pw.Divider(color: primaryColor),
          pw.SizedBox(height: 12),


          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Entrepreneur
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Entrepreneur Signature:', style: sectionStyle()),
                    pw.SizedBox(height: 4),
                    pw.Text('Name: ${d.entrepreneurName}', style: bodyStyle()),
                    pw.Text('Date: $date', style: bodyStyle()),
                    pw.SizedBox(height: 8),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: pw.BoxDecoration(
                        color: green,
                        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                      ),
                      child: pw.Text('âœ“ Signed by Entrepreneur',
                          style: pw.TextStyle(fontSize: 9, color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(width: 20),

              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Investor Signature:', style: sectionStyle()),
                    pw.SizedBox(height: 4),
                    pw.Text('Name: ${d.investorName}', style: bodyStyle()),
                    pw.Text('Date: $date', style: bodyStyle()),
                    pw.SizedBox(height: 8),

                    pw.Container(
                      height: 80,
                      width: 200,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: primaryColor, width: 0.8),
                        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                        color: PdfColors.white,
                      ),
                      child: pw.Image(sigImage, fit: pw.BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ],
          ),

          pw.SizedBox(height: 16),
          pw.Center(
            child: pw.Text(
              'Generated through Investra Platform Â· Confidential Document',
              style: pw.TextStyle(fontSize: 8, color: PdfColors.grey500),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  pw.Widget _pdfSection(String title, pw.TextStyle titleStyle,
      pw.TextStyle bodyStyle, String body) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(title, style: titleStyle),
        pw.SizedBox(height: 4),
        pw.Text(body, style: bodyStyle),
        pw.SizedBox(height: 12),
      ],
    );
  }


  Future<void> _submit() async {
    if (_signatureController.isEmpty || _ndaData == null) return;
    setState(() => _isSaving = true);

    try {

      final Uint8List? signatureBytes = await _signatureController.toPngBytes();
      if (signatureBytes == null) throw Exception('Could not export signature');


      final pdfBytes = await _generatePdf(signatureBytes);


      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName  = 'signed_NDA_${widget.chatId}_$timestamp.pdf';

      await _supabase.storage
          .from('Signed NDA Files')
          .uploadBinary(
        fileName,
        pdfBytes,
        fileOptions: const FileOptions(contentType: 'application/pdf'),
      );


      final signedUrl = _supabase.storage
          .from('Signed NDA Files')
          .getPublicUrl(fileName);


      await _supabase.from('nda_agreement').insert({
        'investor_id':    _ndaData!.investorId,
        'entrepreneur_id': _ndaData!.entrepreneurId,
        'idea_id':        _ndaData!.ideaId,
        'chat_id':        widget.chatId,
        'signed_pdf_url': signedUrl,
        'status':         'signed',
        'signed_at':      DateTime.now().toIso8601String(),
      });


      await _supabase.from('notifications').insert({
        'user_id':  _ndaData!.entrepreneurId,
        'title':    'NDA Signed âœ“',
        'content':  '${_ndaData!.investorName} has signed the NDA for "${_ndaData!.ideaTitle}"',
        'type':     'nda_signed',
        'is_read':  false,
        'idea_id':  _ndaData!.ideaId,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('NDA signed and saved successfully âœ“'),
            backgroundColor: AppColors.primaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('NDA Agreement',
            style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: theme.colorScheme.primary,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Padding(padding: const EdgeInsets.all(24),
          child: Text(_error!, textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red))))
          : _buildContent(theme),
    );
  }

  Widget _buildContent(ThemeData theme) {
    final d    = _ndaData!;
    final now  = DateTime.now();
    final date = '${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}';

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Column(children: [
                  Text('NON-DISCLOSURE AGREEMENT',
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text('(NDA)', style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
                ])),
                const SizedBox(height: 16),
                _ndaText('This Non-Disclosure Agreement ("Agreement") is entered into on $date between:'),
                const SizedBox(height: 12),
                _sectionLabel('Entrepreneur (Disclosing Party):'),
                _ndaField('Name', d.entrepreneurName),
                _ndaField('User ID', d.entrepreneurId),
                const SizedBox(height: 8),
                _sectionLabel('Investor (Receiving Party):'),
                _ndaField('Name', d.investorName),
                _ndaField('User ID', d.investorId),
                const SizedBox(height: 8),
                _sectionLabel('Idea Title:'),
                _ndaText(d.ideaTitle, bold: true, color: theme.colorScheme.primary),
                const SizedBox(height: 16),
                _divider(),
                _flutterSection('1. Purpose',
                    'The purpose of this Agreement is to allow the Entrepreneur to share confidential business information, startup ideas, documents, feasibility studies, business plans, contracts, and related materials through the Investra platform for evaluation and potential investment discussions.'),
                _flutterSection('2. Confidential Information',
                    'Confidential information includes but is not limited to:\nâ€¢ Business ideas and concepts\nâ€¢ Business plans\nâ€¢ Financial projections\nâ€¢ Feasibility studies\nâ€¢ Uploaded documents\nâ€¢ Product concepts\nâ€¢ Chat discussions and shared materials\nâ€¢ Contracts and investment documents\nâ€¢ Any files exchanged through the platform'),
                _flutterSection('3. Obligations of the Investor',
                    'The Investor agrees:\nâ€¢ Not to copy, reproduce, distribute, or disclose confidential information to third parties\nâ€¢ Not to use shared information for personal, commercial, or competitive benefit without written permission\nâ€¢ Not to claim ownership of the entrepreneur\'s ideas, documents, or intellectual property\nâ€¢ To use the information only for evaluation and investment purposes\nâ€¢ To maintain confidentiality of all exchanged information'),
                _flutterSection('4. Ownership Rights',
                    'All intellectual property rights, business ownership rights, and idea ownership remain exclusively with the Entrepreneur.\n\nSigning this Agreement does not transfer ownership, licensing rights, or usage rights to the Investor.'),
                _flutterSection('5. Duration',
                    'This Agreement shall remain valid for three (3) years from the signing date.'),
                _flutterSection('6. Breach of Agreement',
                    'Unauthorized disclosure, copying, misuse, or unauthorized ownership claims regarding confidential information may result in legal action according to applicable laws.'),
                _flutterSection('7. Platform Record Acknowledgment',
                    'Both parties acknowledge that this agreement, related files, signatures, timestamps, and transaction records may be stored within the Investra platform for documentation and verification purposes.'),
                _flutterSection('8. Acceptance',
                    'By signing below, both parties acknowledge that they have read, understood, and accepted this agreement.'),
                _divider(),
                _sectionLabel('Entrepreneur Signature:'),
                _ndaField('Name', d.entrepreneurName),
                _ndaField('Date', date),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.withOpacity(0.4)),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.check_circle_outline, color: Colors.green, size: 16),
                    const SizedBox(width: 6),
                    Text('Signed by Entrepreneur',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.green, fontWeight: FontWeight.w600)),
                  ]),
                ),
                const SizedBox(height: 6),
                Text('Generated through Investra Platform Â· Confidential Document',
                    style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.4), fontSize: 10)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // signature+ submit
          if (_iAmInvestor) ...[
            Text('Investor Signature',
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
            const SizedBox(height: 4),
            Text('Sign in the box below using your finger',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.55))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.4), width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Signature(
                  controller: _signatureController,
                  height: 180,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _signatureController.clear(),
                icon: const Icon(Icons.refresh_rounded, size: 16, color: Colors.red),
                label: const Text('Clear',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
              ),
            ),
            _ndaField('Name', d.investorName),
            _ndaField('Date', date),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: _isSaving
                    ? const SizedBox(width: 22, height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                    : const Text('Submit & Sign NDA',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ] else ...[

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF59E0B).withOpacity(0.4)),
              ),
              child: Row(children: [
                const Icon(Icons.hourglass_empty_rounded,
                    color: Color(0xFFF59E0B), size: 22),
                const SizedBox(width: 12),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Waiting for investor signature',
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFF59E0B), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    Text('The investor will receive a request to sign this NDA.',
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFFF59E0B).withOpacity(0.8))),
                  ],
                )),
              ]),
            ),
          ],
        ],
      ),
    );
  }


  Widget _ndaText(String t, {bool bold = false, Color? color}) => Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(t, style: TextStyle(fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
          color: color, height: 1.5)));

  Widget _sectionLabel(String t) => Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(t, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)));

  Widget _ndaField(String label, String value) => Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: RichText(text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
            TextSpan(text: value),
          ])));

  Widget _flutterSection(String title, String body) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, height: 1.6)),
        Text(body,  style: const TextStyle(fontSize: 13, height: 1.55)),
      ]));

  Widget _divider() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: AppColors.primaryColor.withOpacity(0.2), thickness: 1));
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\widgets\chat_attachment_bottom_sheet.dart
`dart
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/messages/data/chat_supabase_service.dart';
import 'package:investra/features/messages/presentation/pages/nda_screen.dart';
import 'package:investra/features/messages/presentation/widgets/message_input_bar.dart';

class ChatAttachmentBottomSheet extends StatelessWidget {
  const ChatAttachmentBottomSheet({
    super.key,
    required this.onDocumentTap,
    required this.onImageTap,
    required this.onNdaTap,
  });

  final Future<void> Function() onDocumentTap;
  final Future<void> Function() onImageTap;
  final Future<void> Function() onNdaTap;

  static Future<void> show(
      BuildContext context, {
        required String chatId,
        required void Function(PendingAttachment) onAttachmentPicked,
      }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return ChatAttachmentBottomSheet(
          onDocumentTap: () async {
            Navigator.of(sheetContext).pop();
            final attachment = await _pickDocument(context);
            if (attachment != null) onAttachmentPicked(attachment);
          },
          onImageTap: () async {
            Navigator.of(sheetContext).pop();
            final attachment = await _pickImage(context);
            if (attachment != null) onAttachmentPicked(attachment);
          },
          onNdaTap: () async {
            Navigator.of(sheetContext).pop();

            final service = ChatSupabaseService();
            final isEntrepreneur = await service.isEntrepreneur();
            if (!context.mounted) return;

            if (isEntrepreneur) {
              try {
                await service.sendNdaRequest(chatId: chatId);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('NDA request sent to investor âœ“'),
                      backgroundColor: AppColors.primaryColor,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to send NDA: $e'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              }
            } else {
              await Navigator.of(context).push<bool>(
                MaterialPageRoute(
                  builder: (_) => NdaScreen(chatId: chatId),
                ),
              );
            }
          },
        );
      },
    );
  }

  static Future<PendingAttachment?> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked == null) return null;
    return PendingAttachment.image(file: File(picked.path));
  }

  static Future<PendingAttachment?> _pickDocument(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null || result.files.isEmpty) return null;

    final file = result.files.single;
    if (file.bytes == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not read file'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return null;
    }

    return PendingAttachment.document(
      bytes: file.bytes!,
      fileName: file.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF1B2635) : AppColors.bgColor;
    final tileColor =
    isDark ? const Color(0xFF233144) : AppColors.secondary2Color;
    final titleColor = theme.colorScheme.onSurface;
    final subtitleColor = theme.colorScheme.onSurface.withValues(alpha: 0.65);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Material(
          color: surfaceColor,
          elevation: 16,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 18),
                _AttachmentActionTile(
                  icon: Icons.description_outlined,
                  title: 'Document',
                  subtitle: 'Pick any file from your device',
                  iconColor: const Color(0xFF3B82F6),
                  tileColor: tileColor,
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                  onTap: onDocumentTap,
                ),
                const SizedBox(height: 12),
                _AttachmentActionTile(
                  icon: Icons.photo_library_outlined,
                  title: 'Images',
                  subtitle: 'Choose a photo from gallery',
                  iconColor: const Color(0xFF10B981),
                  tileColor: tileColor,
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                  onTap: onImageTap,
                ),
                const SizedBox(height: 12),
                _AttachmentActionTile(
                  icon: Icons.assignment_outlined,
                  title: 'Contract (NDA)',
                  subtitle: 'Send NDA request to investor',
                  iconColor: const Color(0xFFF59E0B),
                  tileColor: tileColor,
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                  onTap: onNdaTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AttachmentActionTile extends StatelessWidget {
  const _AttachmentActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.tileColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color tileColor;
  final Color titleColor;
  final Color subtitleColor;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: tileColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 23),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: subtitleColor,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, size: 22, color: subtitleColor),
            ],
          ),
        ),
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\widgets\chat_bubble.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    this.showPeerAvatar = true,
    this.peerAvatarUrl,
    this.peerInitial,
    this.onSignNda,
  });

  final ChatMessage message;
  final bool showPeerAvatar;
  final String? peerAvatarUrl;
  final String? peerInitial;
  final VoidCallback? onSignNda;

  @override
  Widget build(BuildContext context) {
    // â”€â”€ NDA bubble â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    if (message.isNda) {
      return _NdaBubble(
        isOutgoing: message.isFromUser,
        timeLabel: message.timeLabel,
        isRead: message.isRead,
        onSignNda: onSignNda,
        showPeerAvatar: showPeerAvatar,
        peerAvatarUrl: peerAvatarUrl,
        peerInitial: peerInitial,
      );
    }

    // â”€â”€ Image bubble â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    if (message.messageType == 'image') {
      return _ImageBubble(
        message: message,
        showPeerAvatar: showPeerAvatar,
        peerAvatarUrl: peerAvatarUrl,
        peerInitial: peerInitial,
      );
    }

    // â”€â”€ Document bubble â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    if (message.messageType == 'document') {
      return _DocumentBubble(
        message: message,
        showPeerAvatar: showPeerAvatar,
        peerAvatarUrl: peerAvatarUrl,
        peerInitial: peerInitial,
      );
    }

    // â”€â”€ Text bubble (default) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    final isOutgoing = message.isFromUser;
    final theme = Theme.of(context);

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
      ),
      child: Column(
        crossAxisAlignment:
        isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: isOutgoing
                  ? AppColors.primaryColor
                  : AppColors.secondary1Color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isOutgoing ? 18 : 4),
                bottomRight: Radius.circular(isOutgoing ? 4 : 18),
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                message.text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color:
                  isOutgoing ? AppColors.bgColor : AppColors.blackColor,
                  height: 1.35,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          _TimeRow(
            timeLabel: message.timeLabel,
            isOutgoing: isOutgoing,
            isRead: message.isRead,
          ),
        ],
      ),
    );

    if (isOutgoing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [bubble],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showPeerAvatar) ...[
            _SmallAvatar(avatarUrl: peerAvatarUrl, label: peerInitial),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 36),
          bubble,
        ],
      ),
    );
  }
}

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// NDA BUBBLE
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

class _NdaBubble extends StatelessWidget {
  const _NdaBubble({
    required this.isOutgoing,
    required this.timeLabel,
    required this.isRead,
    required this.onSignNda,
    required this.showPeerAvatar,
    this.peerAvatarUrl,
    this.peerInitial,
  });

  final bool isOutgoing;
  final String timeLabel;
  final bool isRead;
  final VoidCallback? onSignNda;
  final bool showPeerAvatar;
  final String? peerAvatarUrl;
  final String? peerInitial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
      ),
      child: Column(
        crossAxisAlignment:
        isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isOutgoing
                  ? AppColors.primaryColor.withOpacity(0.12)
                  : AppColors.secondary1Color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isOutgoing ? 18 : 4),
                bottomRight: Radius.circular(isOutgoing ? 4 : 18),
              ),
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.35),
                width: 1.2,
              ),
            ),
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color:
                        const Color(0xFFF59E0B).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.assignment_outlined,
                        color: Color(0xFFF59E0B),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NDA Agreement',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          'Non-Disclosure Agreement',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.gray2Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Ù†Øµ Ø§Ù„Ø±Ø³Ø§Ù„Ø©
                Text(
                  isOutgoing
                      ? 'You requested the investor to sign the NDA.'
                      : 'Please review and sign the NDA agreement to proceed.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isOutgoing
                        ? AppColors.grayColor
                        : AppColors.blackColor,
                    height: 1.4,
                  ),
                ),
                // Ø²Ø± Sign NDA Ù„Ù„Ù…Ø³ØªØ«Ù…Ø± ÙÙ‚Ø·
                if (!isOutgoing && onSignNda != null) ...[
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onSignNda,
                      icon: const Icon(Icons.draw_outlined,
                          size: 16, color: Colors.white),
                      label: const Text(
                        'Sign NDA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                        const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
                // Ù„Ù„Ù€ entrepreneur: Pending
                if (isOutgoing) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.hourglass_empty_rounded,
                          size: 13, color: Color(0xFFF59E0B)),
                      const SizedBox(width: 4),
                      Text(
                        'Pending investor signature',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: const Color(0xFFF59E0B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 4),
          _TimeRow(
            timeLabel: timeLabel,
            isOutgoing: isOutgoing,
            isRead: isRead,
          ),
        ],
      ),
    );

    if (isOutgoing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [bubble],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showPeerAvatar) ...[
            _SmallAvatar(avatarUrl: peerAvatarUrl, label: peerInitial),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 36),
          bubble,
        ],
      ),
    );
  }
}

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// IMAGE BUBBLE
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({
    required this.message,
    required this.showPeerAvatar,
    this.peerAvatarUrl,
    this.peerInitial,
  });

  final ChatMessage message;
  final bool showPeerAvatar;
  final String? peerAvatarUrl;
  final String? peerInitial;

  @override
  Widget build(BuildContext context) {
    final isOutgoing = message.isFromUser;

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.72,
      ),
      child: Column(
        crossAxisAlignment:
        isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(isOutgoing ? 16 : 4),
              bottomRight: Radius.circular(isOutgoing ? 4 : 16),
            ),
            child: Image.network(
              message.text,
              width: 220,
              height: 180,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, progress) => progress == null
                  ? child
                  : Container(
                width: 220,
                height: 180,
                color: AppColors.bgGray,
                child: const Center(
                    child: CircularProgressIndicator()),
              ),
              errorBuilder: (_, __, ___) => Container(
                width: 220,
                height: 180,
                color: AppColors.bgGray,
                child: const Icon(Icons.broken_image_outlined,
                    color: AppColors.grayColor),
              ),
            ),
          ),
          const SizedBox(height: 4),
          _TimeRow(
            timeLabel: message.timeLabel,
            isOutgoing: isOutgoing,
            isRead: message.isRead,
          ),
        ],
      ),
    );

    if (isOutgoing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [bubble],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showPeerAvatar) ...[
            _SmallAvatar(avatarUrl: peerAvatarUrl, label: peerInitial),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 36),
          bubble,
        ],
      ),
    );
  }
}

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// DOCUMENT BUBBLE
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

class _DocumentBubble extends StatelessWidget {
  const _DocumentBubble({
    required this.message,
    required this.showPeerAvatar,
    this.peerAvatarUrl,
    this.peerInitial,
  });

  final ChatMessage message;
  final bool showPeerAvatar;
  final String? peerAvatarUrl;
  final String? peerInitial;

  String get _fileName {
    try {
      final uri = Uri.parse(message.text);
      final raw = uri.pathSegments.last;
      // Ø§Ø´ÙŠÙ„ Ø§Ù„Ù€ timestamp Ù…Ù† Ø£ÙˆÙ„ Ø§Ù„Ø§Ø³Ù… (Ù…Ø«Ù„Ø§Ù‹ 1777930282671_roadmap.pdf)
      return raw.replaceAll(RegExp(r'^\d+_'), '');
    } catch (_) {
      return 'Document';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOutgoing = message.isFromUser;
    final theme = Theme.of(context);

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.72,
      ),
      child: Column(
        crossAxisAlignment:
        isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isOutgoing
                  ? AppColors.primaryColor
                  : AppColors.secondary1Color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isOutgoing ? 16 : 4),
                bottomRight: Radius.circular(isOutgoing ? 4 : 16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.insert_drive_file_outlined,
                  color: isOutgoing
                      ? Colors.white70
                      : AppColors.primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    _fileName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isOutgoing
                          ? Colors.white
                          : AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          _TimeRow(
            timeLabel: message.timeLabel,
            isOutgoing: isOutgoing,
            isRead: message.isRead,
          ),
        ],
      ),
    );

    if (isOutgoing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [bubble],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showPeerAvatar) ...[
            _SmallAvatar(avatarUrl: peerAvatarUrl, label: peerInitial),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 36),
          bubble,
        ],
      ),
    );
  }
}

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
// SHARED WIDGETS
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

class _TimeRow extends StatelessWidget {
  const _TimeRow({
    required this.timeLabel,
    required this.isOutgoing,
    required this.isRead,
  });

  final String timeLabel;
  final bool isOutgoing;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          timeLabel,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.gray2Color,
            fontSize: 11,
          ),
        ),
        if (isOutgoing) ...[
          const SizedBox(width: 4),
          Icon(
            isRead ? Icons.done_all : Icons.done,
            size: 16,
            color: isRead
                ? const Color(0xFF34B7F1)
                : AppColors.gray2Color,
          ),
        ],
      ],
    );
  }
}

class _SmallAvatar extends StatelessWidget {
  const _SmallAvatar({this.avatarUrl, this.label});

  final String? avatarUrl;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: AppColors.bgGray,
      backgroundImage:
      avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      child: avatarUrl == null
          ? Text(
        (label != null && label!.isNotEmpty)
            ? label![0].toUpperCase()
            : '?',
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      )
          : null,
    );
  }
}

class ProjectTopicBanner extends StatelessWidget {
  const ProjectTopicBanner({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: AppColors.secondary1Color,
      child: Row(
        children: [
          CustomSvgPicture(
            path: AppImages.idea2Svg,
            color: AppColors.primaryColor,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatDatePill extends StatelessWidget {
  const ChatDatePill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.bgGray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.darkGray,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\widgets\message_input_bar.dart
`dart
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';

// â”€â”€ Ù…Ù„Ù/ØµÙˆØ±Ø© Ø¬Ø§Ù‡Ø²Ø© Ù„Ù„Ø¥Ø±Ø³Ø§Ù„ (Ù‚Ø¨Ù„ Ø§Ù„Ø±ÙØ¹ Ù„Ù€ Supabase) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
enum PendingAttachmentType { image, document }

class PendingAttachment {
  const PendingAttachment._({
    required this.type,
    this.file,
    this.bytes,
    this.fileName,
  });

  final PendingAttachmentType type;
  final File? file;
  final Uint8List? bytes;
  final String? fileName;

  factory PendingAttachment.image({required File file}) {
    return PendingAttachment._(
      type: PendingAttachmentType.image,
      file: file,
    );
  }

  factory PendingAttachment.document({
    required Uint8List bytes,
    required String fileName,
  }) {
    return PendingAttachment._(
      type: PendingAttachmentType.document,
      bytes: bytes,
      fileName: fileName,
    );
  }
}

class MessageInputBar extends StatelessWidget {
  const MessageInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onAttachment,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onAttachment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 0,
      color: AppColors.bgColor,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onAttachment,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.secondary1Color,
                  foregroundColor: AppColors.primaryColor,
                ),
                icon: CustomSvgPicture(
                  path: AppImages.addSvg,
                  color: AppColors.primaryColor,
                  width: 22,
                  height: 22,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  style: theme.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondary2Color,
                    hintText: 'Type a message...',
                    hintStyle: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.gray2Color,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(color: AppColors.bgGray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(color: AppColors.bgGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Material(
                color: AppColors.primaryColor,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onSend,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomSvgPicture(
                      path: AppImages.sendSvg,
                      color: AppColors.bgColor,
                      width: 22,
                      height: 22,
                    ),
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

``n
### File: D:\FlutterProjects\Investra_App\lib\features\messages\presentation\widgets\message_tile.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.contact,
    required this.lastMessagePreview,
    required this.onTap,
  });

  final ChatContact contact;
  final String lastMessagePreview;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Avatar(avatarUrl: contact.avatarUrl, fullName: contact.fullName),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            contact.fullName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastMessagePreview,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.grayColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          contact.timeAgo,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.gray2Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({this.avatarUrl, required this.fullName});

  final String? avatarUrl;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: AppColors.bgGray,
      backgroundImage: avatarUrl != null
          ? NetworkImage(avatarUrl!)
          : null,
      child: avatarUrl == null
          ? Text(
              fullName.isNotEmpty ? fullName[0].toUpperCase() : '?',
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          : null,
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count > 9 ? '9+' : '$count',
        style: const TextStyle(
          color: AppColors.bgColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\notifications\data\models\notification_model.dart
`dart
class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final String? ideaId;
  final String? requestId;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.ideaId,
    this.requestId,

  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      type: json['type'] ?? 'chat',
      isRead: json['is_read'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      ideaId: json['idea_id'],
      requestId: json['request_id'],
     // status: json['status'] ?? 'pending',
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\notifications\presentation\pages\notifications_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/notifications/data/models/notification_model.dart';
import 'package:investra/features/profile/presentation/pages/profile_screen.dart';
import 'package:investra/features/idea_details/domain/idea_logic.dart';
import 'package:investra/features/home/presentation/pages/entrepreneur_idea_details_screen.dart';
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
          // ðŸ” ØªØ´Ø®ÙŠØµ Ù…Ø¤Ù‚Øª â€” Ø´ÙˆÙ Ù†ØªÙŠØ¬ØªÙ‡ Ø¨Ø§Ù„Ù€ Debug Console ÙˆØ¨Ø¹Ø¯ÙŠÙ† Ù†Ø´ÙŠÙ„Ù‡
          debugPrint(
              'NOTIF DEBUG -> type: ${item.type} | ideaId: ${item.ideaId} | requestId: ${item.requestId}');

          try {
            await supabase
                .from('notifications')
                .update({'is_read': true})
                .eq('id', item.id);
          } catch (e) {
            debugPrint("Error marking notification as read: $e");
          }

          // âœ… Ø¥Ø´Ø¹Ø§Ø± Ø§Ø³ØªØ«Ù…Ø§Ø±: ÙˆØ¯Ù‘ÙŠ Ø±Ø§Ø¦Ø¯ Ø§Ù„Ø£Ø¹Ù…Ø§Ù„ Ù„ØµÙØ­Ø© ØªÙØ§ØµÙŠÙ„ Ø§Ù„ÙÙƒØ±Ø© Ù…Ø¨Ø§Ø´Ø±Ø©
          // Ù…Ø¹ ØªÙ…Ø±ÙŠØ± Ù‡ÙˆÙŠØ© Ø§Ù„Ù…Ø³ØªØ«Ù…Ø± ÙˆØ·Ù„Ø¨ Ø§Ù„Ø§Ø³ØªØ«Ù…Ø§Ø± Ø§Ù„Ù…Ø±ØªØ¨Ø·ØŒ Ø¹Ø´Ø§Ù† Ù„Ù…Ø§ ÙŠØ±ÙØ¹
          // Ø§Ù„Ø¹Ù‚Ø¯ ØªÙ†Ø¹Ù…Ù„ Ø¹Ù…Ù„ÙŠØ© "Funding" ÙƒØ§Ù…Ù„Ø© (ØªØ­Ø¯ÙŠØ« Ø­Ø§Ù„Ø© Ø§Ù„ÙÙƒØ±Ø© + investments + Ø¥Ø´Ø¹Ø§Ø± Ø±Ø¯).
          if (item.type == 'invest') {
            if (item.ideaId == null) {
              debugPrint('NOTIF DEBUG -> ideaId is null, cannot navigate.');
              return;
            }

            final logic = IdeaLogic();
            final idea = await logic.getIdeaById(item.ideaId!);
            final investorId = item.requestId != null
                ? await logic.getInvestorIdFromRequest(item.requestId!)
                : null;

            debugPrint(
                'NOTIF DEBUG -> idea: ${idea != null} | investorId: $investorId');

            if (idea != null && context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EntrepreneurIdeaDetailsScreen(
                    ideaData: idea,
                    investorId: investorId,
                    requestId: item.requestId,
                  ),
                ),
              );
            }
            return;
          }

          // âœ… Ø¥Ø´Ø¹Ø§Ø± "ØªÙ… ØªØ£ÙƒÙŠØ¯ Ø§Ù„Ø§Ø³ØªØ«Ù…Ø§Ø±" (ÙŠØµÙ„ Ù„Ù„Ù…Ø³ØªØ«Ù…Ø±) â€” Ø­Ø§Ù„ÙŠØ§Ù‹ Ø¨Ø¯ÙˆÙ† ØªÙ†Ù‚Ù„ Ø®Ø§Øµ
          if (item.type == 'funded') {
            return;
          }

          if (item.type == 'chat') {
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

``n
### File: D:\FlutterProjects\Investra_App\lib\features\onboarding\presentation\pages\about_us_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E4D7B)),
          onPressed: () => Navigator.pop(context),
        ),
        // Larger AppBar Title
        title: Text(_currentPage == 0 ? "MISSION & STORY" : "VALUES", 
          style: const TextStyle(color: Color(0xFF1E4D7B), letterSpacing: 2, fontSize: 16, fontWeight: FontWeight.w900)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: [
                _buildMissionStoryPage(),
                _buildValuesPage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? const Color(0xFF1E4D7B) : const Color(0xFF1E4D7B).withValues(alpha: 0.2),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionStoryPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(15),
          // Our Mission Card
          _infoCard("Our Mission", 
            "Our mission is to empower entrepreneurs by providing a secure and intelligent platform that connects innovative ideas with the right investors. We aim to simplify the investment journey, enhance trust between users, and support the growth of impactful projects through technology and collaboration.",
            isPrimary: true),
          const Gap(25),
          // Our Story Card - Now matches Mission shape
          _infoCard("Our Story", 
            "Every great idea deserves a chance. Investra began as a graduation project driven by one belief: too many powerful ideas are left behind, not because they lack potential, but because they lack the right connections.\n\nWe set out to change that. By bringing entrepreneurs and investors together in one smart, secure space, Investra turns missed opportunities into real collaborations. What started as a student project is now a visionâ€”to unlock innovation, fuel ambition, and help ideas grow into something bigger.",
            isPrimary: false),
          const Gap(40),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String content, {required bool isPrimary}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF1E4D7B) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isPrimary ? 0.2 : 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, 
            style: TextStyle(
              color: isPrimary ? Colors.white : const Color(0xFF1E4D7B), 
              fontWeight: FontWeight.bold, 
              fontSize: 26, 
              fontFamily: 'DMSerif'
            )),
          const Gap(15),
          Text(content,
            style: TextStyle(
              color: isPrimary ? Colors.white.withValues(alpha: 0.85) : Colors.black87, 
              fontSize: 14, 
              height: 1.6
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValuesPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(15),
          // Larger Title
          const Text("Our Values", 
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66), fontFamily: 'DMSerif')),
          const Text("The pillars of our culture and product.", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const Gap(40),
          _valueItem(Icons.people_outline, "Collaboration", "Shared success is the core of our ecosystem. We build tools that bridge gaps between minds."),
          _valueItem(Icons.security, "Security", "Trust is earned through transparency and military-grade encryption in every transaction."),
          _valueItem(Icons.lightbulb_outline, "Innovation", "Constant evolution is mandatory. We leverage AI to stay ahead of market shifts."),
          _valueItem(Icons.trending_up, "Growth", "We measure our success by the compounding value we create for our collaborative networks."),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _valueItem(IconData i, String t, String d) => Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(i, color: const Color(0xFF1E4D7B), size: 30),
        const Gap(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0D3B66))),
              const Gap(6),
              Text(d, style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.5)),
            ],
          ),
        ),
      ],
    ),
  );
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\onboarding\presentation\pages\onboarding_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investra/core/styles/colors.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../../../auth/presentation/pages/register_screen.dart';
import 'about_us_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(20),
              const Text(
                "INVESTRA",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 8,
                  color: AppColors.primaryColor,
                  fontSize: 28,
                ),
              ),
              const Spacer(flex: 1),

              // Image Section with tilted tag
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.08),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/groupcollab.png',
                        height: isSmallScreen ? 180 : 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Tilted Tag like Figma
                  Transform.rotate(
                    angle: -0.05,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withValues(alpha: 0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Together is Better",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Gap(4),
                          Icon(Icons.edit, size: 10, color: Colors.orange),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // Styled Title with specific colors
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "START ",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                        fontFamily: 'DMSerif',
                      ),
                    ),
                    TextSpan(
                      text: "GROWING\n",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E4D7B),
                        fontFamily: 'DMSerif',
                      ),
                    ),
                    TextSpan(
                      text: "TOGETHER",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                        fontFamily: 'DMSerif',
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(15),

              const Text(
                "The all-in-one platform where ideas grow into opportunities. Connect with investors, collaborate securely, and build the future.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
              ),

              const Spacer(flex: 2),

              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E4D7B),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Gap(12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      side: BorderSide(
                        color: const Color(0xFF1E4D7B).withValues(alpha: 0.1),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xFF1E4D7B),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const Gap(25),

              const Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _Badge(text: "AI ASSISTED"),
                  _Badge(text: "REAL TIME SYNC"),
                  _Badge(text: "ENTERPRISE GRADE"),
                ],
              ),

              const Spacer(flex: 1),

              Column(
                children: [
                  const Text(
                    "Investra",
                    style: TextStyle(
                      color: Color(0xFF0D3B66),
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(4),
                  const Text(
                    "Â© 2026 INVESTRA APP. BUILT FOR YOUR FUTURE.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Gap(6),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsScreen(),
                      ),
                    ),
                    child: const Text(
                      "About us",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE8ECEF).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bolt, size: 10, color: Colors.orange),
          const Gap(4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\data\models\profile_model.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class ProfileModel {
  final String userId;
  final String fullName;
  final String? profilePicture;
  final String? bio;
  final String role;
  final int totalActivity;
  final int activeChats;

  ProfileModel({
    required this.userId,
    required this.fullName,
    this.profilePicture,
    this.bio,
    required this.role,
    required this.totalActivity,
    required this.activeChats,
  });

  // ØªÙ… Ø­Ù„ Ù…Ø´ÙƒÙ„Ø© Ø§Ù„Ù€ 2 positional arguments Ø¨Ø¬Ø¹Ù„ Ø§Ù„Ø¯ÙˆØ± Ø§Ø®ØªÙŠØ§Ø±ÙŠ ÙˆØ°ÙƒÙŠ ÙÙŠ Ø§Ù„ÙØ­Øµ
  factory ProfileModel.fromView(Map<String, dynamic> json, [String? userRole]) {
    // Ù„Ùˆ Ø§Ù„Ù€ role Ù…Ø´ Ù…Ø¨Ø¹ÙˆØªØŒ Ø¨Ù†ÙØ­Øµ Ø§Ù„Ù…ÙØ§ØªÙŠØ­ Ø§Ù„Ù„ÙŠ Ø±Ø§Ø¬Ø¹Ø© Ù…Ù† Ø§Ù„Ø³ÙŠØ±ÙØ± ØªÙ„Ù‚Ø§Ø¦ÙŠØ§Ù‹
    final String actualRole = userRole ??
        (json.containsKey('FullName') || json.containsKey('total_requests_sent') ? 'Investor' : 'Entrepreneur');

    if (actualRole.toLowerCase() == 'investor') {
      return ProfileModel(
        userId: json['userid'] ?? '',
        fullName: json['FullName'] ?? 'Investor',
        profilePicture: json['profile_picture'],
        bio: json['bio'] ?? '',
        role: 'Investor',
        totalActivity: json['total_requests_sent'] ?? 0,
        activeChats: json['active_chats'] ?? 0,
      );
    } else {
      return ProfileModel(
        userId: json['userid'] ?? '',
        fullName: json['name'] ?? 'Entrepreneur',
        profilePicture: json['profile picture'],
        bio: json['bio'] ?? '',
        role: 'Entrepreneur',
        totalActivity: json['numberofideas'] ?? 0,
        activeChats: 0,
      );
    }
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json, [String? userRole]) {
    return ProfileModel.fromView(json, userRole);
  }

  // âœ… ÙŠØ³Ù…Ø­ Ø¨ØªØ­Ø¯ÙŠØ« Ø§Ù„ØµÙˆØ±Ø©/Ø§Ù„Ø¨Ø§ÙŠÙˆ Ù…Ù† Ù…ØµØ¯Ø± Ù…ÙˆØ­Ù‘Ø¯ (Ø¬Ø¯ÙˆÙ„ profile)
  // Ø¨ÙŠØ³ØªØ®Ø¯Ù… Ø§Ù„Ù‚ÙŠÙ…Ø© Ø§Ù„Ø¬Ø¯ÙŠØ¯Ø© ÙÙ‚Ø· Ù„Ùˆ Ù…ÙˆØ¬ÙˆØ¯Ø© ÙˆØºÙŠØ± ÙØ§Ø¶ÙŠØ©ØŒ ÙˆØ¥Ù„Ø§ Ø¨ÙŠØ±Ø¬Ø¹ Ø§Ù„Ù‚ÙŠÙ…Ø© Ø§Ù„Ù‚Ø¯ÙŠÙ…Ø©
  ProfileModel copyWith({
    String? profilePicture,
    String? bio,
  }) {
    return ProfileModel(
      userId: userId,
      fullName: fullName,
      profilePicture: (profilePicture != null && profilePicture.isNotEmpty)
          ? profilePicture
          : this.profilePicture,
      bio: (bio != null && bio.isNotEmpty) ? bio : this.bio,
      role: role,
      totalActivity: totalActivity,
      activeChats: activeChats,
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\data\services\profile_service.dart
`dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/profile_model.dart';

class ProfileService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<ProfileModel?> fetchUserProfile(String userId) async {
    try {
      // âœ… Ø§Ù„ØµÙˆØ±Ø© ÙˆØ§Ù„Ù€ bio Ø¯Ø§ÙŠÙ…Ø§Ù‹ Ù…Ù† Ø¬Ø¯ÙˆÙ„ profile Ø§Ù„Ù…ÙˆØ­Ù‘Ø¯ØŒ Ù…Ù‡Ù…Ø§ ÙƒØ§Ù† Ù†ÙˆØ¹ Ø§Ù„ÙŠÙˆØ²Ø±
      // (Investor Ø£Ùˆ Entrepreneur) - Ù‡Ø§Ø¯ Ø§Ù„Ù…ØµØ¯Ø± Ø§Ù„ÙˆØ­ÙŠØ¯ Ù„Ù„ØµÙˆØ±Ø© Ø¨ÙƒÙ„ Ø§Ù„ØªØ·Ø¨ÙŠÙ‚
      final profileResponse = await _supabase
          .from('profile')
          .select('profile_picture, bio')
          .eq('userid', userId)
          .maybeSingle();

      // ðŸ” Debug: Ø´ÙˆÙÙŠ Ø¨Ø§Ù„Ù€ console Ø´Ùˆ Ø§Ù„Ù‚ÙŠÙ…Ø© Ø§Ù„Ø±Ø§Ø¬Ø¹Ø© ÙØ¹Ù„ÙŠØ§Ù‹
      debugPrint('ðŸ” [profile table] userId=$userId -> response=$profileResponse');

      final String? unifiedPicture = profileResponse?['profile_picture'];
      final String? unifiedBio = profileResponse?['bio'];

      debugPrint('ðŸ” [profile table] unifiedPicture=$unifiedPicture');

      // Ù†Ø¬Ø±Ø¨ Ø§Ù„Ø§Ø³ØªØ«Ù…Ø§Ø± Ø£ÙˆÙ„Ø§Ù‹
      final investorResponse = await _supabase
          .from('investor_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (investorResponse != null) {
        debugPrint('ðŸ” Found as Investor: $userId');
        return ProfileModel.fromView(investorResponse, 'Investor').copyWith(
          profilePicture: unifiedPicture,
          bio: unifiedBio,
        );
      }

      // ÙˆØ¥Ù„Ø§ Ù†Ø¬Ø±Ø¨ Ø±Ø§Ø¦Ø¯ Ø§Ù„Ø£Ø¹Ù…Ø§Ù„
      final entrepreneurResponse = await _supabase
          .from('entrepreneur_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (entrepreneurResponse != null) {
        debugPrint('ðŸ” Found as Entrepreneur: $userId');
        return ProfileModel.fromView(entrepreneurResponse, 'Entrepreneur').copyWith(
          profilePicture: unifiedPicture,
          bio: unifiedBio,
        );
      }

      debugPrint('âš ï¸ No profile found at all for userId=$userId');
      return null;
    } catch (e) {
      debugPrint('âŒ Error fetching profile data: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getEntrepreneurIdeas(String userId) async {
    try {
      final response = await _supabase
          .from('entrepreneur_full_profile')
          .select('idea_id, idea_title, idea_description, idea_status')
          .eq('userid', userId);

      if (response != null && response.isNotEmpty) {
        List<Map<String, dynamic>> ideasList = [];
        for (var row in response) {
          if (row['idea_id'] != null) {
            ideasList.add({
              'id': row['idea_id'],
              'title': row['idea_title'],
              'description': row['idea_description'],
              'status': row['idea_status'],
              'user_id': userId,
            });
          }
        }
        return ideasList;
      }
      return [];
    } catch (e) {
      debugPrint('Error fetching ideas from view: $e');
      return [];
    }
  }

  Future<int> getEntrepreneurDocsCount(String userId) async {
    try {
      final response = await _supabase
          .from('ideas')
          .select('business_plan_url, feasibility_study_url')
          .eq('entrepreneur_id', userId);

      int totalDocs = 0;

      if (response != null && response.isNotEmpty) {
        for (var row in response) {
          final businessPlan = row['business_plan_url'];
          final feasibilityStudy = row['feasibility_study_url'];

          if (businessPlan != null && (businessPlan as String).isNotEmpty) {
            totalDocs++;
          }
          if (feasibilityStudy != null && (feasibilityStudy as String).isNotEmpty) {
            totalDocs++;
          }
        }
      }
      return totalDocs;
    } catch (e) {
      debugPrint('Error counting entrepreneur docs: $e');
      return 0;
    }
  }

  Future<int> getInvestorInvestmentsCount(String userId) async {
    try {
      final response = await _supabase
          .from('investments')
          .select('id')
          .eq('investor_id', userId);
      return response.length;
    } catch (e) {
      debugPrint('Error counting investments: $e');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getInvestorInvestments(String userId) async {
    try {
      final response = await _supabase
          .from('investments')
          .select('id, idea_id, investment_date, ideas(title, description, status, ai_rating)')
          .eq('investor_id', userId);

      return response.map<Map<String, dynamic>>((row) {
        final idea = row['ideas'] as Map<String, dynamic>?;
        return {
          'investment_id': row['id'],
          'idea_id': row['idea_id'],
          'investment_date': row['investment_date'],
          'title': idea?['title'] ?? 'Untitled Idea',
          'description': idea?['description'] ?? '',
          'status': idea?['status'] ?? 'pending',
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching investor investments: $e');
      return [];
    }
  }

  Future<int> getInvestorChatsCount(String userId) async {
    try {
      final response = await _supabase
          .from('chat')
          .select('chat_id')
          .eq('investor_id', userId);
      return response.length;
    } catch (e) {
      debugPrint(' Error counting investor live chats: $e');
      return 0;
    }
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\presentation\pages\profile_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/profile_service.dart';
import '../widgets/entrepreneur_view_body.dart';
import '../widgets/investor_view_body.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileService _logic = ProfileService();
  late Future<ProfileModel?> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = _logic.fetchUserProfile(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
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
          'PROFILE',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<ProfileModel?>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Error loading profile.', style: TextStyle(color: AppColors.errorColor)));
          }

          final profile = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.secondary1Color,
                    backgroundImage: profile.profilePicture != null && profile.profilePicture!.isNotEmpty
                        ? NetworkImage(profile.profilePicture!)
                        : null,
                    child: profile.profilePicture == null || profile.profilePicture!.isEmpty
                        ? const Icon(Icons.person, size: 50, color: AppColors.primaryColor)
                        : null,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  profile.fullName,
                  style: const TextStyle(color: AppColors.primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  profile.role.toUpperCase(),
                  style: const TextStyle(color: AppColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.2),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    profile.bio != null && profile.bio!.isNotEmpty ? profile.bio! : 'No bio available.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.grayColor, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),

                profile.role == 'Investor'
                    ? InvestorViewBody(profile: profile)
                    : EntrepreneurViewBody(profile: profile, logic: _logic),
              ],
            ),
          );
        },
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\presentation\widgets\entrepreneur_view_body.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/profile_service.dart';

class EntrepreneurViewBody extends StatefulWidget {
  final ProfileModel profile;
  final ProfileService logic;

  const EntrepreneurViewBody({super.key, required this.profile, required this.logic});

  @override
  State<EntrepreneurViewBody> createState() => _EntrepreneurViewBodyState();
}

class _EntrepreneurViewBodyState extends State<EntrepreneurViewBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _docsCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadDocsCount();
  }

  Future<void> _loadDocsCount() async {
    final count = await widget.logic.getEntrepreneurDocsCount(widget.profile.userId);
    if (mounted) {
      setState(() {
        _docsCount = count;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
                future: widget.logic.getEntrepreneurIdeas(widget.profile.userId),
                builder: (context, snapshot) {
                  final ideasCount = snapshot.data?.length ?? 0;
                  return _buildStatCard(ideasCount.toString(), 'Ideas');
                },
              ),
              _buildStatCard('0', 'contracts'),
              _buildStatCard(_docsCount.toString(), 'Docs'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.grayColor,
          indicatorColor: AppColors.primaryColor,
          indicatorWeight: 2.5,
          tabs: const [
            Tab(text: 'Ideas'),
            Tab(text: 'Entrepreneur Details'),
          ],
        ),
        Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: _tabController,
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
                future: widget.logic.getEntrepreneurIdeas(widget.profile.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No ideas pitched yet.', style: TextStyle(color: AppColors.grayColor)));
                  }
                  final ideas = snapshot.data!;
                  return ListView.builder(
                    itemCount: ideas.length,
                    itemBuilder: (context, index) {
                      final idea = ideas[index];
                      final bool isFunded = idea['status'] == 'funded';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.bgGray),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.lightbulb_outline, color: AppColors.primaryColor),
                          title: Text(idea['title'] ?? 'No Title', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor)),
                          subtitle: Text(idea['description'] ?? 'No Description', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.grayColor)),
                          // âœ… Ø¨Ø§Ø¯Ø¬ ÙŠÙˆØ¶Ø­ Ø­Ø§Ù„Ø© Ø§Ù„ÙÙƒØ±Ø© (Pending / Funded) Ø¨Ù†Ø§Ø¡Ù‹ Ø¹Ù„Ù‰ ideas.status
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isFunded
                                  ? AppColors.green1Color.withOpacity(0.15)
                                  : AppColors.secondary1Color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              (idea['status'] ?? 'pending').toString().toUpperCase(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: isFunded ? AppColors.green1Color : AppColors.grayColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const Center(child: Text('No details provided yet.', style: TextStyle(color: AppColors.grayColor))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.grayColor)),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\presentation\widgets\investor_view_body.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/profile_service.dart';

class InvestorViewBody extends StatefulWidget {
  final ProfileModel profile;

  const InvestorViewBody({super.key, required this.profile});

  @override
  State<InvestorViewBody> createState() => _InvestorViewBodyState();
}

class _InvestorViewBodyState extends State<InvestorViewBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProfileService _logic = ProfileService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Ù‚Ø³Ù… Ø§Ù„Ø¥Ø­ØµØ§Ø¦ÙŠØ§Øª (INVESTMENTS & CHATS)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder<int>(
                future: _logic.getInvestorInvestmentsCount(widget.profile.userId),
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 0;
                  return _buildStatCard(count.toString(), 'INVESTMENTS');
                },
              ),
              FutureBuilder<int>(
                future: _logic.getInvestorChatsCount(widget.profile.userId),
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 0;
                  return _buildStatCard(count.toString(), 'CHATS');
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // 2. Ø§Ù„Ù€ TabBar Ø¹Ø´Ø§Ù† ÙŠÙØµÙ„ Ø¨ÙŠÙ† Ø§Ù„Ù‚ÙˆØ§Ø¦Ù… Ø²ÙŠ Ø§Ù„ÙÙŠØ¬Ù…Ø§ ÙˆØ±Ø§Ø¦Ø¯ Ø§Ù„Ø£Ø¹Ù…Ø§Ù„
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.grayColor,
          indicatorColor: AppColors.primaryColor,
          indicatorWeight: 2.5,
          tabs: const [
            Tab(text: 'Investments'),
            Tab(text: 'Investor Details'),
          ],
        ),

        Container(
          height: 250, // Ù…Ø³Ø§Ø­Ø© Ù…Ø±ÙŠØ­Ø© Ù„Ù„Ù€ Empty State ÙˆØ§Ù„Ù€ Scrolling Ù„Ø§Ø­Ù‚Ø§Ù‹
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: _tabController,
            children: [

              FutureBuilder<List<Map<String, dynamic>>>(
                future: _logic.getInvestorInvestments(widget.profile.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.primaryColor),
                    );
                  }

                  final investments = snapshot.data ?? [];
                  if (investments.isEmpty) {
                    return const Center(
                      child: Text(
                        'No active investments to show.',
                        style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: investments.length,
                    itemBuilder: (context, index) {
                      final inv = investments[index];
                      final bool isFunded = inv['status'] == 'funded';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.bgGray),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.trending_up, color: AppColors.primaryColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    inv['title'] ?? 'Untitled',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  Text(
                                    inv['description'] ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grayColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isFunded
                                    ? AppColors.green1Color.withOpacity(0.15)
                                    : AppColors.secondary1Color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                isFunded ? 'Funded' : 'Pending',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isFunded ? AppColors.green1Color : AppColors.grayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              const Center(
                child: Text(
                  'No details provided yet.',
                  style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bgGray),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.grayColor, letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\presentation\widgets\profile_header.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;
  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),

        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.bgGray, width: 2),
          ),
          child: CircleAvatar(
            radius: 54,
            backgroundColor: AppColors.secondary1Color,
            backgroundImage: profile.profilePicture != null && profile.profilePicture!.isNotEmpty
                ? NetworkImage(profile.profilePicture!)
                : const AssetImage('') as ImageProvider,
          ),
        ),
        const SizedBox(height: 12),

        Text(
          profile.fullName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontFamily: 'CabinetGrotesk',
          ),
        ),
        const SizedBox(height: 4),
        // Ø§Ù„Ù€ Role Ø¨Ø­Ø±ÙˆÙ ÙƒØ§Ø¨ÙŠØªØ§Ù„ ÙˆÙ„ÙˆÙ† Ø§Ù„Ù€ Primary
        Text(
          profile.role.toUpperCase(),
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 13,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            profile.bio ?? 'Building the future through innovative tech.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grayColor,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\profile\presentation\widgets\user_ideas_list.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../../idea_details/presentation/pages/idea_details_screen.dart';

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


``n
### File: D:\FlutterProjects\Investra_App\lib\features\search\presentation\pages\search_screen.dart
`dart


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\pages\change_password_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _supabase = Supabase.instance.client;
  bool _isLoading = false;

  Future<void> _handleUpdate() async {

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userEmail = _supabase.auth.currentUser?.email;


      await _supabase.auth.signInWithPassword(
        email: userEmail,
        password: _currentPasswordController.text.trim(),
      );

      await _supabase.auth.updateUser(
        UserAttributes(password: _newPasswordController.text.trim()),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password changed successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } on AuthException catch (e) {

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppColors.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {

    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text(
          "Change Password",
          style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TextFormField(
                controller: _currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Current Password",
                  hintText: "Enter your current password",
                ),
                validator: (val) =>
                val!.isEmpty ? "Current password is required" : null,
              ),
              const SizedBox(height: 20),

              // Ø­Ù‚Ù„ ÙƒÙ„Ù…Ø© Ø§Ù„Ù…Ø±ÙˆØ± Ø§Ù„Ø¬Ø¯ÙŠØ¯Ø©
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "New Password",
                  hintText: "Enter at least 6 characters",
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "New password is required";
                  if (val.length < 6) return "Password must be at least 6 characters";
                  return null;
                },
              ),
              const SizedBox(height: 20),


              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm New Password",
                  hintText: "Re-enter your new password",
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Please confirm your password";
                  if (val != _newPasswordController.text) return "Passwords do not match";
                  return null;
                },
              ),
              const SizedBox(height: 40),


              _isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                  : ElevatedButton(
                onPressed: _handleUpdate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save New Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\pages\security_settings_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../widgets/build_icon_container.dart';

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "How can we help?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              "Top Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFAQExpandable(
              "How do I publish my idea?",
              "Create an idea profile and upload the required business documents.",
            ),
            _buildFAQExpandable(
              "Can investors view my documents?",
              "Only after approval and NDA completion, if required.",
            ),
            _buildFAQExpandable(
              "How does AI help investors?",
              "AI provides idea assessments and insights to support investment decisions.",
            ),
            _buildFAQExpandable(
              "Is my information secure?",
              "Yes, Investra uses secure authentication, protected storage, and controlled document access.",
            ),
            const SizedBox(height: 35),

            const Text(
              "Contact Us Directly",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildContactOption(
              icon: Icons.mail_outline_rounded,
              title: "Email Us",
              trailingText: "investraSupport@gmail.com",
            ),
            _buildContactOption(
              icon: Icons.phone_outlined,
              title: "Phone",
              trailingText: "1779",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQExpandable(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        iconColor: AppColors.primaryColor,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              answer,
              style: const TextStyle(color: AppColors.darkGray, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          buildIconContainer(
            icon: Icon(icon, color: AppColors.primaryColor, size: 22),
          ),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          Text(
            trailingText,
            style: const TextStyle(color: AppColors.grayColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\pages\settings_screen.dart
`dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:investra/features/auth/presentation/pages/login_screen.dart';
import 'security_settings_screen.dart';


import 'change_password_screen.dart';
import '../widgets/build_profile_card.dart';
import '../widgets/build_progress_card.dart';
import '../widgets/build_section_title.dart';
import '../widgets/build_settings_item.dart';
import '../widgets/build_setting_toggle.dart';

class SettingsScreen extends StatefulWidget {
  final ScrollController scrollController;
  const SettingsScreen({super.key, required this.scrollController});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  Map<String, dynamic>? _userData;
  String? _profileImageUrl;
  int _usedIdeas = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final uid = _supabase.auth.currentUser?.id;
      if (uid == null) return;

      final userDoc = await _supabase.from('User').select('role, FullName, email').eq('userid', uid).maybeSingle();

      final profileDoc = await _supabase.from('profile').select('profile_picture, bio').eq('userid', uid).maybeSingle();


      final ideasResponse = await _supabase.from('ideas').select('id').eq('entrepreneur_id', uid);
      final int actualCount = (ideasResponse as List).length;

      if (mounted) {
        setState(() {
          _userData = userDoc;
          if (_userData != null && profileDoc != null) {
            _userData!['bio'] = profileDoc['bio'];
          }
          _profileImageUrl = profileDoc?['profile_picture'];
          _usedIdeas = actualCount;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Fetch Error: $e");
      if (mounted) setState(() => _isLoading = false);
    }
  }


  Future<void> _showImageOptions() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppColors.primaryColor),
              title: const Text("Upload New Picture"),
              onTap: () {
                Navigator.pop(context);
                _uploadProfilePicture();
              },
            ),
            if (_profileImageUrl != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text("Delete Picture", style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await _deleteProfilePicture();
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteProfilePicture() async {
    setState(() => _isLoading = true);
    try {
      final uid = _supabase.auth.currentUser!.id;
      await _supabase.from('profile').update({'profile_picture': null}).eq('userid', uid);
      setState(() {
        _profileImageUrl = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint("Delete Error: $e");
    }
  }

  Future<void> _uploadProfilePicture() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return;

    setState(() => _isLoading = true);
    try {
      final file = File(image.path);
      final uid = _supabase.auth.currentUser!.id;
      final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.png';
      final filePath = '$uid/$fileName';

      await _supabase.storage.from('profiles').upload(filePath, file);
      final publicUrl = _supabase.storage.from('profiles').getPublicUrl(filePath);
      final finalUrl = "$publicUrl?t=${DateTime.now().millisecondsSinceEpoch}";

      await _supabase.from('profile').upsert({
        'userid': uid,
        'profile_picture': finalUrl,
      }, onConflict: 'userid');

      if (mounted) {
        setState(() {
          _profileImageUrl = finalUrl;
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile picture updated!")));
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload failed: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }


    final role = _userData?['role']?.toString() ?? 'User';
    final name = _userData?['FullName']?.toString() ?? 'Investra Member';
    final bio = _userData?['bio']?.toString() ?? _userData?['email']?.toString() ?? "Member";
    final bool isEntrepreneur = role.toLowerCase() == 'entrepreneur';

    return Column(
      children: [

        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          centerTitle: false,
          title: const Text('Investra', style: TextStyle(color: AppColors.primaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
          actions: [
            _buildNotificationIcon(),
            const SizedBox(width: 4),
            IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecuritySettingsScreen()),
                );
              },
              icon: const Icon(Icons.help_outline_rounded, color: AppColors.primaryColor, size: 26),
            ),
            const SizedBox(width: 12),
            _buildSmallProfileAvatar(),
            const SizedBox(width: 16),
          ],
        ),


        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [

                BuildProfileCard(
                  name: name,
                  role: role,
                  bio: bio,
                  imageUrl: _profileImageUrl,
                  onEditProfile: _showImageOptions,
                ),
                const SizedBox(height: 24),

                if (isEntrepreneur) ...[
                  BuildProgressCard(
                    usedIdeas: _usedIdeas,
                    totalLimit: 2,
                  ),
                  const SizedBox(height: 24),
                ],

                const BuildSectionTitle(title: 'SECURITY'),
                BuildSettingsItem(
                  icon: const Icon(Icons.lock_outline, color: AppColors.primaryColor),
                  title: 'Change Password',
                  subtitle: 'Update your security credentials',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                    );
                  },
                ),

                const SizedBox(height: 24),
                const SizedBox(height: 40),


                _buildLogoutButton(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildNotificationIcon() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase.from('notifications').stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        final userId = _supabase.auth.currentUser?.id;
        final unread = snapshot.data?.where((n) => n['user_id'] == userId && n['is_read'] == false).toList() ?? [];
        return Stack(
          children: [
            IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
              icon: SvgPicture.asset(AppImages.notificationSvg, colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
            ),
            if (unread.isNotEmpty)
              Positioned(
                right: 12,
                top: 12,
                child: Container(width: 9, height: 9, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
              ),
          ],
        );
      },
    );
  }


  Widget _buildLogoutButton() {
    return TextButton.icon(
      onPressed: () async {
        await _supabase.auth.signOut();
        if (mounted) {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
          );
        }
      },
      icon: const Icon(Icons.logout, color: AppColors.errorColor),
      label: const Text("Sign Out", style: TextStyle(color: AppColors.errorColor, fontWeight: FontWeight.bold)),
    );
  }

  Future<void> _viewProfileImage() {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _profileImageUrl != null
                  ? Image.network(_profileImageUrl!, fit: BoxFit.contain)
                  : Image.asset('assets/images/profile.png', fit: BoxFit.contain),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallProfileAvatar() {
    return GestureDetector(
      onTap: _viewProfileImage,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor.withOpacity(0.1), width: 1),
          image: _profileImageUrl != null
              ? DecorationImage(image: NetworkImage(_profileImageUrl!), fit: BoxFit.cover)
              : const DecorationImage(image: AssetImage('assets/images/profile.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_icon_container.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class buildIconContainer extends StatelessWidget {
  const buildIconContainer({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: icon,
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_profile_card.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String bio;
  final String? imageUrl;
  final VoidCallback onEditProfile;

  const BuildProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.bio,
    required this.onEditProfile,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 15,
          )
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.secondary1Color,
                backgroundImage: (imageUrl != null && imageUrl!.startsWith('http'))
                    ? NetworkImage(imageUrl!)
                    : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                onBackgroundImageError: (exception, stackTrace) {
                  debugPrint("Image Error: $exception");
                },
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onEditProfile,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor
                    )
                ),
                Text(
                    bio,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.grayColor, fontSize: 14)
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightgreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    role.toUpperCase(),
                    style: const TextStyle(
                        color: AppColors.green1Color,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_progress_card.dart
`dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';

class BuildProgressCard extends StatelessWidget {
  final int usedIdeas;
  final int totalLimit;

  const BuildProgressCard({
    super.key,
    required this.usedIdeas,
    this.totalLimit = 2,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = (usedIdeas / totalLimit).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Idea Submission Limit',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SvgPicture.asset(
                AppImages.idea2Svg,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$usedIdeas / $totalLimit ideas used',
            style: const TextStyle(color: Colors.white70, fontSize: 17),
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.submissionColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_section_title.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_security_tile.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'build_icon_container.dart';

class buildSecurityTile extends StatelessWidget {
  const buildSecurityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.subtitleColor,
    this.trailing,
    this.onTap,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Color? subtitleColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            buildIconContainer(icon: icon),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      if (trailing != null) ...[
                        const SizedBox(width: 8),
                        trailing!,
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleColor ?? AppColors.grayColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.grayColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_settings_item.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSettingsItem extends StatelessWidget {
  const BuildSettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.subtitleColor,
    this.onTap,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Color? subtitleColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.bgColor,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.bgGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: subtitleColor ?? AppColors.gray2Color,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.gray2Color),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\settings\presentation\widgets\build_setting_toggle.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class CustomSettingsToggle extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSettingsToggle({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.bgColor,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.bgGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.gray2Color, fontSize: 12),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\splash\presentation\pages\splash_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/auth/data/services/auth_service.dart';
import 'package:investra/features/auth/presentation/pages/login_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_entrepreneur_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_investor_screen.dart';
import 'package:investra/features/onboarding/presentation/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _mainController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeIn),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeOutBack),
    );

    _mainController.forward();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    try {
      final session = Supabase.instance.client.auth.currentSession;
      final prefs = await SharedPreferences.getInstance();
      final bool isNotNewDevice = prefs.getBool('is_not_new_device') ?? false;

      if (session != null) {
        final String role = await AuthService().updateUserSessionAndGetRole(session.user.id);
        if (!mounted) return;
        await prefs.setBool('is_not_new_device', true);

        if (role == 'Entrepreneur') {
          _navigateTo(const MainAppEntrepreneurScreen());
        } else if (role == 'Investor') {
          _navigateTo(const MainAppInvestorScreen());
        } else {
          _navigateTo(const LoginScreen());
        }
      } else {
        if (isNotNewDevice) {
          _navigateTo(const LoginScreen());
        } else {
          await prefs.setBool('is_not_new_device', true);
          _navigateTo(const OnboardingScreen());
        }
      }
    } catch (e) {
      debugPrint("Error in Splash Navigation: $e");
      if (mounted) {
        _navigateTo(const LoginScreen());
      }
    }
  }

  void _navigateTo(Widget nextScreen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered Big Logo
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    'assets/images/big_logo.png',
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\features\submit_idea\data\services\submit_idea_service.dart
`dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class SubmitIdeaService {
  final SupabaseClient _supabase = Supabase.instance.client;

  static const String _aiBaseUrl = 'https://investraapp-production.up.railway.app';

  Future<void> submitIdea({
    required String title,
    required String description,
    required String category,
    required File? businessPlanFile,
    required File? feasibilityFile,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not logged in');

      String? bpUrl;
      String? fsUrl;

      // 1. Ø±ÙØ¹ Ø®Ø·Ø© Ø§Ù„Ø¹Ù…Ù„ (Business Plan)
      if (businessPlanFile != null) {
        String fileName = 'bp_${DateTime.now().millisecondsSinceEpoch}.pdf';
        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', businessPlanFile);
        bpUrl = _supabase.storage
            .from('ideas_docs')
            .getPublicUrl('public/$fileName');
      }

      // 2. Ø±ÙØ¹ Ø¯Ø±Ø§Ø³Ø© Ø§Ù„Ø¬Ø¯ÙˆÙ‰ (Feasibility Study)
      if (feasibilityFile != null) {
        String fileName = 'fs_${DateTime.now().millisecondsSinceEpoch}.pdf';
        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', feasibilityFile);
        fsUrl = _supabase.storage
            .from('ideas_docs')
            .getPublicUrl('public/$fileName');
      }

      // 3. Ø¥Ø¯Ø±Ø§Ø¬ Ø§Ù„Ø¨ÙŠØ§Ù†Ø§Øª ÙÙŠ Ø¬Ø¯ÙˆÙ„ 'ideas' ÙˆØ§Ø³ØªØ±Ø¬Ø§Ø¹ Ø§Ù„Ù€ id Ø§Ù„Ø¬Ø¯ÙŠØ¯
      final inserted = await _supabase
          .from('ideas')
          .insert({
        'title': title,
        'description': description,
        'category': category,
        'entrepreneur_id': userId,
        'business_plan_url': bpUrl,
        'feasibility_study_url': fsUrl,
        'status': 'pending',
      })
          .select('id')
          .single();

      final ideaId = inserted['id'].toString();

      // 4. Ø¥Ø·Ù„Ø§Ù‚ Ø·Ù„Ø¨ Ø§Ù„ØªÙ‚ÙŠÙŠÙ… Ø¨Ø§Ù„Ù€ AI Ù…Ù† ØºÙŠØ± Ù…Ø§ Ù†ÙˆÙ‚Ù Ù†Ø¬Ø§Ø­ Ø§Ù„Ù€ submit Ø¹Ù„ÙŠÙ‡
      final fileToEvaluate = businessPlanFile ?? feasibilityFile;
      if (fileToEvaluate != null) {
        _triggerAiEvaluation(
          ideaId: ideaId,
          userId: userId,
          file: fileToEvaluate,
        );
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<void> _triggerAiEvaluation({
    required String ideaId,
    required String userId,
    required File file,
  }) async {
    try {
      final uri = Uri.parse('$_aiBaseUrl/evaluate');
      final request = http.MultipartRequest('POST', uri)
        ..fields['idea_id'] = ideaId
        ..fields['user_id'] = userId
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      final streamedResponse = await request.send();
      if (streamedResponse.statusCode != 200) {
        // ignore: avoid_print
        print('AI evaluation failed with status ${streamedResponse.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('AI evaluation request error: $e');
    }
  }
}

``n
### File: D:\FlutterProjects\Investra_App\lib\features\submit_idea\presentation\pages\submit_idea_screen.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/features/messages/presentation/widgets/chat_attachment_bottom_sheet.dart';
import 'package:investra/features/submit_idea/presentation/widgets/submit_button.dart';
import 'package:investra/core/widgets/custom_snackbar.dart';
import 'package:investra/features/submit_idea/data/services/submit_idea_service.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


/// Multi-step idea submission form aligned with app design tokens.
class SubmitIdeaScreen extends StatefulWidget {
  const SubmitIdeaScreen({super.key});

  @override
  State<SubmitIdeaScreen> createState() => _SubmitIdeaScreenState();
}

class _SubmitIdeaScreenState extends State<SubmitIdeaScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _pitchController = TextEditingController();
  final SubmitIdeaService _submitIdeaService = SubmitIdeaService();

  File? _businessPlanFile;
  File? _feasibilityFile;
  bool _isUploading = false;

  String? _category;

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

  bool get _step3Complete =>
      _businessPlanFile != null || _feasibilityFile != null;

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

  // 1. ÙˆØ¸ÙŠÙØ© Ù„Ø§Ø®ØªÙŠØ§Ø± Ø§Ù„Ù…Ù„Ù Ù…Ù† Ø§Ù„Ù…ÙˆØ¨Ø§ÙŠÙ„ ÙˆØªØ®Ø²ÙŠÙ†Ù‡
  Future<void> _pickDocument(bool isBusinessPlan) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        if (isBusinessPlan) {
          _businessPlanFile = File(result.files.single.path!);
        } else {
          _feasibilityFile = File(result.files.single.path!);
        }
      });
      updateStepProgress();
    }
  }


  Future<void> _submitAllData() async {
    setState(() => _isUploading = true);

    try {
      await _submitIdeaService.submitIdea(
        title: _titleController.text.trim(),
        description: _pitchController.text.trim(),
        category: _category ?? 'Other',
        businessPlanFile: _businessPlanFile,
        feasibilityFile: _feasibilityFile,
      );

      if (mounted) {
        CustomSnackBar.showSuccess(context, 'Your idea has been submitted successfully!');
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        CustomSnackBar.showError(context, 'An error occurred: $e');
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
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
              isChecked: _businessPlanFile != null,
              isFileUploaded: _businessPlanFile != null,
              onCheckboxChanged: (v) => _pickDocument(true),
              onAdd: () => _pickDocument(true),
            ),
            const SizedBox(height: 8),
            _ChecklistTile(
              label: 'Feasibility Study',
              isChecked: _feasibilityFile != null,
              isFileUploaded: _feasibilityFile != null,
              onCheckboxChanged: (v) => _pickDocument(false),
              onAdd: () => _pickDocument(false),
            ),
            const SizedBox(height: 28),

            SubmitIdeaSubmitButton(
              enabled: _formComplete && !_isUploading,
              onPressed: _submitAllData,
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
    required this.isChecked,
    required this.isFileUploaded,
    required this.onCheckboxChanged,
    required this.onAdd,
  });

  final String label;
  final bool isChecked;
  final bool isFileUploaded;
  final ValueChanged<bool?> onCheckboxChanged;
  final Future<void> Function() onAdd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: AppColors.secondary1Color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onCheckboxChanged(!isChecked),
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
                value: isChecked,
                onChanged: onCheckboxChanged,
                side: const BorderSide(color: AppColors.bgGray, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
              IconButton(
                onPressed: () => onAdd(),
                tooltip: isFileUploaded ? 'Document added' : 'Add document',
                icon: Icon(isFileUploaded ? Icons.check_circle : Icons.add),
                iconSize: 22,
                style: IconButton.styleFrom(
                  foregroundColor: isFileUploaded ? AppColors.green1Color : AppColors.primaryColor,
                  backgroundColor: isFileUploaded ? AppColors.lightgreen : AppColors.secondary2Color,
                  padding: const EdgeInsets.all(6),
                  minimumSize: const Size.square(36),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: isFileUploaded
                          ? AppColors.green1Color.withValues(alpha: 0.2)
                          : AppColors.bgGray,
                    ),
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

``n
### File: D:\FlutterProjects\Investra_App\lib\features\submit_idea\presentation\widgets\submit_button.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
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
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? AppColors.primaryColor : const Color(0xFFE8EBF0),
          foregroundColor: enabled ? AppColors.bgColor : AppColors.grayColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: CustomSvgPicture(
          path: AppImages.rocketSvg,
          color: enabled
              ? AppColors.bgColor
              : AppColors.grayColor.withValues(alpha: 0.38),
          width: 22,
          height: 22,
        ),
        label: Text(
          'Submit Idea',
          style: theme.textTheme.titleMedium?.copyWith(
            color: enabled
                ? AppColors.bgColor
                : AppColors.grayColor.withValues(alpha: 0.38),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


``n
### File: D:\FlutterProjects\Investra_App\lib\main.dart
`dart
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/features/auth/presentation/pages/login_screen.dart';
import 'package:investra/features/main_app/presentation/pages/main_app_entrepreneur_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/features/splash/presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // supabase with investra
  await Supabase.initialize(
    url: 'https://eruuwckhnkisegwirxzj.supabase.co',
    anonKey: 'sb_publishable_M8lhYOIXog8c-bf0p8gCDQ_B-APa-Ih',
  );

  runApp(const InvestraApp());
}

class InvestraApp extends StatelessWidget {
  const InvestraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investra',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'DMSerif',
        scaffoldBackgroundColor: AppColors.bgColor,
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          onPrimary: AppColors.bgColor,
          surface: AppColors.bgColor,
          onSurface: AppColors.blackColor,
          secondary: AppColors.grayColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.bgColor,
          foregroundColor: AppColors.primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSerif',
          ),
          iconTheme: IconThemeData(color: AppColors.primaryColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.bgColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.bgGray, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.bgGray, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          hintStyle: const TextStyle(color: AppColors.gray2Color, fontSize: 15),
          labelStyle: const TextStyle(color: AppColors.grayColor, fontSize: 14),
          floatingLabelStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.bgColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          titleLarge: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(color: AppColors.darkGray, fontSize: 15),
          bodySmall: TextStyle(color: AppColors.gray2Color, fontSize: 13),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}


``n
