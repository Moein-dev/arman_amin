import 'package:arman_amin/core/network/data_state.dart';
import 'package:arman_amin/features/onlineUsers/domain/entities/online_user_entity.dart';
import 'package:arman_amin/features/onlineUsers/domain/repositories/online_user_repository.dart';

class GetOnlineUserUsecase {
  final OnlineUserRepository repository;

  GetOnlineUserUsecase({required this.repository});

  Future<DataState<List<OnlineUserEntity>>> call(
      {required int offset, int limit = 10}) async {
    return repository.getUsers(offset: offset, limit: limit);
  }
}
