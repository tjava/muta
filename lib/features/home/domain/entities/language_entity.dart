import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final DateTime createdAt;
  final bool deleted;
  final bool isAfrican;
  final String languageCode;
  final String languageIcon;
  final String languageName;
  final String languageId;
  final bool? published;
  final int? totalModules;

  const LanguageEntity({
    required this.createdAt,
    required this.deleted,
    required this.isAfrican,
    required this.languageCode,
    required this.languageIcon,
    required this.languageName,
    required this.languageId,
    this.published,
    this.totalModules,
  });

  @override
  List<Object?> get props {
    return [
      createdAt,
      deleted,
      isAfrican,
      languageCode,
      languageIcon,
      languageName,
      languageId,
      published,
      totalModules,
    ];
  }
}
