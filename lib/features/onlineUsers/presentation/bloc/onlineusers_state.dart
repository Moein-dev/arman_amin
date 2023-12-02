part of 'onlineusers_bloc.dart';

class OnlineUsersState extends Equatable {
  final EventStatus<List<OnlineUserEntity>> usersStatus;
  final int offsetUsers;
  const OnlineUsersState({
    required this.usersStatus,
    required this.offsetUsers,
  });

  @override
  List<Object> get props => [
        usersStatus,
        offsetUsers,
      ];

  OnlineUsersState copyWith({
    EventStatus<List<OnlineUserEntity>>? newUsersStatus,
    int? newOffsetUsers,
  }) {
    return OnlineUsersState(
      usersStatus: newUsersStatus ?? usersStatus,
      offsetUsers: newOffsetUsers ?? offsetUsers,
    );
  }
}
