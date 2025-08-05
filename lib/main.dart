import 'package:flutter/material.dart';
import 'package:tournamentapp/presentation/appwidget.dart';
import 'package:tournamentapp/presentation/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();

  runApp(AppWidget());
}
