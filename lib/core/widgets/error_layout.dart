import 'package:arman_amin/core/network/error_handler.dart';
import 'package:flutter/material.dart';

class ErrorLayout extends StatelessWidget {
  final VoidCallback? onPressedTryAgain;
  final ErrorHandler? error;
  const ErrorLayout({super.key,
   this.error,
   this.onPressedTryAgain,});

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      error?.message ?? "",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: onPressedTryAgain,
                      child: const Text(
                        "Try again",
                      ),
                    )
                  ],
                ),
              );
  }
}
