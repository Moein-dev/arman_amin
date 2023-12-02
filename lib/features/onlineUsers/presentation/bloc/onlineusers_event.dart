part of 'onlineusers_bloc.dart';

abstract class OnlineUsersEvent extends Equatable {}

class GetUsersEvent extends OnlineUsersEvent {
  final int offset;
  final int limit;

  GetUsersEvent({
    required this.offset,
    this.limit = 10,
  });

  @override
  List<Object?> get props => [
        offset,
        limit,
      ];
}

