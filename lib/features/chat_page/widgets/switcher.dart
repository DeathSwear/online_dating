import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_other.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOn = !isOn;
            });
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ChatPagePaddings.basicHorizontal),
            child: Row(
              children: [
                Text(
                  'OFF',
                  style: AppTextStyles.chatsTitleSwitch,
                ),
                SizedBox(
                  width: ChatPagePaddings.switcherInside,
                ),
                Text(
                  'ON',
                  style: AppTextStyles.chatsTitleSwitch,
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: isOn
              ? ChatPageOther.switcherStartPos
              : ChatPageOther.switcherEndPos,
          child: SvgPicture.asset(
            ImageSource.chatSwitch,
            height: 20,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
