// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/widgets.dart' as _i12;
import 'package:muta_test/features/auth/presentation/pages/complete_login_page.dart'
    as _i1;
import 'package:muta_test/features/auth/presentation/pages/complete_register_page.dart'
    as _i2;
import 'package:muta_test/features/auth/presentation/pages/language_proficiency_page.dart'
    as _i4;
import 'package:muta_test/features/auth/presentation/pages/language_speak_page.dart'
    as _i5;
import 'package:muta_test/features/auth/presentation/pages/language_to_learn_page.dart'
    as _i6;
import 'package:muta_test/features/auth/presentation/pages/login_page.dart'
    as _i7;
import 'package:muta_test/features/auth/presentation/pages/register_page.dart'
    as _i8;
import 'package:muta_test/features/auth/presentation/pages/welcome_page.dart'
    as _i9;
import 'package:muta_test/features/home/presentation/pages/home_page.dart'
    as _i3;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CompleteLoginRoute.name: (routeData) {
      final args = routeData.argsAs<CompleteLoginRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CompleteLoginPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    CompleteRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<CompleteRegisterRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CompleteRegisterPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LanguageProficiencyRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageProficiencyRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LanguageProficiencyPage(
          key: args.key,
          language: args.language,
        ),
      );
    },
    LanguageSpeakRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LanguageSpeakPage(),
      );
    },
    LanguageToLearnRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LanguageToLearnPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CompleteLoginPage]
class CompleteLoginRoute extends _i10.PageRouteInfo<CompleteLoginRouteArgs> {
  CompleteLoginRoute({
    _i11.Key? key,
    required String email,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CompleteLoginRoute.name,
          args: CompleteLoginRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CompleteLoginRoute';

  static const _i10.PageInfo<CompleteLoginRouteArgs> page =
      _i10.PageInfo<CompleteLoginRouteArgs>(name);
}

class CompleteLoginRouteArgs {
  const CompleteLoginRouteArgs({
    this.key,
    required this.email,
  });

  final _i11.Key? key;

  final String email;

  @override
  String toString() {
    return 'CompleteLoginRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i2.CompleteRegisterPage]
class CompleteRegisterRoute
    extends _i10.PageRouteInfo<CompleteRegisterRouteArgs> {
  CompleteRegisterRoute({
    _i12.Key? key,
    required String email,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CompleteRegisterRoute.name,
          args: CompleteRegisterRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CompleteRegisterRoute';

  static const _i10.PageInfo<CompleteRegisterRouteArgs> page =
      _i10.PageInfo<CompleteRegisterRouteArgs>(name);
}

class CompleteRegisterRouteArgs {
  const CompleteRegisterRouteArgs({
    this.key,
    required this.email,
  });

  final _i12.Key? key;

  final String email;

  @override
  String toString() {
    return 'CompleteRegisterRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LanguageProficiencyPage]
class LanguageProficiencyRoute
    extends _i10.PageRouteInfo<LanguageProficiencyRouteArgs> {
  LanguageProficiencyRoute({
    _i11.Key? key,
    required String language,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LanguageProficiencyRoute.name,
          args: LanguageProficiencyRouteArgs(
            key: key,
            language: language,
          ),
          initialChildren: children,
        );

  static const String name = 'LanguageProficiencyRoute';

  static const _i10.PageInfo<LanguageProficiencyRouteArgs> page =
      _i10.PageInfo<LanguageProficiencyRouteArgs>(name);
}

class LanguageProficiencyRouteArgs {
  const LanguageProficiencyRouteArgs({
    this.key,
    required this.language,
  });

  final _i11.Key? key;

  final String language;

  @override
  String toString() {
    return 'LanguageProficiencyRouteArgs{key: $key, language: $language}';
  }
}

/// generated route for
/// [_i5.LanguageSpeakPage]
class LanguageSpeakRoute extends _i10.PageRouteInfo<void> {
  const LanguageSpeakRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LanguageSpeakRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSpeakRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LanguageToLearnPage]
class LanguageToLearnRoute extends _i10.PageRouteInfo<void> {
  const LanguageToLearnRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LanguageToLearnRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageToLearnRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WelcomePage]
class WelcomeRoute extends _i10.PageRouteInfo<void> {
  const WelcomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
