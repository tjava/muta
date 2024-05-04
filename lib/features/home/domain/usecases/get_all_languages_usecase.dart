import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/core/usecase/usecase.dart';
import 'package:muta_test/features/home/domain/entities/languages_entity.dart';
import 'package:muta_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton()
class GetAllLanguagesUsecase extends UsecaseWithoutParams<LanguagesEntity> {
  final HomeRepository homeRepository;

  GetAllLanguagesUsecase({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, LanguagesEntity>> call() {
    return homeRepository.getAllLanguages();
  }
}
