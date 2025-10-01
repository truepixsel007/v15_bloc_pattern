import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:v15_bloc_pattern/utils/enum.dart';
// import 'package:v15/utils/enum.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../config/routes/routes_name.dart';
import '../../../utils/enum.dart';
import '../../../utils/flush_bar_helper.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state){
      if(state.postApiStatus == PostApiStatus.error){
        FlushBarHelper.flushBarErrorMessage(state.message.toString(), context);

        // ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(
        //       SnackBar(content: Text(state.message.toString())),
        //     );
      }

      if(state.postApiStatus == PostApiStatus.success){

        Navigator.pushNamed(context, RoutesName.homeScreen);

        // FlushBarHelper.flushBarSuccessMessage('Login Successfully', context);

        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(
        //     SnackBar(content: Text(state.message.toString())),
        //   );
      }

    },
    child: BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      builder: (context, state) {
        print('email BUILD');

        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(LoginApi());
            }
          },
          child: state.postApiStatus == PostApiStatus.loading ? CircularProgressIndicator() : Text('Login'),
        );
      },
    ),
    );
  }
}
