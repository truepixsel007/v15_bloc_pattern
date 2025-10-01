part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvents {
  EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfoucused extends LoginEvents {}

class PasswordChanged extends LoginEvents {
  PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfoucused extends LoginEvents {}

class LoginApi extends LoginEvents {}
