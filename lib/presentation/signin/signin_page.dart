import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/signin/widgets/signin_widget.dart';

@RoutePage(name: 'SigninRoute')
class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      //onWillPop: () async => false,
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DARK_GREY,
          title: Text('TournanamentApp'),
        ),
        backgroundColor: CREAMY,
        body: SigninWidget(),
      ),
    );
  }
}
