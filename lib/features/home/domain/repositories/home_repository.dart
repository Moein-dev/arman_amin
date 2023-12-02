import 'package:arman_amin/core/models/user_model.dart';

abstract class HomeRepository {
  Future<bool> saveUser({required UserModel user});
  Future<bool> deleteUser({required UserModel user});
}
