import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/core/widgets/error_layout.dart';
import 'package:arman_amin/core/widgets/event_status_layout.dart';
import 'package:arman_amin/features/onlineUsers/presentation/bloc/onlineusers_bloc.dart';
import 'package:arman_amin/features/onlineUsers/presentation/widgets/online_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnlineUserPage extends StatelessWidget {
  const OnlineUserPage({super.key});

  void getUsers(BuildContext context, {required int offset}) {
    BlocProvider.of<OnlineUsersBloc>(context).add(
      GetUsersEvent(
        offset: offset,
      ),
    );
  }

  static ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var onlineUserBloc = context.read<OnlineUsersBloc>();
    if (onlineUserBloc.state.usersStatus is EventInitial) {
      getUsers(
        context,
        offset: onlineUserBloc.state.offsetUsers,
      );
    }

    controller.addListener(() {
      if ((controller.offset >= (controller.position.maxScrollExtent - 40)) &&
          onlineUserBloc.state.usersStatus is! EventNoMoreData) {
        getUsers(
          context,
          offset: onlineUserBloc.state.offsetUsers,
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        body: BlocBuilder<OnlineUsersBloc, OnlineUsersState>(
          buildWhen: (previous, current) =>
              previous.usersStatus != current.usersStatus,
          builder: (context, state) {
            return EventStatusLayout(
              status: state.usersStatus,
              onCompletedStatus: (context, data) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: data!.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var user = data[index];
                          return OnlineUserCard(
                            name:
                                "${user.firstName ?? ""} ${user.lastName ?? ""}",
                            avatar: user.profilePicture,
                            phone: user.phone,
                          );
                        },
                      ),
                    ),
                    if (state.usersStatus is EventLoadMore)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 20,
                        height: 20,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    if (state.usersStatus is EventNoMoreData)
                      const Center(
                        child: Text(
                          "No more User to load",
                        ),
                      )
                  ],
                );
              },
              onErrorStatus: (error) {
                return ErrorLayout(
                  error: error,
                  onPressedTryAgain: () {
                    getUsers(
                      context,
                      offset: onlineUserBloc.state.offsetUsers,
                    );
                  },
                );
              },
              onInitialStatus: const SizedBox(),
              onLoadingStatus: const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
