import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_data_example.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/features/chat_page/screens/chat_screen.dart';
import 'package:online_dating/features/chat_page/widgets/chat_preview.dart';
import 'package:online_dating/features/chat_page/widgets/likes_preview.dart';
import 'package:online_dating/features/chat_page/widgets/switcher.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/app_text_styles.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Widget> getChatPreviews() {
    return ChatPageDataExample.chatPreviewData
        .map((el) => SliverToBoxAdapter(
                child: ChatPreview(
              data: el,
              onPressed: () {
                Navigator.of(context).push(_createRoute(el.userId));
              },
            )))
        .toList();
  }

  Route _createRoute(int userId) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(
              userId: userId,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.basicBackgroundColor,
            border: Border.all(color: AppColors.basicBorderColor, width: 1)),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.basicBackgroundColor,
              pinned: true,
              floating: false,
              toolbarHeight: 0,
              expandedHeight: ChatPageSizes.appBarMaxHeight,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  color: AppColors.missedAD,
                  child: const Center(
                    child: Text(AppStrings.placeForAD),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize:
                    const Size(double.infinity, ChatPageSizes.appBarMinHeight),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.basicBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  height: ChatPageSizes.appBarMinHeight,
                  child: const Padding(
                    padding:
                        EdgeInsets.only(left: ChatPagePaddings.basicHorizontal),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.chats,
                          style: AppTextStyles.chatsTitle,
                        ),
                        Switcher(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:
                  LikesPreview(likesCount: 44, isRead: false, onPressed: () {}),
            ),
            ...getChatPreviews(),
          ],
        ));
  }
}
