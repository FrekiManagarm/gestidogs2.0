import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  final FlutterSecureStorage storage;

  const StorageManager(this.storage);

  Future<String?> getAccessToken() async {
    return await storage.read(key: "accessToken");
  }

  void setAccessToken(String accessToken) async {
    await storage.write(key: "accessToken", value: accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: "refreshToken");
  }

  void setRefreshToken(String refreshToken) async {
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  Future<String?> getEstablishmentId() async {
    return await storage.read(key: "establishmentId");
  }

  void setEstablishmentId(String establishmentId) async {
    await storage.write(key: "establishmentId", value: establishmentId);
  }

  void logOut() async {
    await storage.deleteAll();
  }
}
