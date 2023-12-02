part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class SaveUserEvent extends HomeEvent {
  SaveUserEvent();

  @override
  List<Object?> get props => [];
}

class SaveUserInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends HomeEvent {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? gender;

  UpdateUserEvent({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.gender,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phoneNumber,
        gender,
      ];
}

class DeleteUserEvent extends HomeEvent {
  final UserModel user;

  DeleteUserEvent({required this.user});

  @override
  List<Object?> get props => [
        user,
      ];
}
