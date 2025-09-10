import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_other.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class TemptationLine extends StatefulWidget {
  const TemptationLine({super.key, required this.count});
  final int count;
  @override
  State<TemptationLine> createState() => _TemptationLineState();
}

class _TemptationLineState extends State<TemptationLine> {
  double _opacity = 1.0;
  bool _isVisible = true;

  void _hideTemptationLine() {
    setState(() {
      _opacity = 0.0;
    });

    Future.delayed(ChatPageOther.temptationDuration, () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return AnimatedOpacity(
      curve: Curves.easeIn,
      duration: ChatPageOther.temptationDuration,
      opacity: _opacity,
      child: Container(
        color: AppColors.temptationBackgroundColor,
        height: ChatPageSizes.temptationsLineHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ChatPagePaddings.basicHorizontal),
          child: Row(
            children: [
              Image.asset(
                ImageSource.rocketIcon,
                height: ChatPageSizes.temptationsLineHeight,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: ChatPagePaddings.temptationLineRocketRight,
              ),
              Text(
                '${widget.count} ${AppStrings.totalTemptations}',
                style: AppTextStyles.temptation,
              ),
              const Spacer(),
              GestureDetector(
                onTap: _hideTemptationLine,
                child: const Icon(
                  Icons.close,
                  size: ChatPageSizes.temptationsLineCloseSize,
                  color: AppColors.appWhiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
