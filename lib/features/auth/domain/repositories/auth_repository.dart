import 'package:muta_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:muta_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:muta_test/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(LoginPayloadEntity loginPayloadEntity);
  Future<Either<Failure, void>> register(RegisterPayloadEntity registerPayloadEntity);
}
