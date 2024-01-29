import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///Armazena informações confidenciais de forma segura
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<String?> read(String key, {String suffix = ''}) async {
    if (!await _storage.containsKey(key: key + suffix.toUpperCase())) {
      return null;
    }

    return await _storage.read(key: key + suffix.toUpperCase());
  }

  static Future<void> save(String key, String value, {String suffix = ''}) async {
    await _storage.write(key: key + suffix.toUpperCase(), value: value);
  }

  static Future<void> delete(String key, {String suffix = ''}) async {
    if (await _storage.containsKey(key: key + suffix.toUpperCase())) {
      await _storage.delete(key: key + suffix.toUpperCase());
    }
  }

  static Future<bool> hasKey(String key, {String suffix = ''}) async {
    return await _storage.containsKey(key: key + suffix.toUpperCase());
  }
}
