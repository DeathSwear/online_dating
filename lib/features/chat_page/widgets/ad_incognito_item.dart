import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/chat_page/data/classes/ad_item_data.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/features/chat_page/widgets/ad_item_special.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class AdIncognitoItem extends StatelessWidget {
  const AdIncognitoItem(
      {super.key,
      required this.isChosen,
      required this.onPressed,
      required this.data});
  final bool isChosen;
  final Function(int) onPressed;
  final AdItemData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(data.id),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: ChatPageSizes.adItemSpecialHeight / 2),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      ChatPagePaddings.adItemHorizontalScale,
                  vertical: ChatPagePaddings.adItemVertical),
              decoration: BoxDecoration(
                  color: isChosen
                      ? AppColors.adItemSelectedBackgroundColor
                      : AppColors.adItemBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: AppColors.basicBorderColor, width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${data.count}',
                        style: AppTextStyles.adItemText,
                      ),
                      const SizedBox(
                        width: ChatPagePaddings.adItemGlassesLeft,
                      ),
                      SvgPicture.asset(
                        ImageSource.glassesYellow,
                        height: ChatPageSizes.adItemGlasses,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: ChatPagePaddings.adItemGlassesBottom,
                  ),
                  Text(
                    data.price,
                    style: AppTextStyles.adItemText,
                  ),
                ],
              ),
            ),
          ),
          if (data.specialText != null)
            Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width *
                        ChatPagePaddings.adItemHorizontalScale +
                    4,
                child: AdItemSpecial(text: data.specialText!)),
        ],
      ),
    );
  }
}
