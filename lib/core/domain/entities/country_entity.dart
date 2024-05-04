import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String code;
  final String flag;
  final String name;

  const CountryEntity({
    required this.code,
    required this.flag,
    required this.name,
  });

  @override
  List<Object> get props => [code, flag, name];
}
