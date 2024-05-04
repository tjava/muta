import 'package:equatable/equatable.dart';

import 'package:muta_test/core/domain/entities/country_entity.dart';

class RegisterPayloadEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String signinType;
  final String spokenLanguage;
  final String userType;
  final CountryEntity countryEntity;

  const RegisterPayloadEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.signinType,
    required this.spokenLanguage,
    required this.userType,
    required this.countryEntity,
  });

  @override
  List<Object> get props {
    return [
      email,
      firstName,
      lastName,
      password,
      signinType,
      spokenLanguage,
      userType,
      countryEntity,
    ];
  }
}
