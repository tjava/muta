import 'package:muta_test/core/data/models/country_model.dart';
import 'package:muta_test/core/domain/entities/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({
    required super.v,
    required super.id,
    required super.countryEntity,
    required super.createdAt,
    required super.deleted,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.signinType,
    required super.spokenLanguage,
    required super.updatedAt,
    required super.userType,
    required super.userShortId,
    required super.verifiedEmail,
    required super.verifiedPhone,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        v: json["__v"],
        id: json["_id"],
        countryEntity: CountryModel.fromJson(json["country"]),
        createdAt: DateTime.parse(json["createdAt"]),
        deleted: json["deleted"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        signinType: json["signinType"],
        spokenLanguage: json["spokenLanguage"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        userType: json["userType"],
        userShortId: json["user_short_id"],
        verifiedEmail: json["verifiedEmail"],
        verifiedPhone: json["verifiedPhone"],
      );

  Map<String, dynamic> toJson() => {
        "__v": v,
        "_id": id,
        "countryEntity": CountryModel.fromEntity(countryEntity).toJson(),
        "createdAt": createdAt.toIso8601String(),
        "deleted": deleted,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "signinType": signinType,
        "spokenLanguage": spokenLanguage,
        "updatedAt": updatedAt.toIso8601String(),
        "userType": userType,
        "user_short_id": userShortId,
        "verifiedEmail": verifiedEmail,
        "verifiedPhone": verifiedPhone,
      };
}
