import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/core/domain/repositories/core_repository.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/core/usecase/usecase.dart';

@LazySingleton()
class LogoutUsecase extends UsecaseWithoutParams<void> {
  final CoreRepository coreRepository;

  LogoutUsecase({
    required this.coreRepository,
  });

  @override
  Future<Either<Failure, void>> call() {
    return coreRepository.logout();
  }
}
