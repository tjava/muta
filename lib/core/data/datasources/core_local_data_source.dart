import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:muta_test/core/constants/string_constant.dart';
import 'package:muta_test/core/errors/exceptions.dart';
import 'package:muta_test/core/data/models/user_data_model.dart';

abstract class CoreLocalDataSource {
  Future<String?> getAccessToken();
  Future<void> cacheUserData(UserDataModel userDataModel);
  Future<UserDataModel> getCachedUserData();
  Future<bool> logout();
}

@LazySingleton(as: CoreLocalDataSource)
class CoreLocalDataSourceImpl implements CoreLocalDataSource {
  final SharedPreferences sharedPreferences;

  CoreLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<String?> getAccessToken() async {
    try {
      return sharedPreferences.getString(kAccessToken);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> cacheUserData(UserDataModel userDataModel) async {
    try {
      await sharedPreferences.setString(kUserDataKey, json.encode(userDataModel.toJson()));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<UserDataModel> getCachedUserData() {
    try {
      final String data = sharedPreferences.getString(kUserDataKey)!;
      return Future<UserDataModel>.value(UserDataModel.fromJson(json.decode(data)));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await sharedPreferences.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
