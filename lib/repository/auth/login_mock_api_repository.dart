import 'package:v15_bloc_pattern/data/network/network_api_service.dart';
// import 'package:v15/data/network/network_api_service.dart';
import '../../config/app_url.dart';
import '../../model/user/user_model.dart';
import 'login_repository.dart';

class LoginMockApiRepository implements LoginRepository{

  final _api = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async{
    // final response = await _api.postApi(AppUrl.loginEndPint, data);
    await Future.delayed(Duration(seconds: 2));
    final response = {
      'token' : 'afdfdfkdfkjdfkj'
    };
    return UserModel.fromJson(response);
  }



}