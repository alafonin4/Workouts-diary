import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  SecureStorage._();

  static FlutterSecureStorage get storage => _storage;
}