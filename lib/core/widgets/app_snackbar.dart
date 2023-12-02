import 'package:arman_amin/config/enums.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    SnackbarType type = SnackbarType.message,
  }) async {
    final theme = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(milliseconds: 1500),
        elevation: 0,
        content: Container(
          decoration: BoxDecoration(
            color: type == SnackbarType.message
                ? theme.colorScheme.surface
                : type == SnackbarType.warrning
                    ? theme.colorScheme.onError
                    : theme.colorScheme.error,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                  width: 55,
                  height: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -30,
                        left: -30,
                        child: ClipRRect(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.circle,
                                color: _circlesColor(
                                  theme: theme,
                                  type: type,
                                ),
                                size: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 5,
                        child: ClipRRect(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.circle,
                                color: _circlesColor(
                                  theme: theme,
                                  type: type,
                                ),
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 25,
                        child: ClipRRect(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.circle,
                                color: _circlesColor(
                                  theme: theme,
                                  type: type,
                                ),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.circle,
                                color: _circlesColor(
                                  theme: theme,
                                  type: type,
                                ),
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.headlineSmall!.apply(
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        message,
                        style: theme.textTheme.bodyMedium!.apply(
                          color: theme.primaryColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Color _circlesColor({
    required SnackbarType type,
    required ThemeData theme,
  }) {
    switch (type) {
      case SnackbarType.error:
        return theme.primaryColor.withOpacity(0.8);
      case SnackbarType.warrning:
        return theme.primaryColor.withOpacity(0.8);
      case SnackbarType.message:
        return theme.primaryColor.withOpacity(0.8);
    }
  }
}
