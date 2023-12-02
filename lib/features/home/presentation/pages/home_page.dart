import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arman_amin/config/enums.dart';
import 'package:arman_amin/config/extensions.dart';
import 'package:arman_amin/core/services/event_status.dart';
import 'package:arman_amin/core/widgets/app_snackbar.dart';
import 'package:arman_amin/core/widgets/app_text_field.dart';
import 'package:arman_amin/features/home/presentation/bloc/home_bloc.dart';
import 'package:arman_amin/features/home/presentation/widgets/label_form.dart';
import 'package:arman_amin/features/result/presentation/bloc/result_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var homeBloc = context.watch<HomeBloc>();
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (homeContext, state) {
              if (state.saveUserStatus is EventCompleted) {
                homeBloc.add(SaveUserInitialEvent());
                AppSnackBar.show(
                  context,
                  title: "Success",
                  message: "User added successfull",
                );
                BlocProvider.of<ResultBloc>(context).add(GetUserEventInitial());
              } else if (state.saveUserStatus is EventError) {
                homeBloc.add(SaveUserInitialEvent());
                AppSnackBar.show(
                  context,
                  title: state.saveUserStatus.message!.status,
                  message: state.saveUserStatus.message!.message,
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(
                      context.responsive<double>(40, mobile: 20)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffDFDFDF),
                          offset: Offset(0, 2),
                          blurRadius: 20)
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.only(
                      top: 28, left: 24, right: 24, bottom: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "New Contact",
                              style: GoogleFonts.poppins().copyWith(
                                  color: const Color(0xff1b1b1f),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Divider(
                          color: const Color(0xffC6C6D0).withOpacity(0.4),
                          height: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        context.responsive<Widget>(
                          Column(
                            children: [
                              const LabelForm(
                                label: "Full Name",
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppTextField(
                                          controller: firstNameController,
                                          hintText: "First name",
                                          keyboardType: TextInputType.name,
                                          validator: (value) {
                                            if (value != null &&
                                                value.length < 3) {
                                              return "Input currect Name";
                                            }
                                            return null;
                                          },
                                          onChanged: (text) {
                                            homeBloc.add(
                                              UpdateUserEvent(
                                                firstName: text,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppTextField(
                                          controller: lastNameController,
                                          hintText: "Last name",
                                          keyboardType: TextInputType.name,
                                          validator: (value) {
                                            if (value != null &&
                                                value.length < 3) {
                                              return "Input currect Last name";
                                            }
                                            return null;
                                          },
                                          onChanged: (text) {
                                            homeBloc.add(
                                              UpdateUserEvent(
                                                lastName: text,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          mobile: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: LabelForm(
                                  label: "Full Name",
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AppTextField(
                                        controller: firstNameController,
                                        hintText: "First name",
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value != null &&
                                              value.length < 3) {
                                            return "Input currect Name";
                                          }
                                          return null;
                                        },
                                        onChanged: (text) {
                                          homeBloc.add(
                                            UpdateUserEvent(
                                              firstName: text,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: AppTextField(
                                        controller: lastNameController,
                                        hintText: "Last name",
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value != null &&
                                              value.length < 3) {
                                            return "Input currect Last name";
                                          }
                                          return null;
                                        },
                                        onChanged: (text) {
                                          homeBloc.add(
                                            UpdateUserEvent(
                                              lastName: text,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        context.responsive<Widget>(
                          Column(
                            children: [
                              const LabelForm(
                                label: "Contact Phone",
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppTextField(
                                      controller: phoneController,
                                      hintText: "Phone number",
                                      keyboardType: TextInputType.phone,
                                      validator: (value) =>
                                          value!.validateMobile,
                                      onChanged: (text) {
                                        homeBloc.add(
                                          UpdateUserEvent(
                                            phoneNumber: text,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          mobile: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: LabelForm(
                                  label: "Contact Phone",
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: AppTextField(
                                  controller: phoneController,
                                  hintText: "Phone number",
                                  keyboardType: TextInputType.phone,
                                  validator: (value) => value!.validateMobile,
                                  onChanged: (text) {
                                    homeBloc.add(
                                      UpdateUserEvent(
                                        phoneNumber: text,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        context.responsive<Widget>(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const LabelForm(
                                label: "Gender",
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: SegmentedButton(
                                            segments: [
                                              ButtonSegment(
                                                value: GenderType.male,
                                                icon: const Icon(
                                                  Icons.male,
                                                ),
                                                tooltip: "Male",
                                                label: Text(
                                                  "Male",
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                              ButtonSegment(
                                                value: GenderType.female,
                                                icon: const Icon(
                                                  Icons.female,
                                                ),
                                                tooltip: "Female",
                                                label: Text(
                                                  "Female",
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              )
                                            ],
                                            selected: <GenderType>{
                                              homeBloc.state.userStatus
                                                          .gender ==
                                                      "Male"
                                                  ? GenderType.male
                                                  : GenderType.female,
                                            },
                                            onSelectionChanged: (value) {
                                              homeBloc.add(
                                                UpdateUserEvent(
                                                  gender: value.first ==
                                                          GenderType.male
                                                      ? "Male"
                                                      : "Female",
                                                ),
                                              );
                                            },
                                            selectedIcon: const Icon(
                                              Icons.check,
                                              color: Color(0xff161b2C),
                                            ),
                                            style: ButtonStyle(
                                              side: MaterialStatePropertyAll(
                                                BorderSide(
                                                  width: 1,
                                                  color: theme
                                                      .colorScheme.primary
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          mobile: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: LabelForm(
                                  label: "Gender",
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: SegmentedButton(
                                        segments: [
                                          ButtonSegment(
                                            value: GenderType.male,
                                            icon: const Icon(
                                              Icons.male,
                                            ),
                                            tooltip: "Male",
                                            label: Text(
                                              "Male",
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                          ButtonSegment(
                                            value: GenderType.female,
                                            icon: const Icon(
                                              Icons.female,
                                            ),
                                            tooltip: "Female",
                                            label: Text(
                                              "Female",
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          )
                                        ],
                                        selected: <GenderType>{
                                          homeBloc.state.userStatus.gender ==
                                                  "Male"
                                              ? GenderType.male
                                              : GenderType.female,
                                        },
                                        onSelectionChanged: (value) {
                                          homeBloc.add(
                                            UpdateUserEvent(
                                              gender:
                                                  value.first == GenderType.male
                                                      ? "Male"
                                                      : "Female",
                                            ),
                                          );
                                        },
                                        selectedIcon: const Icon(
                                          Icons.check,
                                          color: Color(0xff161b2C),
                                        ),
                                        style: ButtonStyle(
                                          side: MaterialStatePropertyAll(
                                            BorderSide(
                                              width: 1,
                                              color: const Color(0xff161b2C)
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Divider(
                          color: const Color(0xffC6C6D0).withOpacity(0.4),
                          height: 1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        context.responsive<Widget>(
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    submit(
                                      homeBloc: homeBloc,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0E53D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 24),
                                ),
                                child: SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: state.saveUserStatus is EventLoading
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color:
                                                  theme.colorScheme.background,
                                            ),
                                          )
                                        : Text(
                                            "Save Changes",
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
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
                                  discard(homeBloc: homeBloc);
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
                                      "Discard",
                                      style: GoogleFonts.poppins().copyWith(
                                        color: const Color(0xff161B2C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          mobile: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FilledButton.tonal(
                                onPressed: () {
                                  discard(homeBloc: homeBloc);
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
                                      "Discard",
                                      style: GoogleFonts.poppins().copyWith(
                                        color: const Color(0xff161B2C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    submit(
                                      homeBloc: homeBloc,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0E53D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 24),
                                ),
                                child: SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: state.saveUserStatus is EventLoading
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color:
                                                  theme.colorScheme.background,
                                            ),
                                          )
                                        : Text(
                                            "Save Changes",
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void submit({required HomeBloc homeBloc}) {
    homeBloc.add(
      SaveUserEvent(),
    );
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
  }

  void discard({required HomeBloc homeBloc}) {
    homeBloc.add(
      UpdateUserEvent(
        firstName: "",
        lastName: "",
        gender: "Male",
        phoneNumber: "",
      ),
    );
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
  }
}
