import 'package:muta_test/core/data/models/user_data_model.dart';
import 'package:muta_test/features/auth/domain/entities/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel({
    required super.error,
    required super.message,
    required super.refreshToken,
    required super.token,
    required super.userDataEntity,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        error: json["error"],
        message: json["message"],
        refreshToken: json["refreshToken"],
        token: json["token"],
        userDataEntity: UserDataModel.fromJson(json["userData"]),
      );
}
