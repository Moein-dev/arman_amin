import 'package:flutter/material.dart';

class AppGlobal {
  static String themeMode = "light";
  static final GlobalKey<NavigatorState> bottomNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'navigation key');
  static final GlobalKey<NavigatorState> mainKey =
      GlobalKey<NavigatorState>(debugLabel: 'main key');
}
