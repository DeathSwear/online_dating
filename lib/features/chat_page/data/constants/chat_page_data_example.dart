import 'package:online_dating/features/chat_page/data/classes/ad_item_data.dart';
import 'package:online_dating/features/chat_page/data/classes/chat_preview_data.dart';
import 'package:online_dating/theme/image_source.dart';

class ChatPageDataExample {
  static List<ChatPreviewData> chatPreviewData = [
    ChatPreviewData(
      image: ImageSource.exampleAvatar1,
      lastMessageTime: '23 ч 43 мин',
      lastMessage: 'Отлично выглядишь',
      isRead: true,
      userId: 0,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar2,
      lastMessageTime: '20 ч 40 мин',
      lastMessage: 'Встретимся? Я рядом',
      isRead: false,
      userId: 1,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar3,
      lastMessageTime: '18 ч 40 мин',
      lastMessage: 'Встретимся?',
      isRead: true,
      userId: 2,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar4,
      lastMessageTime: '09 ч 40 мин',
      lastMessage: 'Давно тебя хочу',
      isRead: true,
      userId: 3,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar5,
      lastMessageTime: '03 ч 04 мин',
      lastMessage: 'Я в ванной.. Скинь фото...',
      isRead: true,
      userId: 4,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar6,
      lastMessageTime: '01 ч 09 мин',
      lastMessage: 'Привет',
      isRead: true,
      userId: 5,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar1,
      lastMessageTime: '23 ч 43 мин',
      lastMessage: 'Отлично выглядишь',
      isRead: false,
      userId: 6,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar2,
      lastMessageTime: '20 ч 40 мин',
      lastMessage: 'Встретимся? Я рядом',
      isRead: false,
      userId: 7,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar3,
      lastMessageTime: '18 ч 40 мин',
      lastMessage: 'Встретимся?',
      isRead: false,
      userId: 8,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar4,
      lastMessageTime: '09 ч 40 мин',
      lastMessage: 'Давно тебя хочу',
      isRead: false,
      userId: 9,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar5,
      lastMessageTime: '03 ч 04 мин',
      lastMessage: 'Я в ванной.. Скинь фото...',
      isRead: false,
      userId: 10,
    ),
    ChatPreviewData(
      image: ImageSource.exampleAvatar6,
      lastMessageTime: '01 ч 09 мин',
      lastMessage: 'Привет',
      isRead: false,
      userId: 11,
    ),
  ];

  static List<AdItemData> adItemData = [
    AdItemData(count: 1, price: '99 P', id: 1),
    AdItemData(count: 3, price: '199 P', specialText: 'Хит', id: 2),
    AdItemData(count: 7, price: '399 P', specialText: '-42%', id: 3),
  ];
}
