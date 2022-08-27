import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/utils/utils.dart';

class HiveHelper {
  HiveHelper._();

  static final HiveHelper _hiveHelper = HiveHelper._();

  static HiveHelper get instance => _hiveHelper;

  // Boxes getters
  Box<dynamic> get settingsBox => Hive.box(AppConstants.settings);

  // Helpers Methods

  bool get hasLoggedIn  {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  Future<bool> get hasShownIntro async =>
      await settingsBox.get(AppConstants.hasShownIntro, defaultValue: false)
          as bool;

  // Initializations Methods
  Future<Uint8List> _setupSecureKey() async {
    const secureStorage = FlutterSecureStorage();
    final containsEncryptionKey =
        await secureStorage.containsKey(key: AppConstants.secureBoxKey);
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: AppConstants.secureBoxKey,
        value: base64UrlEncode(key),
      );
    }
    final value = await secureStorage.read(key: AppConstants.secureBoxKey);
    return base64Url.decode(value!);
  }

  Future<Box<dynamic>> initializeSettingsBox() async {
    final encryptionKey = await _setupSecureKey();
    return Hive.openBox<dynamic>(
      AppConstants.settings,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }
}
