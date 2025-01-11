import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/navigation/data/constants/navigation_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/image_source.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.basicBackgroundColor,
          border: Border.all(color: AppColors.basicBorderColor, width: 1)),
      child: Center(
        child: SvgPicture.asset(
          height: NavigationSizes.navBarIconSize,
          width: NavigationSizes.navBarIconSize,
          ImageSource.navOptions,
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(AppColors.appWhiteColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
