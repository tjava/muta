import 'package:equatable/equatable.dart';
import 'package:muta_test/core/constants/assets_constant.dart';
import 'package:muta_test/features/auth/auth_constants.dart';

class LanguageSpeakEntity extends Equatable {
  final String title;
  final String flag;
  final String? subTitle;

  const LanguageSpeakEntity({
    required this.title,
    required this.flag,
    this.subTitle,
  });

  @override
  List<Object?> get props => [title, flag, subTitle];
}

const List<LanguageSpeakEntity> listLanguageSpeak = [
  LanguageSpeakEntity(
    title: lblEnglish,
    flag: english,
  ),
  LanguageSpeakEntity(
    title: lblFrancais,
    flag: french,
  ),
  LanguageSpeakEntity(
    title: lblPortugues,
    flag: portuguese,
  ),
  LanguageSpeakEntity(
    title: lblEspanol,
    flag: spanish,
  ),
];

const List<LanguageSpeakEntity> listLanguageLearn = [
  LanguageSpeakEntity(
    title: 'Swahili',
    flag: swahili,
  ),
  LanguageSpeakEntity(
    title: 'Amharic',
    flag: amharic,
  ),
  LanguageSpeakEntity(
    title: 'Yoruba',
    flag: yoruba,
  ),
  LanguageSpeakEntity(
    title: 'Fula',
    flag: fula,
  ),
  LanguageSpeakEntity(
    title: 'Igbo',
    flag: igbo,
  ),
  LanguageSpeakEntity(
    title: 'Hausa',
    flag: hausa,
  ),
  LanguageSpeakEntity(
    title: 'Oromo',
    flag: oromo,
  ),
  LanguageSpeakEntity(
    title: 'Zulu',
    flag: zulu,
  ),
  LanguageSpeakEntity(
    title: 'Shona',
    flag: shona,
  ),
];
