import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/classes/chat_preview_data.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_text_styles.dart';

class ChatPreview extends StatefulWidget {
  const ChatPreview({super.key, required this.data, required this.onPressed});
  final ChatPreviewData data;
  final VoidCallback onPressed;

  @override
  State<ChatPreview> createState() => _ChatPreviewState();
}

class _ChatPreviewState extends State<ChatPreview> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {});
          widget.onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ChatPagePaddings.basicHorizontal,
            vertical: ChatPagePaddings.chatPreviewVertical,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  widget.data.image,
                  height: ChatPageSizes.chatPreviewIconSize,
                  width: ChatPageSizes.chatPreviewIconSize,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: ChatPagePaddings.chatPreviewIconRight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.lastMessageTime,
                    style: AppTextStyles.chatPreviewTime,
                  ),
                  Text(
                    widget.data.lastMessage,
                    style: AppTextStyles.chatPreviewLastMessage,
                  ),
                ],
              ),
              const Spacer(),
              if (!widget.data.isRead)
                Container(
                  height: ChatPageSizes.unReadDotSize,
                  width: ChatPageSizes.unReadDotSize,
                  decoration: BoxDecoration(
                      color: AppColors.appWhiteColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
