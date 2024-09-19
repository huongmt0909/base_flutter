import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/app_config.dart';
import 'exceptions/exception_401.dart';
import 'exceptions/exception_connect_error.dart';
import 'exceptions/exception_network.dart';
import 'exceptions/exception_validation.dart';

class Api {
  late final Dio dio;
  String baseUrl = "";
  bool isDebugMode = AppConfig.buildType.isDebugMode;
  int requestTime = 60;

  init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: requestTime),
        receiveTimeout: Duration(seconds: requestTime),
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            //Handle network not connected
            final ConnectivityResult connectivityResult =
                await Connectivity().checkConnectivity();
            if (connectivityResult == ConnectivityResult.none) {
              return handler.reject(ExceptionNetwork(options));
            }

            //Handle request headers
            Map<String, dynamic> headerContent = getHeaderContent();
            options.headers = headerContent;
            return handler.next(options);
          },
          onError: (e, handler) {
            final statusCode = e.response?.statusCode;
            if (statusCode == 400) {
              return handler.reject(
                ExceptionValidation(e.requestOptions),
              );
            }
            if (statusCode == 401) {
              return handler.reject(
                Exception401(e.requestOptions),
              );
            }
            //TODO: handle exceptions....
            return handler.reject(
              ExceptionConnectError(e.requestOptions),
            );
          },
        ),
      );
    if (isDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  getHeaderContent() {
    return {};
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(
      path,
      data: data,
    );
  }

  Future<Response> patch(String path, {dynamic data}) async {
    return await dio.patch(
      path,
      data: data,
    );
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await dio.put(
      path,
      data: data,
    );
  }

  Future<Response> delete(String path) async {
    return await dio.delete(
      path,
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? param}) async {
    return await dio.get(
      path,
      queryParameters: param,
    );
  }
}
