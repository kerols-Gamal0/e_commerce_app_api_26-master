import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'user_token', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'user_token');
  }

  static Future<void> clearCache() async {
    await _storage.deleteAll();
  }
}
