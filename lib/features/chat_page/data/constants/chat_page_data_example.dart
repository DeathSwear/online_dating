import 'package:online_dating/features/chat_page/data/classes/chat_preview_data.dart';
import 'package:online_dating/theme/image_source.dart';

class ChatPageDataExample {
  static List<ChatPreviewData> chatPreviewData = [
    ChatPreviewData(
        image: ImageSource.exampleAvatar1,
        lastMessageTime: '23 ч 43 мин',
        lastMessage: 'Отлично выглядишь',
        isRead: true),
    ChatPreviewData(
        image: ImageSource.exampleAvatar2,
        lastMessageTime: '20 ч 40 мин',
        lastMessage: 'Встретимся? Я рядом',
        isRead: false),
    ChatPreviewData(
        image: ImageSource.exampleAvatar3,
        lastMessageTime: '18 ч 40 мин',
        lastMessage: 'Встретимся?',
        isRead: true),
    ChatPreviewData(
        image: ImageSource.exampleAvatar4,
        lastMessageTime: '09 ч 40 мин',
        lastMessage: 'Давно тебя хочу',
        isRead: true),
    ChatPreviewData(
        image: ImageSource.exampleAvatar5,
        lastMessageTime: '03 ч 04 мин',
        lastMessage: 'Я в ванной.. Скинь фото...',
        isRead: true),
    ChatPreviewData(
        image: ImageSource.exampleAvatar6,
        lastMessageTime: '01 ч 09 мин',
        lastMessage: 'Привет',
        isRead: true),
    ChatPreviewData(
        image: ImageSource.exampleAvatar1,
        lastMessageTime: '23 ч 43 мин',
        lastMessage: 'Отлично выглядишь',
        isRead: false),
    ChatPreviewData(
        image: ImageSource.exampleAvatar2,
        lastMessageTime: '20 ч 40 мин',
        lastMessage: 'Встретимся? Я рядом',
        isRead: false),
    ChatPreviewData(
        image: ImageSource.exampleAvatar3,
        lastMessageTime: '18 ч 40 мин',
        lastMessage: 'Встретимся?',
        isRead: false),
    ChatPreviewData(
        image: ImageSource.exampleAvatar4,
        lastMessageTime: '09 ч 40 мин',
        lastMessage: 'Давно тебя хочу',
        isRead: false),
    ChatPreviewData(
        image: ImageSource.exampleAvatar5,
        lastMessageTime: '03 ч 04 мин',
        lastMessage: 'Я в ванной.. Скинь фото...',
        isRead: false),
    ChatPreviewData(
        image: ImageSource.exampleAvatar6,
        lastMessageTime: '01 ч 09 мин',
        lastMessage: 'Привет',
        isRead: false),
  ];
}
