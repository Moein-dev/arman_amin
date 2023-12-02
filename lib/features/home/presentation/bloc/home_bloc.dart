import 'package:arman_amin/features/home/domain/usecases/delete_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/core/network/error_handler.dart';
import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/features/home/domain/usecases/save_user_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SaveUserUsecase saveUserUsecase;
  final DeleteUserUsecase deleteUserUsecase;

  HomeBloc({
    required this.saveUserUsecase,
    required this.deleteUserUsecase,
  }) : super(
          HomeState(
            saveUserStatus: EventInitial(),
            deleteUserStatus: EventInitial(),
            userStatus: UserModel(gender: "Male"),
          ),
        ) {
    on<SaveUserEvent>((event, emit) async {
      emit(state.copyWith(
        newSaveUserStatus: const EventLoading(),
      ));

      var result = await saveUserUsecase(
        user: state.userStatus,
      );
      if (result) {
        emit(
          state.copyWith(
            newUserStatus: UserModel(
              gender: "Male",
            ),
          ),
        );
      }
      return result
          ? emit(state.copyWith(newSaveUserStatus: EventCompleted(result)))
          : emit(state.copyWith(
              newSaveUserStatus: EventError(
                message: ErrorHandler(
                    message: "somethings went wrong...", status: "Failed"),
              ),
            ));
    });

    on<SaveUserInitialEvent>((event, emit) {
      emit(state.copyWith(newSaveUserStatus: EventInitial()));
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(
        state.copyWith(
          newUserStatus: state.userStatus.copyWith(
            newFirstName: event.firstName,
            newLastName: event.lastName,
            newGender: event.gender,
            newPhoneNumber: event.phoneNumber,
          ),
        ),
      );
    });

    on<DeleteUserEvent>((event, emit) async {
            emit(state.copyWith(
        newDeleteUserStatus: const EventLoading(),
      ));

      var result = await deleteUserUsecase(
        user: event.user,
      );
      return result
          ? emit(state.copyWith(newDeleteUserStatus: EventCompleted(result)))
          : emit(state.copyWith(
              newDeleteUserStatus: EventError(
                message: ErrorHandler(
                    message: "somethings went wrong...", status: "Failed"),
              ),
            ));
    });
  }
}
