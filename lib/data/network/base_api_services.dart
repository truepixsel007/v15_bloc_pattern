abstract class BaseApiServices {
  // method
  Future<dynamic> getApi(String url);

  // method
  Future<dynamic> postApi(String url, var data);

  // method
  Future<dynamic> deleteApi(String url);
}
