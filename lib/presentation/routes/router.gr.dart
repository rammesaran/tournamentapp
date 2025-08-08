// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:tournamentapp/presentation/display/display_page.dart' as _i4;
import 'package:tournamentapp/presentation/home/home_page.dart' as _i3;
import 'package:tournamentapp/presentation/livematch/livematch_page.dart'
    as _i5;
import 'package:tournamentapp/presentation/signin/signin_page.dart' as _i2;
import 'package:tournamentapp/presentation/splash/splash_page.dart' as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SplashPage(),
      );
    },
    SigninRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SigninPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(),
      );
    },
    PairsDisplayRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PairsDisplayPage(),
      );
    },
    LiveMatchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LiveMatchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SigninPage]
class SigninRoute extends _i6.PageRouteInfo<void> {
  const SigninRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PairsDisplayPage]
class PairsDisplayRoute extends _i6.PageRouteInfo<void> {
  const PairsDisplayRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PairsDisplayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PairsDisplayRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LiveMatchPage]
class LiveMatchRoute extends _i6.PageRouteInfo<void> {
  const LiveMatchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LiveMatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LiveMatchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
