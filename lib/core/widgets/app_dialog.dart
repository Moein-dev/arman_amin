import 'package:flutter/material.dart';

class AppDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    List<Widget>? actions,
    required String title,
    required Widget body,
  }) {
    ThemeData theme = Theme.of(context);
    return showDialog(
      context: context,
      barrierColor: theme.colorScheme.primary.withOpacity(0.2),
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          backgroundColor: theme.colorScheme.background,
          surfaceTintColor: theme.colorScheme.background,
          actions: actions,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          title: Text(title,
          style: theme.textTheme.labelLarge,),
          content: body,
        );
      },
    );
  }
}
