import 'package:crud/src/constants/urls.dart';
import 'package:crud/src/core/api/dio_interceptors.dart';
import 'package:crud/src/core/api/dio_method.dart';
import 'package:crud/src/models/base/api_response_wrapper.dart';
import 'package:dio/dio.dart';

class CoreApi {
  Dio _dio = Dio();

  /// Connection timeout
  static const Duration connectionTimeOut = Duration(seconds: 20);

  /// Response timeout
  static const Duration receiveTimeOut = Duration(seconds: 20);

  CoreApi() {
    /// Initialize basic options
    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseURL + Urls.mainURL,
      connectTimeout: connectionTimeOut,
      receiveTimeout: receiveTimeOut,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (status) => true,
    );

    /// initialize dio
    _dio = Dio(options);

    /// Add interceptor
    _dio.interceptors.add(DioInterceptors());
    // _dio.interceptors.add(CustomLogInterceptor(
    //   requestHeader: false,
    //   requestBody: false,
    //   responseHeader: false,
    //   responseBody: false,
    // ));
  }

  /// Request method
  Future<ApiResponseWrapper> call<T>(
    String path, {
    required ApiMethod method,
    Map<String, dynamic>? queryParameters,
    body,
  }) async {
    Response response;
    response = await _dio.request(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(method: method.name),
    );
    return response.data;
  }

  Future<ApiResponseWrapper<Map<String, dynamic>?>> callFormData<T>(
    String path, {
    required ApiMethod method,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    response = await _dio.request(
      path,
      data: formData,
      queryParameters: queryParameters,
      options: Options(method: method.name),
    );
    return response.data;
  }

/*Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      return _dio.get(path, queryParameters: params);
    }  on Exception catch (e) {
      if (e is SocketException) {
        print('SocketException');
        throw ApiError(message: 'عدم دسترسی به سرور');
      } else if (e is DioException) {
        throw ApiError(message: e.message ?? 'error', code: e.response?.statusCode ?? 400);
      }

      throw ApiError(message: 'خطا در اتصال به سرور');
    }
  }

  Future<ApiResponse<dynamic>> post(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  }) async {
    try {
      return (await _dio.post(path, data: body, queryParameters: params)).data;
    } on Exception catch (e) {
      if (e is SocketException) {
        print('SocketException');
        throw ApiError(message: 'عدم دسترسی به سرور');
      } else if (e is DioException) {
        throw ApiError(message: e.message ?? 'error', code: e.response?.statusCode ?? 400);
      }

      throw ApiError(message: 'خطا در اتصال به سرور');
    }
  }

  Future put(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      return _dio.put(url.toString(), data: body);
    } catch (e) {
      catchExceptions(e as Exception);
    }
  }

  Future patch(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      return _dio.patch(url.toString(), data: body);
    } catch (e) {
      catchExceptions(e as Exception);
    }
  }

  Future delete(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      return _dio.delete(url.toString(), data: body);
    } catch (e) {
      catchExceptions(e as Exception);
    }
  }*/

/*  void catchExceptions(Exception exception) {
    print('catchException');
    if (exception is SocketException) {
      print('SocketException');
      throw ApiError(message: 'عدم دسترسی به سرور');
    } else if (exception is DioException) {
      throw ApiError(message: exception.message ?? 'error', code: exception.response?.statusCode ?? 400);
    }

    throw ApiError(message: 'خطا در اتصال به سرور');
  }*/
}
