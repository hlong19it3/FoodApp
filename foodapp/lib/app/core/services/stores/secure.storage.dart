import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureKey { isWelcome, id, email, isFingerPrint }

class SecureStorage {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      resetOnError: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.unlocked,
      synchronizable: true,
    ),
    wOptions: WindowsOptions(),
  );

  static Future write({required SecureKey key, required String value}) async {
    await storage.write(key: key.name, value: value);
    debugPrint("-- [SecureStorage WRITE] --: ${key.name} - $value");
  }

  static Future<String?> read({required SecureKey key}) async {
    String? readData = await storage.read(key: key.name);
    debugPrint("-- [SecureStorage GET] --: ${key.name} - $readData");

    return readData;
  }

  static Future delete({required SecureKey key}) async {
    await storage.delete(key: key.name);
    debugPrint("-- [SecureStorage DELETE] --: ${key.name}");
  }

  static Future deleteAll() async {
    await storage.deleteAll();
    debugPrint("-- [SecureStorage DELETEALL] --");
  }
}
