import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tournamentapp/application/getplayer/getplayer_bloc.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/display/widgets/display_widget.dart';

@RoutePage(name: 'PairsDisplayRoute')
class PairsDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CREAMY,
      body: PairsDisplayWidget(),
    );
  }
}
