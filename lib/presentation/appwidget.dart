import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tournamentapp/application/auth/auth_bloc.dart';
import 'package:tournamentapp/presentation/app_scroll_behavior.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/injection.dart';
import 'package:tournamentapp/presentation/routes/router.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<AuthBloc>(),
      ),
    ], child: _buildMaterialApp(context));
  }

  Widget _buildMaterialApp(context) {
    return MaterialApp.router(
      title: 'TournamentApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.teal,
        fontFamily: 'OpenSans', //Colors.red
        // dividerColor: Colors.red,
        primaryColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: APP_WHITE,
      ),
      scrollBehavior: AppScrollBehavior(),
      routerConfig: _appRouter.config(),
    );
  }
}
