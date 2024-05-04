import 'package:equatable/equatable.dart';

import 'package:muta_test/core/domain/entities/user_data_entity.dart';

class AuthResponseEntity extends Equatable {
  final bool error;
  final String message;
  final String refreshToken;
  final String token;
  final UserDataEntity userDataEntity;

  const AuthResponseEntity({
    required this.error,
    required this.message,
    required this.refreshToken,
    required this.token,
    required this.userDataEntity,
  });

  @override
  List<Object> get props {
    return [
      error,
      message,
      refreshToken,
      token,
      userDataEntity,
    ];
  }
}
