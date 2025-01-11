import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_data_example.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/features/chat_page/widgets/ad_button.dart';
import 'package:online_dating/features/chat_page/widgets/ad_incognito_item.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_strings.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class IncognitoBottomsheet extends StatefulWidget {
  const IncognitoBottomsheet({super.key});

  @override
  State<IncognitoBottomsheet> createState() => _IncognitoBottomsheetState();
}

class _IncognitoBottomsheetState extends State<IncognitoBottomsheet> {
  int chosenVariant = -1;

  void onItemTap(int id) {
    if (chosenVariant == id) {
      setState(() {
        chosenVariant = -1;
      });
      return;
    }
    setState(() {
      chosenVariant = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ChatPageSizes.adBottomsheetHeight,
        decoration: const BoxDecoration(
          color: AppColors.adBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: ChatPagePaddings.basicHorizontal,
              right: ChatPagePaddings.basicHorizontal,
              top: 21),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: ChatPageSizes.adCloseIconSize,
                    width: ChatPageSizes.adCloseIconSize,
                  ),
                  SvgPicture.asset(
                    ImageSource.glassesPink,
                    height: ChatPageSizes.adGlassesPinkHeight,
                    fit: BoxFit.cover,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: ChatPageSizes.adCloseIconSize,
                      color: AppColors.appGrayColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: ChatPagePaddings.adGlassesPinkBottom,
              ),
              RichText(
                  text: const TextSpan(
                text: AppStrings.adTiTleSpan1,
                style: AppTextStyles.adTitle,
                children: [
                  TextSpan(
                    text: AppStrings.adTiTleSpan2,
                    style: AppTextStyles.adTitleItalic,
                  ),
                  TextSpan(
                    text: AppStrings.adTiTleSpan3,
                    style: AppTextStyles.adTitle,
                  ),
                ],
              )),
              const Spacer(),
              const Text(
                AppStrings.adText,
                softWrap: true,
                style: AppTextStyles.adText,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdIncognitoItem(
                    data: ChatPageDataExample.adItemData[0],
                    isChosen:
                        chosenVariant == ChatPageDataExample.adItemData[0].id
                            ? true
                            : false,
                    onPressed: onItemTap,
                  ),
                  AdIncognitoItem(
                    data: ChatPageDataExample.adItemData[0],
                    isChosen:
                        chosenVariant == ChatPageDataExample.adItemData[0].id
                            ? true
                            : false,
                    onPressed: onItemTap,
                  ),
                  AdIncognitoItem(
                    data: ChatPageDataExample.adItemData[0],
                    isChosen:
                        chosenVariant == ChatPageDataExample.adItemData[0].id
                            ? true
                            : false,
                    onPressed: onItemTap,
                  ),
                ],
              ),
              const SizedBox(
                height: ChatPagePaddings.adItemsBottom,
              ),
              AdButton(
                  text: AppStrings.adButtonText,
                  onPressed: () {},
                  isActive: chosenVariant != -1 ? true : false),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.adBottomText,
                    style: AppTextStyles.adBottomText,
                  ))
            ],
          ),
        ));
  }
}
