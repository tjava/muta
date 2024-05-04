import 'package:equatable/equatable.dart';

import 'package:muta_test/core/domain/entities/country_entity.dart';

class UserDataEntity extends Equatable {
  final int v;
  final String id;
  final CountryEntity countryEntity;
  final DateTime createdAt;
  final bool deleted;
  final String email;
  final String firstName;
  final String lastName;
  final String signinType;
  final String spokenLanguage;
  final DateTime updatedAt;
  final String userType;
  final int userShortId;
  final bool verifiedEmail;
  final bool verifiedPhone;

  const UserDataEntity({
    required this.v,
    required this.id,
    required this.countryEntity,
    required this.createdAt,
    required this.deleted,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.signinType,
    required this.spokenLanguage,
    required this.updatedAt,
    required this.userType,
    required this.userShortId,
    required this.verifiedEmail,
    required this.verifiedPhone,
  });

  @override
  List<Object> get props {
    return [
      v,
      id,
      countryEntity,
      createdAt,
      deleted,
      email,
      firstName,
      lastName,
      signinType,
      spokenLanguage,
      updatedAt,
      userType,
      userShortId,
      verifiedEmail,
      verifiedPhone,
    ];
  }
}
