import 'dart:math';
import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_data_example.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/features/chat_page/widgets/chat_bottom.dart';
import 'package:online_dating/features/chat_page/widgets/temptation_line.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/app_text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});
  final int userId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isZero = Random().nextBool();

  List<Widget> getMessageExample() {
    if (isZero) {
      return [];
    }
    List<Widget> temp = [];
    for (int i = 0; i < 30; i++) {
      bool side = Random().nextBool();
      temp.add(
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: side ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              color: side
                  ? Colors.red.withOpacity(0.4)
                  : Colors.blue.withOpacity(0.4),
              width: Random().nextDouble() * 120 + 120,
              height: 60,
            ),
          ),
        )),
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              color: AppColors.basicBackgroundColor,
              border: Border.all(color: AppColors.basicBorderColor, width: 1)),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.basicBackgroundColor,
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                toolbarHeight: ChatPageSizes.appbarColapsedHeight,
                titleSpacing: 0,
                collapsedHeight: ChatPageSizes.appbarColapsedHeight,
                expandedHeight: ChatPageSizes.appBarMaxHeight -
                    ChatPageSizes.appBarMinHeight +
                    ChatPageSizes.littleAppbarBottomHeight,
                title: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left,
                          color: AppColors.appWhiteColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CircleAvatar(
                      radius: ChatPageSizes.chatUserImageRadius,
                      backgroundImage: AssetImage(ChatPageDataExample
                          .chatPreviewData[widget.userId].image),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.more_vert,
                          color: AppColors.appWhiteColor),
                      onPressed: () {},
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    color: AppColors.missedAD,
                    child: const Stack(
                      children: [
                        Center(
                          child: Text(AppStrings.placeForAD),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: ChatPagePaddings.temptationLineBottom),
                            child: TemptationLine(count: 2),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size(
                      double.infinity, ChatPageSizes.littleAppbarBottomHeight),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.basicBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    height: ChatPageSizes.littleAppbarBottomHeight,
                  ),
                ),
              ),
              ...getMessageExample(),
              if (isZero)
                const SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: ChatPagePaddings.haveNoMessagesTop),
                      child: Text(
                        AppStrings.startMessaging,
                        style: AppTextStyles.haveNoMessages,
                      ),
                    ),
                  ),
                )
            ],
          )),
      bottomSheet: const ChatBottom(),
    );
  }
}
