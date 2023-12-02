part of 'local_storage.dart';

class UserStorage extends LocalStorage<UserModel?> {
  @override
  Future<void> delete({required String key}) {
    return StorageBoxes.userStorage!.delete(key);
  }

  @override
  Future<UserModel?> read({required String key}) async {
    return StorageBoxes.userStorage!.get(key);
  }

  @override
  Future<List<UserModel>> readAll() async {
    return StorageBoxes.userStorage!.values.toList();
  }

  @override
  Future<void> writeAndUpdate(
      {required String key, required UserModel? data}) async {
    return StorageBoxes.userStorage!.put(key, data!);
  }

  @override
  Future<void> deleteAll() {
    return StorageBoxes.userStorage!.deleteFromDisk();
  }
}
