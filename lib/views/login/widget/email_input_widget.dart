import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:v15_bloc_pattern/bloc/login_bloc.dart';
// import 'package:v15/bloc/login_bloc/login_bloc.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../utils/validation.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  EmailInputWidget({Key? key, required this.emailFocusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        print('email BUILD');

        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter email';
            }
            if(!Validations.emailValidator(value)){
              return 'Enter is not correct';
            }

            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
