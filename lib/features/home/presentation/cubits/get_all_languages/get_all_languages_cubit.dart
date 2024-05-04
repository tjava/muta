import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/features/home/domain/entities/languages_entity.dart';
import 'package:muta_test/features/home/domain/usecases/get_all_languages_usecase.dart';

part 'get_all_languages_state.dart';

@injectable
class GetAllLanguagesCubit extends Cubit<GetAllLanguagesState> {
  final GetAllLanguagesUsecase getAllLanguagesUsecase;
  GetAllLanguagesCubit(this.getAllLanguagesUsecase) : super(GetAllLanguagesInitial());

  Future<void> getAllLanguages() async {
    emit(const Loading());

    final result = await getAllLanguagesUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        }
        emit(Error(failure.message!));
      },
      (LanguagesEntity languagesEntity) => emit(Loaded(languagesEntity)),
    );
  }
}
