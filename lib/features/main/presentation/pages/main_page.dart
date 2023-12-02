import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arman_amin/config/extensions.dart';
import 'package:arman_amin/config/images.dart';
import 'package:arman_amin/core/widgets/bottom_nav_bar.dart';
import 'package:arman_amin/core/widgets/mobile_app_bar.dart';
import 'package:arman_amin/core/widgets/side_menu.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell child;
  const MainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: context.responsive<bool>(true,
              tablet: false, tv: false, desktop: false, mobile: true)
          ? MobileAppBar(
              userProfile: AppImages.logo,
              width: width,
              height: 64,
            )
          : null,
      resizeToAvoidBottomInset: true,
      body: Row(
        children: [
          context.responsive<bool>(false, desktop: true, tv: true, tablet: true)
              ? SideMenu(
                  activeIndex: child.currentIndex,
                  onPressedItem: (index) {
                    child.goBranch(
                      index,
                      initialLocation: index == child.currentIndex,
                    );
                  },
                )
              : const SizedBox(),
          Expanded(
            child: child,
          ),
        ],
      ),
      extendBody: false,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: context.responsive<bool>(true,
              tablet: false, tv: false, desktop: false, mobile: true)
          ? AppBottomNavBar(
              onPressedItem: (index) {
                child.goBranch(
                  index,
                  initialLocation: index == child.currentIndex,
                );
              },
              activeIndex: child.currentIndex,
            )
          : null,
    );
  }
}
