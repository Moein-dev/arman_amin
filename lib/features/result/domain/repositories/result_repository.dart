import 'package:arman_amin/core/models/user_model.dart';

abstract class ResultRepository {
  Future<List<UserModel>> getUsers();
}
