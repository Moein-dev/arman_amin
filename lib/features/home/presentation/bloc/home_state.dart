part of 'home_bloc.dart';

class HomeState extends Equatable {
  final EventStatus<bool> saveUserStatus;
  final EventStatus<bool> deleteUserStatus;
  final UserModel userStatus;
  const HomeState({
    required this.saveUserStatus,
    required this.deleteUserStatus,
    required this.userStatus,
  });

  @override
  List<Object> get props => [
        saveUserStatus,
        userStatus,
        deleteUserStatus,
      ];

  HomeState copyWith({
    EventStatus<bool>? newSaveUserStatus,
    EventStatus<bool>? newDeleteUserStatus,
    UserModel? newUserStatus,
  }) {
    return HomeState(
      saveUserStatus: newSaveUserStatus ?? saveUserStatus,
      deleteUserStatus: newDeleteUserStatus ?? deleteUserStatus,
      userStatus: newUserStatus ?? userStatus,
    );
  }
}
