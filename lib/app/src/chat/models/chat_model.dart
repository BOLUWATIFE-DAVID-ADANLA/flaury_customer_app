import 'package:flaury_mobile/app/src/chat/models/chat_messages.dart';

class Chat {
  final String receiverName;
  final List<ChatMessages> messages;

  Chat(
    this.receiverName,
    this.messages,
  );
}
