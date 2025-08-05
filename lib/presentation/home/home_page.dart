import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/home/widgets/home_widget.dart';

@RoutePage(name: 'HomeRoute')
class HomePage extends StatelessWidget {
  //const AssignPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CREAMY,
      body: HomeWidget(),
    );
  }
}
