import 'package:base_flutter/shared/widgets/utils/utils.dart';
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
        BBSDialogLoading.showLoading(context);
        await _repository.login(userName: "", password: "");
      } on ExceptionValidation catch (e) {
        ToastCustom.error(context, e.message);
      } finally {
        BBSDialogLoading.hideLoading(context);
      }
    });
  }
}
