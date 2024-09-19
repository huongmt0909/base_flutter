import 'package:flutter/cupertino.dart';

import '../../data/exceptions/exception_validation.dart';
import '../../data/repository/auth_repository.dart';
import '../../shared/widgets/widgets.dart';

class LoginController extends BBSFormController {
  final _repository = AuthRepository();

  final phoneController = TextEditingController();

  Future login() async {
    super.validateForm(() async {
      try {
        await _repository.login(userName: "", password: "");
      } on ExceptionValidation catch (e) {
      } finally {}
    });
  }
}
