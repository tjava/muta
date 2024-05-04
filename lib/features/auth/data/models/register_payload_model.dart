import 'package:muta_test/core/data/models/country_model.dart';
import 'package:muta_test/features/auth/domain/entities/register_payload_entity.dart';

class RegisterPayloadModel extends RegisterPayloadEntity {
  const RegisterPayloadModel({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.password,
    required super.signinType,
    required super.spokenLanguage,
    required super.userType,
    required super.countryEntity,
  });

  factory RegisterPayloadModel.fromEntity(RegisterPayloadEntity registerPayloadEntity) =>
      RegisterPayloadModel(
        email: registerPayloadEntity.email,
        firstName: registerPayloadEntity.firstName,
        lastName: registerPayloadEntity.lastName,
        password: registerPayloadEntity.password,
        signinType: registerPayloadEntity.signinType,
        spokenLanguage: registerPayloadEntity.spokenLanguage,
        userType: registerPayloadEntity.userType,
        countryEntity: CountryModel.fromEntity(registerPayloadEntity.countryEntity),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "signinType": signinType,
        "spokenLanguage": spokenLanguage,
        "userType": userType,
        "country": CountryModel.fromEntity(countryEntity).toJson(),
      };
}
