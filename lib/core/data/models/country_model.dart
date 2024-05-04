import 'package:muta_test/core/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({required super.code, required super.flag, required super.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        code: json["code"],
        flag: json["flag"],
        name: json["name"],
      );

  factory CountryModel.fromEntity(CountryEntity countryEntity) => CountryModel(
        code: countryEntity.code,
        flag: countryEntity.flag,
        name: countryEntity.name,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "flag": flag,
        "name": name,
      };
}
