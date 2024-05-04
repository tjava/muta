import 'package:muta_test/core/constants/string_constant.dart';
import 'package:muta_test/features/auth/auth_constants.dart';
import 'package:muta_test/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:muta_test/features/auth/data/models/login_payload_model.dart';
import 'package:muta_test/features/auth/data/models/register_payload_model.dart';
import 'package:muta_test/features/auth/domain/entities/auth_response_entity.dart';
import 'package:muta_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:muta_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:muta_test/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDataSource;
  const AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, void>> login(LoginPayloadEntity loginPayloadEntity) async {
    try {
      final LoginPayloadModel loginPayloadModel = LoginPayloadModel(
        email: loginPayloadEntity.email,
        password: loginPayloadEntity.password,
      );

      final AuthResponseEntity authResponseEntity =
          await authRemoteDatasource.login(loginPayloadModel);

      await authLocalDataSource.cacheToken(
        accessToken: authResponseEntity.token,
        refreshToken: authResponseEntity.refreshToken,
      );

      return const Right<Failure, void>(null);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, void>(
          ServerFailure(
            message: kServerError,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, void>(
        GenericFailure(message: error.response?.data['message'] ?? kLoginError),
      );
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterPayloadEntity registerPayloadEntity) async {
    try {
      final AuthResponseEntity authResponseEntity = await authRemoteDatasource
          .register(RegisterPayloadModel.fromEntity(registerPayloadEntity));

      await authLocalDataSource.cacheToken(
        accessToken: authResponseEntity.token,
        refreshToken: authResponseEntity.refreshToken,
      );

      return const Right<Failure, void>(null);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, void>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, void>(
        GenericFailure(message: error.response?.data['message'] ?? kGenericError),
      );
    }
  }
}
