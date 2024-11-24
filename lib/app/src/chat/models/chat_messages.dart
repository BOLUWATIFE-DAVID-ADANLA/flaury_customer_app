class ChatMessages {
  final String message;
  final DateTime timeStamp;
  final bool isMessageSentByUser;

  ChatMessages(
      {required this.message,
      required this.timeStamp,
      required this.isMessageSentByUser});
}
