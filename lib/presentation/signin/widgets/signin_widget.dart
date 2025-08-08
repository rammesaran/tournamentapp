import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tournamentapp/application/auth/auth_bloc.dart';
import 'package:tournamentapp/application/getplayer/getplayer_bloc.dart';
import 'package:tournamentapp/domain/core/domain_utils.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/routes/router.gr.dart';

class SigninWidget extends StatefulWidget {
  // const SigninWidget({Key? key}) : super(key: key);

  @override
  _SigninWidgetState createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  String? emailValue;
  String? passwordValue;
  bool rememberMe = false;
  late TextEditingController _emailCtlr;
  late TextEditingController _passwordCtlr;
  bool _isSnackbarVisible = false;
  @override
  void initState() {
    getStringValuesSF();

    _emailCtlr = TextEditingController();
    _passwordCtlr = TextEditingController();
    _emailCtlr.text = emailValue ?? "";
    _passwordCtlr.text = passwordValue ?? "";
    _emailCtlr.text = "admin";

    _passwordCtlr.text = "admin";
    super.initState();
  }

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Return String
    setState(() {
      emailValue = prefs.getString('email');
      _emailCtlr.text = prefs.getString('email') ?? "";
      rememberMe = prefs.getBool('checkValue') ?? false;
      passwordValue = prefs.getString('password');
      _passwordCtlr.text = prefs.getString('password') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, authState) {
      // print(authState);
      authState.map(
          initial: (_) {},
          signinSuccess: (state) async {
            // String? loginToken = state.appUser.resultData?.token;
            // final SharedPreferences prefs =
            //     await SharedPreferences.getInstance();
            // prefs.setString('token', loginToken ?? "");

            // String? result = prefs.getString('token');
            // print('signin successsss $result');

            AutoRouter.of(context).replace(HomeRoute());

            BlocProvider.of<GetplayerBloc>(context)
                .add(GetplayerEvent.getplayer());

            //redirect to page
          },
          signinFailed: (state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: ERROR_RED,
                    content: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        state.error,
                        style: TextStyle(
                          color: APP_WHITE,
                        ),
                      ),
                    ),
                    duration: Duration(seconds: 4),
                  ),
                )
                .closed
                .then((_) {
              _isSnackbarVisible = false;
            });
          },
          loggingIn: (state) {},
          signinNew: (stateValue) {});
    }, builder: (context, authState) {
      return Center(
          child: Container(
        width: 320,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: _emailCtlr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: DARK_GREY,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    labelText: 'username',
                  )),
              const SizedBox(height: 16),
              TextField(
                  controller: _passwordCtlr,
                  textAlign: TextAlign.start,
                  obscureText: true,
                  style: TextStyle(
                      color: DARK_GREY,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    labelText: 'Password',
                  )),
              const SizedBox(height: 16),
              _buildLoginButton(context, authState),
              SizedBox(
                height: 50,
                child: Container(
                  //color: PRIMARY_COLOR, // Optional background color for the footer
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "1.2.9",
                      style: TextStyle(fontSize: 16, color: PRIMARY_COLOR),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }

  Widget _buildLoginButton(context, AuthState authState) {
    return authState.maybeMap(loggingIn: (state) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
        onPressed: () {},
        child: Text(
          'Logging in',
          style: TextStyle(color: APP_WHITE),
        ),
      );
    }, orElse: () {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            // color: Theme.of(context).primaryColor,
            onPressed: () {
              if (_isSnackbarVisible) return;
              if (_emailCtlr.text.length > 3 && _passwordCtlr.text.length > 3) {
                print('adding login event');
                context.read<AuthBloc>().add(AuthEvent.login(
                    email: _emailCtlr.text.trim(),
                    password: _passwordCtlr.text.trim()));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Enter valid email and password',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                      ),
                    )
                    .closed
                    .then((_) {
                  _isSnackbarVisible = false;
                });
              }
            },
            child: Text(
              'Login',
              style: TextStyle(color: APP_WHITE),
            ),
          );
        },
      );
    });
  }
}
