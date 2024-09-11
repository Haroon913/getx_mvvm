abstract class BaseApiServices{

  Future<dynamic> getApi(String Url);
  Future<dynamic> postApi(var data, String Url);
 }