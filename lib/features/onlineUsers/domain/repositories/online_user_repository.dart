import 'package:arman_amin/core/network/data_state.dart';
import 'package:arman_amin/features/onlineUsers/domain/entities/online_user_entity.dart';

abstract class OnlineUserRepository {
  Future<DataState<List<OnlineUserEntity>>> getUsers({required int offset, int limit = 10});
}
