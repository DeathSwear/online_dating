import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_paddings.dart';
import 'package:online_dating/features/chat_page/data/constants/chat_page_sizes.dart';
import 'package:online_dating/features/chat_page/widgets/ad_button.dart';
import 'package:online_dating/features/chat_page/widgets/ad_incognito_item.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/app_text_styles.dart';
import 'package:online_dating/theme/image_source.dart';

class IncognitoBottomsheet extends StatefulWidget {
  const IncognitoBottomsheet({super.key});

  @override
  State<IncognitoBottomsheet> createState() => _IncognitoBottomsheetState();
}

class _IncognitoBottomsheetState extends State<IncognitoBottomsheet> {
  int chosenVariant = 0;

  void onItemTap(int id) {
    if (chosenVariant == id) {
      setState(() {
        chosenVariant = 0;
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
                text: 'РЕЖИМ ',
                style: AppTextStyles.adTitle,
                children: [
                  TextSpan(
                    text: 'ИНКОГНИТО',
                    style: AppTextStyles.adTitleItalic,
                  ),
                  TextSpan(
                    text: ' НА 24 ЧАСА',
                    style: AppTextStyles.adTitle,
                  ),
                ],
              )),
              const Spacer(),
              const Text(
                'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся <Space> незамеченным',
                softWrap: true,
                style: AppTextStyles.adText,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdIncognitoItem(
                    count: 1,
                    price: '99 P',
                    id: 1,
                    isChosen: chosenVariant == 1 ? true : false,
                    onPressed: onItemTap,
                  ),
                  AdIncognitoItem(
                      count: 3,
                      price: '199 P',
                      id: 2,
                      isChosen: chosenVariant == 2 ? true : false,
                      onPressed: onItemTap,
                      specialText: 'Хит'),
                  AdIncognitoItem(
                      count: 7,
                      price: '399 P',
                      id: 3,
                      isChosen: chosenVariant == 3 ? true : false,
                      onPressed: onItemTap,
                      specialText: '-42%'),
                ],
              ),
              const SizedBox(
                height: ChatPagePaddings.adItemsBottom,
              ),
              AdButton(
                  text: 'Купить',
                  onPressed: () {},
                  isActive: chosenVariant != 0 ? true : false),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'УСЛОВИЯ И ПОЛОЖЕНИЯ',
                    style: AppTextStyles.adBottomText,
                  ))
            ],
          ),
        ));
  }
}
