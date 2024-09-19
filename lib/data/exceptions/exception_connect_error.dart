import 'package:dio/dio.dart';

class ExceptionConnectError extends DioException {
  ExceptionConnectError(RequestOptions requestOptions) : super(requestOptions: requestOptions);
}
