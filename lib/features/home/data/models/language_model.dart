import 'package:muta_test/features/home/domain/entities/language_entity.dart';

class LanguageModel extends LanguageEntity {
  const LanguageModel({
    required super.createdAt,
    required super.deleted,
    required super.isAfrican,
    required super.languageCode,
    required super.languageIcon,
    required super.languageName,
    required super.languageId,
    super.published,
    super.totalModules,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        createdAt: DateTime.parse(json["created_at"]),
        deleted: json["deleted"],
        isAfrican: json["isAfrican"],
        languageCode: json["languageCode"],
        languageIcon: json["languageIcon"],
        languageName: json["languageName"],
        languageId: json["language_id"],
        published: json["published"],
        totalModules: json["totalModules"],
      );
}
