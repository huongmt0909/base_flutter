part of 'widgets.dart';

class BBSDialogLoading {
  BBSDialogLoading._();

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: 'loading'),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Align(
            child: Text("loading..."),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    return Navigator.of(context).popUntil(
      (route) => route.settings.name != 'loading',
    );
  }
}
