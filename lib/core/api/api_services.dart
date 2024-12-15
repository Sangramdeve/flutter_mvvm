import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:mvvm/core/api/base_api.dart';
import 'package:mvvm/core/utils/exception/api_exception.dart';

import 'api_state.dart';

class ApiServices extends BaseApiServices {
  @override
  Future<ApiState> getRequest(String url,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return ApiState.completed(returnResponse(response));
    } on SocketException {
      return ApiState.error('No internet connection');
    } on TimeoutException {
      return ApiState.error('Request timeout');
    } catch (error) {
      return ApiState.error('Unexpected error: $error');
    }
  }

  @override
  Future<ApiState> postRequest(String url, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return ApiState.completed(returnResponse(response));
    } on SocketException {
      return ApiState.error('No internet connection');
    } on TimeoutException {
      return ApiState.error('Request timeout');
    } catch (error) {
      return ApiState.error('Unexpected error: $error');
    }
  }

  @override
  Future<ApiState> putRequest(String url, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return ApiState.completed(returnResponse(response));
    } on SocketException {
      return ApiState.error('No internet connection');
    } on TimeoutException {
      return ApiState.error('Request timeout');
    } catch (error) {
      return ApiState.error('Unexpected error: $error');
    }
  }

  @override
  Future<ApiState> patchRequest(String url, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return ApiState.completed(returnResponse(response));
    } on SocketException {
      return ApiState.error('No internet connection');
    } on TimeoutException {
      return ApiState.error('Request timeout');
    } catch (error) {
      return ApiState.error('Unexpected error: $error');
    }
  }

  @override
  Future<ApiState> deleteRequest(String url,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(Uri.parse(url), headers: headers);
      return ApiState.completed(returnResponse(response));
    } on SocketException {
      return ApiState.error('No internet connection');
    } on TimeoutException {
      return ApiState.error('Request timeout');
    } catch (error) {
      return ApiState.error('Unexpected error: $error');
    }
  }

  @override
  Future<ApiState> multipartRequest(String url, String method,
      {Map<String, String>? headers,
      Map<String, String>? fields,
      List<http.MultipartFile>? files}) async {
    try {
      var request = http.MultipartRequest(method, Uri.parse(url));
      if (headers != null) request.headers.addAll(headers);
      if (fields != null) request.fields.addAll(fields);
      if (files != null) request.files.addAll(files);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return ApiState.completed(returnResponse(response));
    } on SocketException {
      return ApiState.error('No internet connection');
    } on TimeoutException {
      return ApiState.error('Request timeout');
    } catch (error) {
      return ApiState.error('Unexpected error: $error');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 409:
        throw ConflictException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 502:
        throw BadGatewayException(response.body.toString());
      case 503:
        throw ServiceUnavailableException(response.body.toString());
      case 504:
        throw GatewayTimeoutException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server, StatusCode: ${response.statusCode}');
    }
  }
}
