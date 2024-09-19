part of 'widgets.dart';

class BBSFormController extends BBSBaseController {
  final formKey = GlobalKey<FormState>();

  validateForm(
    Function() callback,
  ) async {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      callback();
    } else {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
