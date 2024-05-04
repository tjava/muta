import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/features/home/data/datasources/home_remote_datasource.dart';
import 'package:muta_test/features/home/domain/entities/languages_entity.dart';
import 'package:muta_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  const HomeRepositoryImpl(this.homeRemoteDatasource);

  @override
  Future<Either<Failure, LanguagesEntity>> getAllLanguages() async {
    try {
      final LanguagesEntity languagesEntity = await homeRemoteDatasource.getAllLanguages();

      return Right<Failure, LanguagesEntity>(languagesEntity);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, LanguagesEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, LanguagesEntity>(
          GenericFailure(message: error.response?.data['message']));
    }
  }
}
