part of 'get_all_languages_cubit.dart';

sealed class GetAllLanguagesState extends Equatable {
  const GetAllLanguagesState();

  @override
  List<Object> get props => [];
}

final class GetAllLanguagesInitial extends GetAllLanguagesState {}

class Loading extends GetAllLanguagesState {
  const Loading();
}

class Loaded extends GetAllLanguagesState {
  final LanguagesEntity languagesEntity;
  const Loaded(this.languagesEntity);

  @override
  List<Object> get props => [languagesEntity];
}

class Error extends GetAllLanguagesState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
