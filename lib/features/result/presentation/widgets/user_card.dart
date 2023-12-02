import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/core/widgets/app_dialog.dart';
import 'package:arman_amin/features/home/presentation/bloc/home_bloc.dart';
import 'package:arman_amin/features/result/presentation/bloc/result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arman_amin/config/extensions.dart';
import 'package:arman_amin/core/models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final int index;
  const UserCard({
    super.key,
    required this.user,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffFFFFFF),
      ),
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onLongPress: () {
          AppDialog.show(context,
              title: "Delete User",
              body: const Text(
                "Are you sure, \n you want to delete user?",
                textAlign: TextAlign.center,
              ),
              actions: [
                BlocListener<HomeBloc, HomeState>(
                  listenWhen: (previous, current) =>
                      previous.deleteUserStatus != current.deleteUserStatus,
                  listener: (context, state) {
                    if (state.deleteUserStatus is EventCompleted) {
                      BlocProvider.of<ResultBloc>(context).add(GetUsersEvent());
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(DeleteUserEvent(user: user));
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE11d48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 24),
                    ),
                    child: SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "Delete User",
                          style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                FilledButton.tonal(
                  onPressed: () {
                    context.pop();
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xffE4E2E6),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins().copyWith(
                          color: const Color(0xff161B2C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${index + 1}",
                      style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${user.firstName!} ${user.lastName!}",
                      style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  context.responsive<bool>(
                    true,
                    mobile: false,
                  )
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.phoneNumber ?? "",
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            context.responsive<bool>(
              false,
              mobile: true,
            )
                ? Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.phoneNumber ?? "",
                            style: GoogleFonts.openSans().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        user.gender == "Male" ? Icons.male : Icons.female,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      context.responsive<bool>(
                        false,
                        mobile: true,
                      )
                          ? Text(
                              user.gender!,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
