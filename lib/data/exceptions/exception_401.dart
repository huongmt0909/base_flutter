import 'package:dio/dio.dart';

class Exception401 extends DioException {
  Exception401(RequestOptions requestOptions) : super(requestOptions: requestOptions);
}
