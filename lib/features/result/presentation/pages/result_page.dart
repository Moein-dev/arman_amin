import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/core/widgets/event_status_layout.dart';
import 'package:arman_amin/core/widgets/staggered_list_view.dart';
import 'package:arman_amin/features/result/presentation/bloc/result_bloc.dart';
import 'package:arman_amin/features/result/presentation/widgets/user_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var resultBloc = context.watch<ResultBloc>();
    if (resultBloc.state.getUsersStatus is EventInitial) {
      resultBloc.add(GetUsersEvent());
    }
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F8),
      body: BlocBuilder<ResultBloc, ResultState>(
        builder: (resultContext, state) {
          return EventStatusLayout<List<UserModel>>(
            status: state.getUsersStatus,
            onCompletedStatus: (context, data) {
              return data != null && data.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: StaggeredListView(
                            itemCount: data.length,
                            itemBuilder: (lsitViewContext, index) {
                              UserModel user = data[index];
                              return UserCard(
                                user: user,
                                index: index,
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Long press Items to delete user",
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        "You don't have any user",
                        style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            },
            onErrorStatus:(error) => const SizedBox(),
            onInitialStatus: const SizedBox(),
            onLoadingStatus: Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                  strokeWidth: 1.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
