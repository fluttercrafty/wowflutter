import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart';
import 'package:wowflutter/widgets/audio_player_widget.dart';

import '../shimmers/blocked_users.dart';

class GetDataService {
  GetDataService(List<Map<String, dynamic>> apiKey, String data, String hmac) {
    final decryptedMap = getData(data, hmac);
    if (decryptedMap != null) {
      apiKey.add(decryptedMap);
    } else {
      debugPrint('Decryption failed or HMAC verification failed');
    }
  }

  bool _verifyHMAC(List<int> data, String hmac, String key) {
    final generatedHmac =
        Hmac(sha256, utf8.encode(key)).convert(data).toString();

    return generatedHmac == hmac;
  }

  String? layers(String encryptedJson, int layer) {
    final jsonObject = jsonDecode(encryptedJson);
    final dataBase64 = jsonObject['data'];
    final hmac = jsonObject['hmac'];
    final decodedData = base64Decode(dataBase64);

    if (!_verifyHMAC(decodedData, hmac, hmacKeys[layer])) {
      return null;
    }

    final encrypter =
        encrypt.Encrypter(encrypt.AES(keys[layer], mode: encrypt.AESMode.cbc));
    try {
      final decryptedBytes = encrypter
          .decryptBytes(encrypt.Encrypted(decodedData), iv: ivs[layer]);
      final decryptedString = utf8.decode(decryptedBytes);
      return decryptedString;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getData(String data, String hmac) {
    try {
      String encryptedJson = jsonEncode({"data": data, "hmac": hmac});

      String? decryptedData = encryptedJson;
      for (int layer = keys.length - 1; layer >= 0; layer--) {
        decryptedData = layers(decryptedData!, layer);
        if (decryptedData == null) return null;
      }
      return decryptedData != null
          ? jsonDecode(decryptedData) as Map<String, dynamic>
          : null;
    } catch (e) {
      debugPrint('Decryption error: $e');
      return null;
    }
  }
}

final keys = [
  encrypt.Key.fromUtf8('5d41402abc4b2a76b9719d911017c592'),
  encrypt.Key.fromUtf8('d2f4b7e9a6c1d3f5a8e2c9b1a4d6e8f7'),
  encrypt.Key.fromUtf8('a7d3b2c4f5e9a1d8b6e2f4c9b3d5a6e1')
];