import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:v15_bloc_pattern/bloc/login_bloc.dart';
// import 'package:v15/bloc/login_bloc.dart';
// import 'package:v15/main.dart';
// import 'package:v15/repository/auth/login_repository.dart';

import '../../bloc/login_bloc/login_bloc.dart';
import '../../main.dart';
import 'widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loginBloc = LoginBloc(loginRepository: LoginRepository());
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmailInputWidget(emailFocusNode: emailFocusNode),

              const SizedBox(height: 20),

              PasswordInputWidget(passwordFocusNode: passwordFocusNode),

              const SizedBox(height: 50),

              LoginButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}

//{
//     "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
// }
