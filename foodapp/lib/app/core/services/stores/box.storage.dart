import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

enum KeyKey { token, refreshToken }

class KeyStorage {
  static final box = GetStorage();
  static Future writeString({
    required KeyKey key,
    required String value,
  }) async {
    box.write(key.name, value);
    debugPrint("-- [KeyStorage WRITE] --: ${key.name} - $value");
  }

  static Future<String?> readString({
    required KeyKey key,
  }) async {
    String? value = box.read(key.name);
    debugPrint("-- [KeyStorage READ] --: ${key.name} - $value");
    return value;
  }

  static Future delete({
    required KeyKey key,
  }) async {
    box.remove(key.name);
    debugPrint("-- [KeyStorage DELETE] --: ${key.name}");
  }
}
