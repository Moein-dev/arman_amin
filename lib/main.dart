// ignore_for_file: depend_on_referenced_packages

import 'package:arman_amin/core/database/local_storage.dart';
import 'package:arman_amin/features/onlineUsers/presentation/bloc/onlineusers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arman_amin/core/dependencies/locator.dart';
import 'package:arman_amin/core/router/app_router.dart';
import 'package:arman_amin/features/home/presentation/bloc/home_bloc.dart';
import 'package:arman_amin/features/main/presentation/cubit/main_cubit.dart';
import 'package:arman_amin/features/result/presentation/bloc/result_bloc.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  // initial storage
  await StorageBoxes.initial();

  // initial service locator
  await setup();

  usePathUrlStrategy();

  // run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (mainContext) => locator<MainCubit>(),
        ),
        BlocProvider(
          create: (homeContext) => locator<HomeBloc>(),
        ),
        BlocProvider(
          create: (resultContext) => locator<ResultBloc>(),
        ),
        BlocProvider(
          create: (onlineUserContext) => locator<OnlineUsersBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        /* 
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate, */
        debugShowCheckedModeBanner: false,
        title: 'ArmanAmin Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0E53D9)),
          useMaterial3: true,
        ),
      ),
    );
  }
}
