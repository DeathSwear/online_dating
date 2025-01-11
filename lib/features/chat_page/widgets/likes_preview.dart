import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class LikesPreview extends StatefulWidget {
  const LikesPreview(
      {super.key,
      required this.likesCount,
      required this.isRead,
      required this.onPressed});
  final int likesCount;
  final bool isRead;
  final VoidCallback onPressed;

  @override
  State<LikesPreview> createState() => _LikesPreviewState();
}

class _LikesPreviewState extends State<LikesPreview> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.basicBackgroundColor,
      ),
      child: Material(
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
                    ImageSource.likesPreviewIcon,
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
                      '${widget.likesCount} ${AppStrings.peoplseLikedYou}',
                      style: AppTextStyles.chatsLikesCount,
                    ),
                  ],
                ),
                const Spacer(),
                if (!widget.isRead)
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
      ),
    );
  }
}
