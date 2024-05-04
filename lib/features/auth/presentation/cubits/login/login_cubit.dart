import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:muta_test/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  Future<void> login(LoginPayloadEntity loginPayloadEntity) async {
    emit(const Loading());

    final result = await loginUsecase(loginPayloadEntity);

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        }
        emit(Error(failure.message!));
      },
      (_) => emit(const Loaded()),
    );
  }

  void showPassword(bool val) {
    emit(ShowPassword(val ? false : true));
  }
}
