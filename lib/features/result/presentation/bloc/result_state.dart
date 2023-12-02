part of 'result_bloc.dart';

class ResultState extends Equatable {
  final EventStatus<List<UserModel>> getUsersStatus;
  const ResultState({
    required this.getUsersStatus,
  });

  @override
  List<Object> get props => [
        getUsersStatus,
      ];

  ResultState copyWith({
    EventStatus<List<UserModel>>? newGetUsersStatus,
  }) {
    return ResultState(getUsersStatus: newGetUsersStatus ?? getUsersStatus);
  }
}
