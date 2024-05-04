import 'package:muta_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:muta_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/core/usecase/usecase.dart';

@LazySingleton()
class LoginUsecase extends UsecaseWithParams<void, LoginPayloadEntity> {
  final AuthRepository authRepository;

  LoginUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(LoginPayloadEntity params) {
    return authRepository.login(params);
  }
}
