import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:v15_bloc_pattern/repository/auth/login_repository.dart';
// import 'package:v15_bloc_pattern/utils/enum.dart';
import '../../repository/auth/login_repository.dart';
import '../../services/session_manager/session_controller.dart';
import '../../utils/enum.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {

  // LoginRepository loginRepository = LoginRepository();
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_EmailChanged);
    on<PasswordChanged>(_PasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _EmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _PasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.password));
  }


  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {

    Map data = {
      'email' : state.email,
      'password' : state.password
    };

    // Map data = {
    //   'email' : "eve.holt@reqres.in",
    //   'password' : "cityslicka"
    // };

    emit(state.copyWith(
        postApiStatus: PostApiStatus.loading
    ));

    await loginRepository.loginApi(data).then((value) async{
       if(value.error.isNotEmpty){

         emit(state.copyWith(
             message : value.error.toString(),postApiStatus: PostApiStatus.error
         ));

       } else{

         await SessionController().saveUserInPreference(value);
         await SessionController().getUserFromPreference();

         emit(state.copyWith(
             // message: value.token,
             message : 'Login Succesfully',
             postApiStatus: PostApiStatus.success
         ));

       }
    }).onError((error, stackTrace){
      emit(state.copyWith(
          message : error.toString(), postApiStatus: PostApiStatus.error
      ));
    });

  }

}
