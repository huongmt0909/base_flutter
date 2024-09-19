import 'package:flutter/material.dart';
import '../../shared/widgets/widgets.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BBSScaffold<LoginController>(
      controller: LoginController(),
      builder: (controller) {
        return Column();
      },
    );
  }
}
