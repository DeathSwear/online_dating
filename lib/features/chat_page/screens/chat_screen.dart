import 'dart:math';
import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_data_example.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_other.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/features/chat_page/widgets/chat_bottom.dart';
import 'package:online_dating/features/chat_page/widgets/temptation_line.dart';
import 'package:online_dating/theme/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});
  final int userId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isZero = Random().nextBool();

  List<Widget> getMessageExample() {
    if (isZero) return [];

    List<Widget> temp = [];
    for (int i = 0; i < 30; i++) {
      bool side = Random().nextBool();
      temp.add(
        Padding(
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
        ),
      );
    }
    return temp;
  }

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  List<Widget> messages = [];
  void getMessages() {
    setState(() {
      messages = getMessageExample();
    });
  }

  bool _showHeader = true;
  bool _showBar = false;

  void swipeHeader(details) async {
    int sensitivity = 3;
    if (details.delta.dy > sensitivity) {
      if (!_showHeader) {
        setState(() {
          _showHeader = true;
          _showBar = false;
        });
      }
    } else if (details.delta.dy < -sensitivity) {
      if (_showHeader) {
        setState(() {
          _showHeader = false;
        });
        Future.delayed(ChatPageOther.headerOpenDuration, () {
          setState(() {
            _showBar = true;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.missedAD,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onVerticalDragUpdate: swipeHeader,
                child: Container(
                  color: Colors.transparent,
                  height: ChatPageSizes.appBarMaxHeight,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
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
                            backgroundImage: AssetImage(
                              ChatPageDataExample
                                  .chatPreviewData[widget.userId].image,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.more_vert,
                                color: AppColors.appWhiteColor),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: ChatPagePaddings.temptationTop,
                      ),
                      const TemptationLine(count: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        elevation: 10,
        enableDrag: false,
        onClosing: () {},
        builder: (BuildContext ctx) => AnimatedContainer(
          duration: ChatPageOther.headerOpenDuration,
          width: double.infinity,
          height: _showHeader
              ? MediaQuery.of(context).size.height -
                  ChatPageSizes.appBarMaxHeight
              : MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.basicBackgroundColor,
            border: Border.all(color: AppColors.basicBorderColor, width: 1),
            borderRadius: _showHeader
                ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )
                : null,
          ),
          child: Column(
            children: [
              if (_showBar)
                GestureDetector(
                  onVerticalDragUpdate: swipeHeader,
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: ChatPagePaddings.topSafeView),
                    color: Colors.transparent,
                    child: Row(
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
                          backgroundImage: AssetImage(
                            ChatPageDataExample
                                .chatPreviewData[widget.userId].image,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.more_vert,
                              color: AppColors.appWhiteColor),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: messages.length,
                    reverse: true,
                    itemBuilder: (context, index) => messages[index],
                  ),
                ),
              ),
              const ChatBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
