class ChatPreviewData {
  final String image;
  final String lastMessageTime;
  final String lastMessage;
  final bool isRead;
  final int userId;
  ChatPreviewData({
    required this.image,
    required this.lastMessageTime,
    required this.lastMessage,
    required this.isRead,
    required this.userId,
  });
}
