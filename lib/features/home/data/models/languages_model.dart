import 'package:muta_test/features/home/data/models/language_model.dart';
import 'package:muta_test/features/home/domain/entities/languages_entity.dart';

class LanguagesModel extends LanguagesEntity {
  const LanguagesModel({required super.listLanguageEntity, required super.error});

  factory LanguagesModel.fromJson(Map<String, dynamic> json) => LanguagesModel(
        listLanguageEntity:
            List<LanguageModel>.from(json["data"].map((x) => LanguageModel.fromJson(x))),
        error: json["error"],
      );
}
