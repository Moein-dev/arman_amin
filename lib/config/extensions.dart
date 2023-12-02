import 'package:arman_amin/config/enums.dart';
import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? mobile,
    T? tablet,
    T? desktop,
    T? tv,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (tv ?? desktop ?? tablet ?? mobile ?? defaultVal)
        : wd >= 1024
            ? (desktop ?? tablet ?? mobile ?? defaultVal)
            : wd >= 768
                ? (tablet ?? mobile ?? defaultVal)
                : wd >= 640
                    ? (mobile ?? defaultVal)
                    : defaultVal;
  }
}

extension ContextExtension on BuildContext {
  ScreenType _getScreenType(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide > 600) {
      return ScreenType.tablet;
    } else if (shortestSide > 400) {
      return ScreenType.mobile;
    } else if (shortestSide > 300) {
      return ScreenType.tv;
    } else {
      return ScreenType.desktop;
    }
  }

  T screenType<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    required T tv,
  }) {
    var type = _getScreenType(this);
    switch (type) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet;
      case ScreenType.desktop:
        return desktop;
      case ScreenType.tv:
        return tv;
    }
  }

  bool get isMobile {
    return _getScreenType(this) == ScreenType.mobile;
  }

  bool get isTablet {
    return _getScreenType(this) == ScreenType.tablet;
  }
  bool get isDesktop {
    return _getScreenType(this) == ScreenType.desktop;
  }
}

extension ValidationExtensions on String {
  String? get validateMobile {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(this)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
