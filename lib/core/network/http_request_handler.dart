import 'package:arman_amin/core/network/error_handler.dart';
import 'package:dio/dio.dart';

class HttpRequestHanlder {
  static Future<(dynamic data, ErrorHandler? errorMessage)> get(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(),
      );

      final response = await Dio().get(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorHandler(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorHandler? errorMessage)> post(
    String path, {
    Map<String, dynamic>? parameters,
    dynamic data,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(),
      );

      final response = await Dio().post(
        path,
        queryParameters: parameters ?? {},
        data: data,
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorHandler(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorHandler? errorMessage)> put(
    String path, {
    Map<String, dynamic>? parameters,
    dynamic data,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(),
      );

      final response = await Dio().put(
        path,
        queryParameters: parameters ?? {},
        data: data,
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorHandler(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorHandler? errorMessage)> patch(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(),
      );

      final response = await Dio().patch(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorHandler(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorHandler? errorMessage)>
      delete(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(),
      );

      final response = await Dio().delete(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorHandler(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Map<String, dynamic>? _header() {
    return {
      'Content-Type': 'application/json',
    };
  }
}
