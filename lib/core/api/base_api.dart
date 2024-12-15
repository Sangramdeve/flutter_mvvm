import 'package:http/http.dart' as http;
import 'package:mvvm/core/api/api_state.dart';

abstract class BaseApiServices {
  Future<ApiState> getRequest(String url, {Map<String, String>? headers});

  Future<ApiState> postRequest(String url, dynamic data,
      {Map<String, String>? headers});

  Future<ApiState> putRequest(String url, dynamic data,
      {Map<String, String>? headers});

  Future<ApiState> patchRequest(String url, dynamic data,
      {Map<String, String>? headers});

  Future<ApiState> deleteRequest(String url, {Map<String, String>? headers});

  Future<ApiState> multipartRequest(String url, String method,
      {Map<String, String>? headers,
      Map<String, String>? fields,
      List<http.MultipartFile>? files});
}
