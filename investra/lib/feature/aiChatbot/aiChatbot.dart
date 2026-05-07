import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:investra/feature/aiChatbot/aiChatHistory.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AiChatbotScreen extends StatefulWidget {
  final Function(bool)? onScroll;
  final String? existingSessionId;

  const AiChatbotScreen({super.key, this.onScroll, this.existingSessionId});

  @override
  State<AiChatbotScreen> createState() => _AiChatbotScreenState();
}

class _AiChatbotScreenState extends State<AiChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final _supabase = Supabase.instance.client;

  String? _currentSessionId;
  String _userName = "User";
  bool _isLoading = true;
  bool _isMenuOpen = false;
  bool _isSending = false;

  File? _selectedFile;
  String? _selectedFileName;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      final userData = await _supabase.from('User').select('FullName').eq('userid', user.id).maybeSingle();
      if (userData != null) setState(() => _userName = userData['FullName']);

      if (widget.existingSessionId != null) {
        setState(() {
          _currentSessionId = widget.existingSessionId;
          _isLoading = false;
        });
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
      final nowStr = DateTime.now().toIso8601String(); // phone time

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
        'created_at': nowStr, // send current time
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
    if (result != null) {
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
        'created_at': DateTime.now().toIso8601String(), // send real time
      });

    } catch (e) {
      debugPrint("Send Error: $e");
    } finally {
      if (mounted) setState(() => _isSending = false);
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AiChatHistoryScreen()),
                );
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
        if (!snapshot.hasData) return const SizedBox();
        final messages = snapshot.data!;
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: messages.length,
          itemBuilder: (context, index) => _buildChatBubble(messages[index]),
        );
      },
    );
  }

  Widget _buildChatBubble(Map<String, dynamic> msg) {
    bool isAi = msg['sender_role'] == 'assistant';
    String time = msg['created_at'] != null
        ? DateFormat('h:mm a').format(DateTime.parse(msg['created_at']))
        : "";

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
                if (msg['content'] != null)
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
            padding: const EdgeInsets.only(top: 4),
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
              leading: Container(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset('assets/icons/ai_chatbot.svg', width: 20, height: 20, color: AppColors.primaryColor),
              ),
              title: const Text("New Chat", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() => _isMenuOpen = false);
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
          Expanded(child: Text(_selectedFileName!, style: const TextStyle(fontWeight: FontWeight.bold))),
          IconButton(
            icon: const Icon(Icons.cancel, color: AppColors.errorColor),
            onPressed: () => setState(() { _selectedFile = null; _selectedFileName = null; }),
          ),
        ],
      ),
    );
  }
}