import 'package:arman_amin/core/database/local_storage.dart';
import 'package:arman_amin/core/global/app_global.dart';
import 'package:arman_amin/features/home/data/datasources/home_local_provider.dart';
import 'package:arman_amin/features/home/data/repositories/home_repository_lmpl.dart';
import 'package:arman_amin/features/home/domain/repositories/home_repository.dart';
import 'package:arman_amin/features/home/domain/usecases/delete_user_usecase.dart';
import 'package:arman_amin/features/home/domain/usecases/save_user_usecase.dart';
import 'package:arman_amin/features/home/presentation/bloc/home_bloc.dart';
import 'package:arman_amin/features/main/presentation/cubit/main_cubit.dart';
import 'package:arman_amin/features/onlineUsers/data/datasources/online_user_api_provider.dart';
import 'package:arman_amin/features/onlineUsers/data/repositories/online_user_repository_lmpl.dart';
import 'package:arman_amin/features/onlineUsers/domain/repositories/online_user_repository.dart';
import 'package:arman_amin/features/onlineUsers/domain/usecases/get_online_users_usecase.dart';
import 'package:arman_amin/features/onlineUsers/presentation/bloc/onlineusers_bloc.dart';
import 'package:arman_amin/features/result/data/datasources/result_local_provider.dart';
import 'package:arman_amin/features/result/data/repositories/result_repository_lmpl.dart';
import 'package:arman_amin/features/result/domain/repositories/result_repository.dart';
import 'package:arman_amin/features/result/domain/usecases/get_users_usecase.dart';
import 'package:arman_amin/features/result/presentation/bloc/result_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  /// app global
  locator.registerSingleton<AppGlobal>(AppGlobal());

  /// local storage
  locator.registerSingleton<StorageBoxes>(StorageBoxes());

  /// providers
  locator.registerSingleton<HomeLocalProvider>(HomeLocalProvider());

  locator.registerSingleton<ResultLocalProvider>(ResultLocalProvider());

  locator.registerSingleton<OnlineUserApiProvider>(OnlineUserApiProvider());

  /// repositories
  locator.registerSingleton<HomeRepository>(
      HomeRepositoryImpl(localProvider: locator()));

  locator.registerSingleton<ResultRepository>(
      ResultRepositoryImpl(localProvider: locator()));

  locator.registerSingleton<OnlineUserRepository>(
      OnlineUserRepositoryImpl(apiProvider: locator()));

  /// usecases
  locator.registerSingleton<SaveUserUsecase>(
      SaveUserUsecase(repository: locator()));

  locator.registerSingleton<GetUsersUsecase>(
      GetUsersUsecase(repository: locator()));

  locator.registerSingleton<DeleteUserUsecase>(
    DeleteUserUsecase(
      repository: locator(),
    ),
  );

  locator.registerSingleton<GetOnlineUserUsecase>(
    GetOnlineUserUsecase(
      repository: locator(),
    ),
  );

  /// state managements

  locator.registerSingleton<MainCubit>(MainCubit());

  locator.registerSingleton<HomeBloc>(HomeBloc(
    saveUserUsecase: locator(),
    deleteUserUsecase: locator(),
  ));

  locator.registerSingleton<ResultBloc>(
    ResultBloc(
      usersUsecase: locator(),
    ),
  );

  locator.registerSingleton<OnlineUsersBloc>(
    OnlineUsersBloc(
      onlineUserUsecase: locator(),
    ),
  );
}
