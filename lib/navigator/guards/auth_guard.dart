import 'package:muta_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/core/domain/repositories/core_repository.dart';
import 'package:muta_test/core/errors/failures.dart';
import 'package:muta_test/locator/locate.dart';
import 'package:muta_test/navigator/router.gr.dart';

@lazySingleton
class AuthGuard extends AutoRouteGuard {
  final CoreRepository coreRepository = locate<CoreRepository>();
  final AuthRepository authRepository = locate<AuthRepository>();

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final Either<Failure, String?> result = await coreRepository.getAccessToken();
    result.fold(
      (Failure failure) async {
        router.replaceAll([const LoginRoute()]);
      },
      (String? value) {
        if (value != '' && value != null) {
          resolver.next(true);
        } else {
          router.replaceAll([const LoginRoute()]);
        }
      },
    );
  }
}
