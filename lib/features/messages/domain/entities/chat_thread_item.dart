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
