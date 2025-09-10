import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_other.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class Switcher extends StatefulWidget {
  const Switcher(
      {super.key, required this.lastestCount, required this.onIncognitoEnds});
  final int lastestCount;
  final VoidCallback onIncognitoEnds;
  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool isOn = false;
  int lastestCount = 0;
  void tapSwitcher() async {
    if ((lastestCount < 1) && (!isOn)) {
      widget.onIncognitoEnds();
      return;
    }
    if (isOn) {
      setState(() {
        isOn = !isOn;
        lastestCount--;
      });
    } else {
      setState(() {
        isOn = !isOn;
      });
    }
  }

  @override
  void initState() {
    lastestCount = widget.lastestCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: tapSwitcher,
          child: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ChatPagePaddings.basicHorizontal),
            child: Row(
              children: [
                Text(
                  AppStrings.switcherOFF,
                  style: AppTextStyles.chatsTitleSwitch,
                ),
                SizedBox(
                  width: ChatPagePaddings.switcherInside,
                ),
                Text(
                  AppStrings.switcherON,
                  style: AppTextStyles.chatsTitleSwitch,
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: ChatPageOther.switcherDuration,
          curve: Curves.easeInOut,
          left: isOn
              ? ChatPageOther.switcherStartPos
              : ChatPageOther.switcherEndPos,
          child: SvgPicture.asset(
            lastestCount > 0
                ? ImageSource.chatSwitch
                : ImageSource.chatSwitchNo,
            height: ChatPageSizes.switcherImageHeight,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
