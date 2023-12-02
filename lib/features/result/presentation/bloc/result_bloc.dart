import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/features/result/domain/usecases/get_users_usecase.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final GetUsersUsecase usersUsecase;

  ResultBloc({
    required this.usersUsecase,
  }) : super(ResultState(getUsersStatus: EventInitial())) {
    on<GetUsersEvent>((event, emit) async {
      emit(state.copyWith(
        newGetUsersStatus: const EventLoading(),
      ));

      var result = await usersUsecase();

      return emit(
        state.copyWith(
          newGetUsersStatus: EventCompleted(result),
        ),
      );
    });

    on<GetUserEventInitial>((event, emit) =>
        emit(state.copyWith(newGetUsersStatus: EventInitial())));
  }
}
