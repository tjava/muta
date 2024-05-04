import 'package:muta_test/core/services/api_service.dart';
import 'package:muta_test/features/auth/data/models/auth_response_model.dart';
import 'package:muta_test/features/auth/data/models/login_payload_model.dart';
import 'package:muta_test/features/auth/data/models/register_payload_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> login(LoginPayloadModel loginPayloadModel);
  Future<AuthResponseModel> register(RegisterPayloadModel registerPayloadModel);
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiService apiService;
  AuthRemoteDatasourceImpl(this.apiService);

  @override
  Future<AuthResponseModel> login(LoginPayloadModel loginPayloadModel) async {
    final AuthResponseModel authResponseModel =
        await apiService.login(params: loginPayloadModel.toJson());
    return authResponseModel;
  }

  @override
  Future<AuthResponseModel> register(RegisterPayloadModel registerPayloadModel) async {
    final AuthResponseModel authResponseModel =
        await apiService.register(params: registerPayloadModel.toJson());
    return authResponseModel;
  }
}
