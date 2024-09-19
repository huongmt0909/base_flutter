import 'package:dio/dio.dart';

class ExceptionNetwork extends DioException {
  ExceptionNetwork(RequestOptions requestOptions) : super(requestOptions: requestOptions);
}
