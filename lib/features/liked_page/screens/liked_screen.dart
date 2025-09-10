import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/navigation/data/constants/navigation_sizes.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/image_source.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
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
          ImageSource.navLikes,
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(AppColors.appWhiteColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
