import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_dating/features/chat_page/screens/chats_screen.dart';
import 'package:online_dating/features/find_page/screens/find_screen.dart';
import 'package:online_dating/features/liked_page/screens/liked_screen.dart';
import 'package:online_dating/features/navigation/data/constants/navigation_sizes.dart';
import 'package:online_dating/features/options_page/screens/options_screen.dart';
import 'package:online_dating/theme/app_colors.dart';
import 'package:online_dating/theme/image_source.dart';

class ScaffoldNavBar extends StatefulWidget {
  const ScaffoldNavBar({super.key});

  @override
  State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
}

class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
  int _activePage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void changePage(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  Color getColor(int index) {
    return index == _activePage
        ? AppColors.navActiveIconColor
        : AppColors.navIconColor;
  }

  final List<Widget> _pages = const [
    FindScreen(),
    ChatsScreen(),
    LikedScreen(),
    OptionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _activePage = value;
            });
          },
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return _pages[index];
          }),
      bottomNavigationBar: Container(
        height: NavigationSizes.navBarHeight,
        decoration: const BoxDecoration(
            color: AppColors.navBackgroundColor,
            border: Border(
              top: BorderSide(
                  color: AppColors.basicBorderColor,
                  width: NavigationSizes.borderTopWidth),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => changePage(0),
              child: SvgPicture.asset(
                height: NavigationSizes.navBarIconSize,
                width: NavigationSizes.navBarIconSize,
                ImageSource.navFind,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(getColor(0), BlendMode.srcIn),
              ),
            ),
            GestureDetector(
              onTap: () => changePage(1),
              child: SvgPicture.asset(
                height: NavigationSizes.navBarIconSize,
                width: NavigationSizes.navBarIconSize,
                ImageSource.navMessages,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(getColor(1), BlendMode.srcIn),
              ),
            ),
            GestureDetector(
              onTap: () => changePage(2),
              child: SvgPicture.asset(
                height: NavigationSizes.navBarIconSize,
                width: NavigationSizes.navBarIconSize,
                ImageSource.navLikes,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(getColor(2), BlendMode.srcIn),
              ),
            ),
            GestureDetector(
              onTap: () => changePage(3),
              child: SvgPicture.asset(
                height: NavigationSizes.navBarIconSize,
                width: NavigationSizes.navBarIconSize,
                ImageSource.navOptions,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(getColor(3), BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
