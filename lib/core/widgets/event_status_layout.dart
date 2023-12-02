import 'package:arman_amin/core/network/error_handler.dart';
import 'package:arman_amin/core/services/event_status.dart';
import 'package:flutter/material.dart';

class EventStatusLayout<T> extends StatelessWidget {
  final EventStatus<T> status;
  final Widget Function(ErrorHandler error) onErrorStatus;
  final void Function(ErrorHandler error)? onErrorListener;
  final Widget Function(BuildContext context, T? data) onCompletedStatus;
  final Widget onInitialStatus;
  final Widget onLoadingStatus;
  const EventStatusLayout({
    super.key,
    required this.status,
    required this.onCompletedStatus,
    required this.onErrorStatus,
    required this.onInitialStatus,
    required this.onLoadingStatus,
    this.onErrorListener,
  });

  @override
  Widget build(BuildContext context) {
    if (status is EventError) {
      if (onErrorListener != null) {
        onErrorListener!(status.message!);
      }
    }
    if (status is EventCompleted || status is EventNoData || status is EventNoMoreData || status is EventLoadMore) {
      return StreamBuilder(
        stream: Stream.value(status),
        builder: (context, snapshot) {
          return onCompletedStatus(context, status.data);
        },
      );
    }
    if (status is EventError) {
      return onErrorStatus(status.message!);
    }
    if (status is EventInitial) {
      return onInitialStatus;
    }
    if (status is EventLoading) {
      return onLoadingStatus;
    }
    return Container();
  }
}
