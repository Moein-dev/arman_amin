import 'package:arman_amin/core/network/error_handler.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EventStatus<T> {
  final int? itemId;
  final T? data;
  final ErrorHandler? message;

  const EventStatus({
    this.itemId,
    this.data,
    this.message,
  });
}

class EventLoading<T> extends EventStatus<T> {
  const EventLoading({int? itemId}) : super(itemId: itemId);
}

class EventLoadMore<T> extends EventStatus<T> {
  const EventLoadMore({T? data}) : super(data: data);
}

class EventNoMoreData<T> extends EventStatus<T> {
  const EventNoMoreData({T? data}) : super(data: data);
}

class EventCompleted<T> extends EventStatus<T> {
  const EventCompleted(T data) : super(data: data);
}

class EventNoData<T> extends EventCompleted<T> {
  const EventNoData(super.data);
}

class EventInitial<T> extends EventStatus<T> {}

class EventError<T> extends EventStatus<T> {
  const EventError({required ErrorHandler message})
      : super(
          message: message,
        );
}
