import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/image_source.dart';

class ChatBottom extends StatefulWidget {
  const ChatBottom({super.key});

  @override
  State<ChatBottom> createState() => _ChatBottomState();
}

class _ChatBottomState extends State<ChatBottom> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  void _onTextChanged(String text) {
    if (_hasText != text.isNotEmpty) {
      setState(() {
        _hasText = text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.basicBackgroundColor,
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              height: ChatPageSizes.chatUsageIconsSize,
              width: ChatPageSizes.chatUsageIconsSize,
              ImageSource.chatAdd,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                  AppColors.appGrayColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: ChatPagePaddings.textfieldInsideHorizontal),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.appGrayColor,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: ChatPageSizes.textfieldMaximumHeight,
                      ),
                      child: TextField(
                        cursorHeight: ChatPageSizes.textfieldCursorHeight,
                        controller: _controller,
                        maxLines: null,
                        minLines: 1,
                        style: const TextStyle(color: AppColors.appWhiteColor),
                        decoration: const InputDecoration(
                          hintText: AppStrings.textfieldhintText,
                          hintStyle: TextStyle(color: AppColors.appGrayColor),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        onChanged: _onTextChanged,
                      ),
                    ),
                  ),
                  if (!_hasText)
                    Image.asset(
                      ImageSource.chatImage,
                      height: ChatPageSizes.chatUsageIconsSize,
                      fit: BoxFit.fitHeight,
                    ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: _hasText
                ? const Icon(
                    size: ChatPageSizes.chatUsageIconsSize,
                    Icons.send,
                    color: AppColors.appGrayColor,
                  )
                : SvgPicture.asset(
                    height: ChatPageSizes.chatUsageIconsSize,
                    width: ChatPageSizes.chatUsageIconsSize,
                    ImageSource.chatMicrophone,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        AppColors.appGrayColor, BlendMode.srcIn),
                  ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
