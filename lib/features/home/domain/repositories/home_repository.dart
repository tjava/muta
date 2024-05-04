import 'package:dartz/dartz.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/features/home/domain/entities/languages_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, LanguagesEntity>> getAllLanguages();
}
