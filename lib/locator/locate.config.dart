// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:muta_test/core/cubits/connectivity/connectivity_cubit.dart'
    as _i3;
import 'package:muta_test/core/data/datasources/core_local_data_source.dart'
    as _i9;
import 'package:muta_test/core/data/repositories/core_repository_impl.dart'
    as _i20;
import 'package:muta_test/core/domain/repositories/core_repository.dart'
    as _i19;
import 'package:muta_test/core/domain/usecases/logout_usecase.dart' as _i24;
import 'package:muta_test/core/services/api_service.dart' as _i5;
import 'package:muta_test/core/services/third_party_services_module.dart'
    as _i26;
import 'package:muta_test/features/auth/data/datasources/auth_local_datasource.dart'
    as _i8;
import 'package:muta_test/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i13;
import 'package:muta_test/features/auth/data/repositories/auth_repository_impl.dart'
    as _i16;
import 'package:muta_test/features/auth/domain/repositories/auth_repository.dart'
    as _i15;
import 'package:muta_test/features/auth/domain/usecases/login_usecase.dart'
    as _i18;
import 'package:muta_test/features/auth/domain/usecases/register_usecase.dart'
    as _i17;
import 'package:muta_test/features/auth/presentation/cubits/login/login_cubit.dart'
    as _i23;
import 'package:muta_test/features/auth/presentation/cubits/register/register_cubit.dart'
    as _i22;
import 'package:muta_test/features/home/data/datasources/home_remote_datasource.dart'
    as _i10;
import 'package:muta_test/features/home/data/repositories/home_repository_impl.dart'
    as _i12;
import 'package:muta_test/features/home/domain/repositories/home_repository.dart'
    as _i11;
import 'package:muta_test/features/home/domain/usecases/get_all_languages_usecase.dart'
    as _i14;
import 'package:muta_test/features/home/presentation/cubits/get_all_languages/get_all_languages_cubit.dart'
    as _i21;
import 'package:muta_test/features/home/presentation/cubits/logout/logout_cubit.dart'
    as _i25;
import 'package:muta_test/navigator/guards/auth_guard.dart' as _i7;
import 'package:muta_test/navigator/guards/redirect_guard.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.factory<_i3.ConnectivityCubit>(() => _i3.ConnectivityCubit());
  await gh.lazySingletonAsync<_i4.SharedPreferences>(
    () => thirdPartyServicesModule.prefs,
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.ApiService>(
    () => thirdPartyServicesModule.apiService,
    preResolve: true,
  );
  gh.lazySingleton<_i6.RedirectGuard>(() => _i6.RedirectGuard());
  gh.lazySingleton<_i7.AuthGuard>(() => _i7.AuthGuard());
  gh.lazySingleton<_i8.AuthLocalDatasource>(() => _i8.AuthLocalDatasourceImpl(
      sharedPreferences: gh<_i4.SharedPreferences>()));
  gh.lazySingleton<_i9.CoreLocalDataSource>(() => _i9.CoreLocalDataSourceImpl(
      sharedPreferences: gh<_i4.SharedPreferences>()));
  gh.lazySingleton<_i10.HomeRemoteDatasource>(
      () => _i10.HomeRemoteDatasourceImpl(
            apiService: gh<_i5.ApiService>(),
            coreLocalDataSource: gh<_i9.CoreLocalDataSource>(),
          ));
  gh.lazySingleton<_i11.HomeRepository>(
      () => _i12.HomeRepositoryImpl(gh<_i10.HomeRemoteDatasource>()));
  gh.lazySingleton<_i13.AuthRemoteDatasource>(
      () => _i13.AuthRemoteDatasourceImpl(gh<_i5.ApiService>()));
  gh.lazySingleton<_i14.GetAllLanguagesUsecase>(() =>
      _i14.GetAllLanguagesUsecase(homeRepository: gh<_i11.HomeRepository>()));
  gh.lazySingleton<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
        authRemoteDatasource: gh<_i13.AuthRemoteDatasource>(),
        authLocalDataSource: gh<_i8.AuthLocalDatasource>(),
      ));
  gh.lazySingleton<_i17.RegisterUsecase>(
      () => _i17.RegisterUsecase(authRepository: gh<_i15.AuthRepository>()));
  gh.lazySingleton<_i18.LoginUsecase>(
      () => _i18.LoginUsecase(authRepository: gh<_i15.AuthRepository>()));
  gh.lazySingleton<_i19.CoreRepository>(() => _i20.CoreRepositoryImpl(
      coreLocalDataSource: gh<_i9.CoreLocalDataSource>()));
  gh.factory<_i21.GetAllLanguagesCubit>(
      () => _i21.GetAllLanguagesCubit(gh<_i14.GetAllLanguagesUsecase>()));
  gh.factory<_i22.RegisterCubit>(
      () => _i22.RegisterCubit(gh<_i17.RegisterUsecase>()));
  gh.factory<_i23.LoginCubit>(() => _i23.LoginCubit(gh<_i18.LoginUsecase>()));
  gh.lazySingleton<_i24.LogoutUsecase>(
      () => _i24.LogoutUsecase(coreRepository: gh<_i19.CoreRepository>()));
  gh.factory<_i25.LogoutCubit>(
      () => _i25.LogoutCubit(gh<_i24.LogoutUsecase>()));
  return getIt;
}

class _$ThirdPartyServicesModule extends _i26.ThirdPartyServicesModule {}
