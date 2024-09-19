import 'package:dio/dio.dart';

class ExceptionValidation extends DioException {
  ExceptionValidation(RequestOptions requestOptions) : super(requestOptions: requestOptions);
}
