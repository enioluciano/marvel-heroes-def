import 'package:dio/dio.dart';
import 'package:project_test/app/core/helpers/environments.dart';
import 'package:project_test/app/core/rest_client/rest_client.dart';
import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
import 'package:project_test/app/core/rest_client/rest_client_response.dart';

class DioRestClient implements RestClient {
  late Dio _dio;
  final _options = BaseOptions(
    baseUrl: Environments.param('base_url') ?? '',
    connectTimeout:
        int.parse(Environments.param('rest_connection_timeout') ?? '0'),
    receiveTimeout:
        int.parse(Environments.param('rest_receiver_timeout') ?? '0'),
  );

  DioRestClient({BaseOptions? options}) {
    _dio = Dio(options ?? _options);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          error: e.error,
          response: _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          error: e.error,
          response: _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          error: e.error,
          response: _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          error: e.error,
          response: _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          error: e.error,
          response: _dioErrorConverter(e.response));
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {data,
      required String method,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers, method: method));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          error: e.error,
          response: _dioErrorConverter(e.response));
    }
  }

  RestClientResponse<T> _dioErrorConverter<T>(Response? response) {
    return RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage);
  }
}
