import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tournamentapp/application/auth/auth_bloc.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/routes/router.gr.dart';

@RoutePage(name: 'SplashRoute')
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    AutoRouter.of(context).replace(SigninRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, authState) async {},
        child: Container(
            color: APP_WHITE,
            child: Center(
                child: CircularProgressIndicator(
              backgroundColor: APP_WHITE,
            ))));
  }
}
