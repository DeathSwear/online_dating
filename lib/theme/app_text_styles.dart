import 'package:flutter/material.dart';
import 'package:online_dating/theme/app_colors.dart';

class AppTextStyles {
  static const chatsTitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    color: AppColors.appWhiteColor,
  );
  static const chatsTitleSwitch = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.appWhiteColor,
  );
  static const chatsLikesCount = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.appWhiteColor,
  );
  static const chatPreviewTime = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.appWhiteColor,
  );
  static const chatPreviewLastMessage = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: AppColors.appWhiteColor,
  );
  static const temptation = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 13,
    color: AppColors.appWhiteColor,
  );
  static const haveNoMessages = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.appGrayColor,
  );
  static const adTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.appWhiteColor,
  );
  static const adTitleItalic = TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 16,
    color: AppColors.appWhiteColor,
  );
  static const adText = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: AppColors.appGrayColor,
  );
  static const adItemFireText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.blackColor,
  );
  static const adItemText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.appWhiteColor,
  );
  static const adButtonText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.appWhiteColor,
  );
  static const adBottomText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.appWhiteColor,
  );

  static TextStyle adItemSpecial = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    shadows: [
      Shadow(
        color: AppColors.adItemSpecialTextShadowColor,
        blurRadius: 5,
        offset: const Offset(1, 1),
      ),
    ],
  );
}
