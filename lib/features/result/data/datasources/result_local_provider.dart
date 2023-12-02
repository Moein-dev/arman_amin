import 'package:arman_amin/core/database/local_storage.dart';
import 'package:arman_amin/core/models/user_model.dart';

class ResultLocalProvider {
  Future<List<UserModel>> getUsers() async {
    UserStorage storage = UserStorage();
    return await storage.readAll();
  }
}
