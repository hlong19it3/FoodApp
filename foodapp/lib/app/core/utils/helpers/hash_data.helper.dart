import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:foodapp/app/core/values/app_data.dart';

import '../../values/app_password.dart';

class HashDataHelper {
  static final Key _key = Key.fromUtf8(AppPassword.key);
  static final IV _iv = IV.fromUtf8(AppPassword.initVector);
  static final Encrypter _encrypt =
      Encrypter(AES(_key, mode: AESMode.ofb64Gctr));

  // Chuỗi mã hoá được tạo ra và không thể giải mã
  // Sử dụng để so sánh các token thì còn gì bằng
  static String encryptHmacSHA256(String data) {
    var key = utf8.encode(AppPassword.key);

    var bytes = utf8.encode(data);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256

    var string = hmacSha256.convert(bytes);

    return string.toString();
  }

  static String encryption(String? text) {
    final string = _encrypt.encrypt(text ?? AppData.name, iv: _iv);
    return string.base64;
  }

//dycrypt
  static String decryption(String text) {
    final string = _encrypt.decrypt(Encrypted.fromBase64(text), iv: _iv);
    return string;
  }
}
