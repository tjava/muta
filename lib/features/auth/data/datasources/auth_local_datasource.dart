import 'package:muta_test/core/constants/string_constant.dart';
import 'package:muta_test/core/errors/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<bool>? cacheToken({required String accessToken, required String refreshToken});
  Future<bool>? clearToken();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheToken({required String accessToken, required String refreshToken}) async {
    try {
      await sharedPreferences.setString(kAccessToken, accessToken);
      await sharedPreferences.setString(kRefreshToken, refreshToken);
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> clearToken() async {
    try {
      await sharedPreferences.remove(kAccessToken);
      await sharedPreferences.remove(kRefreshToken);
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(kAccessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(kRefreshToken);
  }
}
