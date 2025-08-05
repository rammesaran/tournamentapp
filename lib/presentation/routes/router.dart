import 'package:auto_route/auto_route.dart';
import 'package:tournamentapp/presentation/routes/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
        ),
        AutoRoute(page: SigninRoute.page, initial: true),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
