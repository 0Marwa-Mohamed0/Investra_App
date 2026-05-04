import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

class AiChatbotScreen extends StatefulWidget {
  final Function(bool)? onScroll;
  const AiChatbotScreen({super.key, this.onScroll});

  @override
  State<AiChatbotScreen> createState() => _AiChatbotScreenState();
}

class _AiChatbotScreenState extends State<AiChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final _supabase = Supabase.instance.client;

  String? _currentSessionId;
  String _userName = "username";
  bool _isLoading = true;
  String? _errorMessage;

  // ألوان مطابقة لتصميم Figma الخاص بـ Investra
  final Color primaryNavy = const Color(0xFF132F4C);
  final Color lightAiBubble = const Color(0xFFF3F6F9); // لون فقاعة الـ AI الفاتح
  final Color backgroundWhite = Colors.white;

  @override
  void initState() {
    super.initState();
    _setupChat();
  }

  Future<void> _setupChat() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) {
        setState(() {
          _errorMessage = "Connection error. Please try again.";
          _isLoading = false;
        });
        return;
      }

      // جلب اسم المستخدم
      final userData = await _supabase
          .from('User')
          .select('name')
          .eq('userid', user.id)
          .maybeSingle();

      if (userData != null && userData['name'] != null) {
        setState(() => _userName = userData['name']);
      }

      // جلب أو إنشاء جلسة
      final existingSession = await _supabase
          .from('AI_Sessions')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();

      if (existingSession != null) {
        setState(() {
          _currentSessionId = existingSession['session_id'];
          _isLoading = false;
        });
      } else {
        await _createNewChatSession(user.id);
      }
    } catch (e) {
      debugPrint("INVESTRA_ERROR_LOG: $e");
      setState(() {
        _errorMessage = "Connection error. Please try again.";
        _isLoading = false;
      });
    }
  }

  Future<void> _createNewChatSession(String userId) async {
    try {
      final newSession = await _supabase.from('AI_Sessions').insert({
        'user_id': userId,
        'title': 'Investra Chat Session',
      }).select().single();

      setState(() {
        _currentSessionId = newSession['session_id'];
        _isLoading = false;
      });

      await _insertMessage(
          "Hi $_userName , I am your Investra AI\nhow can i help you today",
          'assistant'
      );
    } catch (e) {
      setState(() {
        _errorMessage = "Connection error. Please try again.";
        _isLoading = false;
      });
    }
  }

  Future<void> _insertMessage(String content, String role) async {
    if (_currentSessionId == null) return;
    try {
      await _supabase.from('AI_Messages').insert({
        'session_id': _currentSessionId,
        'sender_role': role,
        'content': content,
      });
    } catch (e) {
      debugPrint("MESSAGE_ERROR: $e");
    }
  }

  void _handleSendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _currentSessionId == null) return;

    _messageController.clear();
    await _insertMessage(text, 'user');
  }

  // التعامل مع خيارات القائمة المنسدلة (Popup Menu)
  void _handleMenuSelection(String value) {
    if (value == 'new_chat') {
      setState(() => _isLoading = true);
      _createNewChatSession(_supabase.auth.currentUser!.id);
    } else {
      // هنا يمكنك إضافة منطق تحليل الضعف أو رفع الملفات لاحقاً
      debugPrint("Selected: $value");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      appBar: AppBar(
        backgroundColor: backgroundWhite,
        elevation: 0,
        centerTitle: false,
        leading: Icon(Icons.auto_awesome, color: primaryNavy, size: 20),
        title: Text("AI CONSULTANT",
            style: TextStyle(
              color: primaryNavy,
              fontWeight: FontWeight.w800,
              fontSize: 16,
              letterSpacing: 0.5,
            )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: primaryNavy, size: 22),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade200, height: 1.0), // خط خفيف تحت الـ AppBar
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: primaryNavy));
    }

    if (_errorMessage != null) {
      // شاشة الخطأ التي تشبه الشاشة الرمادية لكن مع زر لإعادة المحاولة بشكل نظيف
      return Container(
        color: const Color(0xFFE0E0E0), // نفس اللون الرمادي بصورتك
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
                _setupChat();
              },
              child: const Text("Retry"),
            )
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(child: _buildMessagesStream()),
        _buildInputArea(),
      ],
    );
  }

  Widget _buildMessagesStream() {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index];
            final createdAt = msg['created_at'] != null
                ? DateTime.parse(msg['created_at'])
                : DateTime.now();
            final timeString = DateFormat('h:mm a').format(createdAt);

            return _buildChatBubble(msg, timeString);
          },
        );
      },
    );
  }

  Widget _buildChatBubble(Map<String, dynamic> msg, String timeString) {
    bool isAi = msg['sender_role'] == 'assistant';

    if (isAi) {
      // تصميم رسالة الـ AI مطابق لـ Figma
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.auto_awesome, color: primaryNavy, size: 20),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: lightAiBubble,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    msg['content'] ?? "",
                    style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.5),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    timeString,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // تصميم رسالة المستخدم
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: primaryNavy,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  msg['content'] ?? "",
                  style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  timeString,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: BoxDecoration(
        color: backgroundWhite,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // قائمة الإضافات (Popup Menu) مطابقة للتصميم
          PopupMenuButton<String>(
            icon: Icon(Icons.add_circle_outline, color: primaryNavy, size: 28),
            offset: const Offset(0, -220), // لرفع القائمة فوق مربع النص
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.white,
            elevation: 4,
            onSelected: _handleMenuSelection,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              _buildMenuItem('new_chat', Icons.auto_awesome, 'New Chat'),
              _buildMenuItem('analyze', Icons.search, 'Analyze weaknesses'),
              _buildMenuItem('score', Icons.bar_chart, 'Calculate AI score'),
              _buildMenuItem('upload', Icons.attach_file, 'Upload File'),
            ],
          ),
          const SizedBox(width: 8),
          // مربع النص
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                filled: true,
                fillColor: lightAiBubble,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // زر الإرسال
          GestureDetector(
            onTap: _handleSendMessage,
            child: CircleAvatar(
              backgroundColor: primaryNavy,
              radius: 22,
              child: const Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لبناء عناصر القائمة المنسدلة
  PopupMenuItem<String> _buildMenuItem(String value, IconData icon, String text) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: primaryNavy, size: 22),
          const SizedBox(width: 12),
          Text(text, style: TextStyle(color: primaryNavy, fontSize: 15)),
        ],
      ),
    );
  }
}