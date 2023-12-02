import 'package:arman_amin/core/network/data_state.dart';
import 'package:arman_amin/features/onlineUsers/data/datasources/online_user_api_provider.dart';
import 'package:arman_amin/features/onlineUsers/data/models/online_user_model.dart';
import 'package:arman_amin/features/onlineUsers/domain/entities/online_user_entity.dart';
import 'package:arman_amin/features/onlineUsers/domain/repositories/online_user_repository.dart';

class OnlineUserRepositoryImpl extends OnlineUserRepository {
  final OnlineUserApiProvider apiProvider;

  OnlineUserRepositoryImpl({required this.apiProvider});

  @override
  Future<DataState<List<OnlineUserEntity>>> getUsers(
      {required int offset, int limit = 10}) async {
    DataState response =
        await apiProvider.getUsers(limit: limit, offset: offset);
    if (response is DataSuccess) {
      List<OnlineUserEntity> users = List.from(
          (response.data["users"] as List).map((e) => OnlineUser.fromJson(e)));
      return DataSuccess(
        data: users,
      );
    } else {
      return DataFailed(
        error: response.error!,
      );
    }
  }
}
