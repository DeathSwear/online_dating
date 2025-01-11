import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(
          vertical: ChatPagePaddings.textfieldVertical),
      color: AppColors.basicBackgroundColor,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              size: ChatPageSizes.chatUsageIconsSize,
              Icons.add,
              color: AppColors.appGrayColor,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: ChatPagePaddings.textfieldInsideHorizontal),
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
                      constraints: BoxConstraints(
                        minHeight: ChatPageSizes.textfieldStandartHeight,
                        maxHeight: !_hasText
                            ? ChatPageSizes.textfieldStandartHeight
                            : ChatPageSizes.textfieldMaximumHeight,
                      ),
                      child: TextField(
                        cursorHeight: ChatPageSizes.textfieldCursorHeight,
                        controller: _controller,
                        maxLines: null,
                        style: const TextStyle(color: AppColors.appWhiteColor),
                        decoration: const InputDecoration(
                          hintText: AppStrings.textfieldhintText,
                          hintStyle: TextStyle(color: AppColors.appGrayColor),
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
            icon: Icon(
              size: ChatPageSizes.chatUsageIconsSize,
              _hasText ? Icons.send : Icons.mic_none_sharp,
              color: AppColors.appGrayColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
