import 'package:flutter/material.dart';
import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/core/database/local_storage.dart';

class HomeLocalProvider {
  Future<bool> saveUser({required UserModel user}) async {
    UserStorage userStorage = UserStorage();

    try {
      userStorage.writeAndUpdate(
        key: StorageKeys.userKey(user: user),
        data: user,
      );
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> deleteUser({required UserModel user})async{
        UserStorage userStorage = UserStorage();

    try {
      userStorage.delete(
        key: StorageKeys.userKey(user: user),
      );
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
