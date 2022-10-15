import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

enum KeyKey { token, refreshToken }

class KeyStorage {
  static Future writeString({
    required KeyKey key,
    required String value,
  }) async {
    final box = GetStorage();
    box.write(key.name, value);
    debugPrint("-- [KeyStorage WRITE] --: ${key.name} - $value");
  }

  static Future<String?> readString({
    required KeyKey key,
  }) async {
    final box = GetStorage();
    String? value = box.read(key.name);
    debugPrint("-- [KeyStorage READ] --: ${key.name} - $value");
    return value;
  }
}
