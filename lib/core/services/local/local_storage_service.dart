import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/hive_constants.dart';
//We use hive for local storage
class LocalStorageService {
  final _box = Hive.box(localStorage);

  // Save Data
  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  // Retrieve Data
  dynamic getData(String key) {
    return _box.get(key);
  }

  // Delete Data
  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  // Clear Cache
  Future<void> clearCache() async {
    await _box.clear();
  }
}
