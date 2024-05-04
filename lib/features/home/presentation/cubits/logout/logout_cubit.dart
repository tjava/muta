import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:muta_test/core/domain/usecases/logout_usecase.dart';
import 'package:muta_test/core/errors/failures.dart';

part 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUsecase logoutUsecase;
  LogoutCubit(
    this.logoutUsecase,
  ) : super(LogoutInitial());

  Future<void> logout() async {
    emit(const Loading());

    final result = await logoutUsecase();

    result.fold((Failure failure) async {
      emit(Error(failure.message!));
    }, (_) {
      emit(const Loaded());
    });
  }
}
