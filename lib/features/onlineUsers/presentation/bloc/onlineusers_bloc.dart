import 'package:arman_amin/core/network/data_state.dart';
import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/features/onlineUsers/domain/entities/online_user_entity.dart';
import 'package:arman_amin/features/onlineUsers/domain/usecases/get_online_users_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'onlineusers_event.dart';
part 'onlineusers_state.dart';

class OnlineUsersBloc extends Bloc<OnlineUsersEvent, OnlineUsersState> {
  final GetOnlineUserUsecase onlineUserUsecase;

  OnlineUsersBloc({
    required this.onlineUserUsecase,
  }) : super(
          OnlineUsersState(
            usersStatus: EventInitial(),
            offsetUsers: 0,
          ),
        ) {
    on<GetUsersEvent>(
      (event, emit) async {
        if (state.usersStatus is EventInitial) {
          emit(
            state.copyWith(
              newUsersStatus: const EventLoading(),
            ),
          );
        } else {
          emit(state.copyWith(
            newUsersStatus: EventLoadMore(data: state.usersStatus.data),
          ));
        }

        DataState<List<OnlineUserEntity>> result = await onlineUserUsecase(
          offset: event.offset,
          limit: event.limit,
        );

        if (result is DataSuccess) {
          emit(
            state.copyWith(
              newOffsetUsers: state.offsetUsers + 10,
            ),
          );
          List<OnlineUserEntity> users = [];
          if (state.usersStatus is EventLoadMore) {
            users.addAll(state.usersStatus.data!);
          }
          users.addAll(result.data!);
          return emit(
            state.copyWith(
              newUsersStatus: result.data!.isEmpty
                  ? EventNoMoreData(
                      data: users,
                    )
                  : EventCompleted(
                      users,
                    ),
            ),
          );
        } else {
          return emit(state.copyWith(
              newUsersStatus: EventError(message: result.error!)));
        }
      },
      transformer: droppable(),
    );
  }
}
