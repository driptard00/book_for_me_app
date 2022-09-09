import 'package:bookforme/routes/api_route_names.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static const _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': _token,
  };

  static Future<Response?> userSignUp(String url, Map<String, dynamic> signUpDetails) async {
    var _fullUrl = "$baseUrl$url";
    print("SERVICETEEST:::::::$_fullUrl\n$signUpDetails");
    try {
      var _response = await Dio().post(
        _fullUrl, 
        data: signUpDetails,
        options: Options(headers: _headers),
      );
      return _response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }


  static Future<Response?> userLogin(String url, Map<String, dynamic> loginDetails) async {
    String _fullUrl = "$baseUrl$url";
    print("SERVICETEEST:::::::$_fullUrl\n$loginDetails");
    try {
      var response = await Dio().post(
        _fullUrl, 
        data: loginDetails,
        options: Options(headers: _headers),
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  static Future<Response?> userUpdate(String url, Map<String, dynamic> updateDetails, String userId) async {
    String _fullUrl = "$baseUrl$url$userId";
    print("SERVICETEEST:::::::$_fullUrl\n$updateDetails");
    try {
      var response = await Dio().put(
        _fullUrl, 
        data: updateDetails,
        options: Options(headers: _headers),
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }
  
}