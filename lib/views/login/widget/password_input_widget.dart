import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  PasswordInputWidget({Key? key, required this.passwordFocusNode})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current.password != previous.password,
      builder: (context, state) {
        print('Pasword BUILD');

        return TextFormField(
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter Password';
            }
            if(value.length < 6){
              return 'please enter password greater thatn 6 char';
            }
            return null;

          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
