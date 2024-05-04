import 'package:auto_route/auto_route.dart';
import 'package:muta_test/navigator/guards/auth_guard.dart';
import 'package:muta_test/navigator/guards/redirect_guard.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: WelcomeRoute.page,
      path: '/welcome',
      initial: true,
      guards: [RedirectGuard()],
    ),
    AutoRoute(
      page: LanguageSpeakRoute.page,
      path: '/languageSpeak',
    ),
    AutoRoute(
      page: LanguageToLearnRoute.page,
      path: '/languageToLearn',
    ),
    AutoRoute(
      page: LanguageProficiencyRoute.page,
      path: '/languageProficiency',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: CompleteLoginRoute.page,
      path: '/completeLogin',
    ),
    AutoRoute(
      page: RegisterRoute.page,
      path: '/register',
    ),
    AutoRoute(
      page: CompleteRegisterRoute.page,
      path: '/completeRegister',
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      guards: [AuthGuard()],
    ),
  ];
}
