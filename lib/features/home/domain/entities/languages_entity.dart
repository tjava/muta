import 'package:equatable/equatable.dart';

import 'package:muta_test/features/home/domain/entities/language_entity.dart';

class LanguagesEntity extends Equatable {
  final List<LanguageEntity> listLanguageEntity;
  final bool error;
  const LanguagesEntity({
    required this.listLanguageEntity,
    required this.error,
  });

  @override
  List<Object> get props => [listLanguageEntity, error];
}
