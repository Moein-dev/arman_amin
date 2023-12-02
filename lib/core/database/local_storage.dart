import 'package:arman_amin/core/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_storage.dart';
part 'theme_storage.dart';

class StorageBoxes {
  static Box<UserModel>? userStorage;
  static Box<String>? themeStorage;

  static Future<void> initial() async {
    await Hive.initFlutter().then((value) async {
      Hive.registerAdapter(UserModelAdapter());
      userStorage = await Hive.openBox<UserModel>(StorageKeys.user);
      themeStorage = await Hive.openBox<String>(StorageKeys.theme);
    });
  }
}

abstract class LocalStorage<T> {
  Future<void> writeAndUpdate({required String key, required T data});

  Future<List<T>> readAll();

  Future<T> read({required String key});

  Future<void> delete({required String key});

  Future<void> deleteAll();
}

class StorageKeys {
  static String userKey({required UserModel user}) =>
      'key_${user.firstName}-${user.lastName}';

  static String themeKey = "ThemeMode";

  static String theme = "themeStorage";
  static String user = "userStorage";
}
