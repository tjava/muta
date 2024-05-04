part of 'logout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

class Loading extends LogoutState {
  const Loading();
}

class Loaded extends LogoutState {
  const Loaded();
}

class Error extends LogoutState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
