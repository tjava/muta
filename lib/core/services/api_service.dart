import 'package:muta_test/features/auth/data/models/auth_response_model.dart';
import 'package:dio/dio.dart';
import 'package:muta_test/features/home/data/models/languages_model.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:muta_test/core/constants/api_constant.dart';

part 'api_service.g.dart';

@retrofit.RestApi(baseUrl: baseUrl)
abstract class ApiService {
  static Future<ApiService> getInstance() async {
    return ApiService(Dio());
  }

  factory ApiService(Dio dio) = _ApiService;

  @retrofit.POST(loginEndpoint)
  Future<AuthResponseModel> login({
    @retrofit.Body() required Map<String, dynamic> params,
  });

  @retrofit.POST(registerEndpoint)
  Future<AuthResponseModel> register({
    @retrofit.Body() required Map<String, dynamic> params,
  });

  @retrofit.GET(homeEndpoint)
  Future<LanguagesModel> getAllLanguages({
    @retrofit.Header('Authorization') required String token,
  });
}
