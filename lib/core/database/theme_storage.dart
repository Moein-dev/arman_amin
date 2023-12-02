part of "local_storage.dart";

class ThemeStorage extends LocalStorage<String?> {
  @override
  Future<void> delete({required String key}) {
    return StorageBoxes.themeStorage!.delete(key);
  }

  @override
  Future<String?> read({required String key}) async {
    return StorageBoxes.themeStorage!.get(key);
  }

  @override
  Future<List<String>> readAll() async {
    return StorageBoxes.themeStorage!.values.toList();
  }

  @override
  Future<void> writeAndUpdate({required String key, required String? data}) {
    return StorageBoxes.themeStorage!.put(key, data!);
  }

  @override
  Future<void> deleteAll() {
    return StorageBoxes.userStorage!.deleteFromDisk();
  }
}
