part of 'utils.dart';

class ToastCustom {
  ToastCustom._();

  static void showToastMessage(String content) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
    );
  }

  static Future error(BuildContext context, String? msg) async {
    final toast = FToast().init(context);
    await toast.removeCustomToast();

    if (msg == null) return;

    return toast.showToast(
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
