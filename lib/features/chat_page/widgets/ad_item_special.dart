import 'package:flutter/material.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_text_styles.dart';

class AdItemSpecial extends StatelessWidget {
  const AdItemSpecial({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ChatPageSizes.adItemSpecialWidth,
        height: ChatPageSizes.adItemSpecialHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: AppColors.adItemSpecialGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.adItemSpecialShadowColor1,
              blurRadius: 6,
              spreadRadius: 5,
            ),
            BoxShadow(
              color: AppColors.adItemSpecialShadowColor2,
              blurRadius: 3,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.adItemSpecial,
          ),
        ),
      ),
    );
  }
}
