import 'package:v15_bloc_pattern/data/network/network_api_service.dart';
// import 'package:v15/data/network/network_api_service.dart';
import '../../config/app_url.dart';
import '../../model/user/user_model.dart';

abstract class LoginRepository {
  @override
 Future<UserModel> loginApi(dynamic data);
}