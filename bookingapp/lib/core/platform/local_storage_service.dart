import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// The LocalStorageService class provides wrapper methods
/// for flutter_secure_storage methods
class LocalStorageService {
  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

  Future<void> setItem(String key, String value) async {
    return await flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> getItem(String key) async {
    return await flutterSecureStorage.read(key: key);
  }

  Future<void> deleteItem(String key) async{
    return flutterSecureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    return await flutterSecureStorage.deleteAll();
  }

  Future<Map<String,String>> readAll() async {
    return flutterSecureStorage.readAll();
  }
}
