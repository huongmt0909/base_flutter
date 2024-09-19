part of 'utils.dart';

class Navigators {
  Navigators._();

  static Future push(
    BuildContext context,
    String path, {
    bool replace = false,
    Object? arguments,
    Function(dynamic result)? onResult,
  }) async {
    unFocus();
    final result = await AppRoutes.router.navigateTo(
      context,
      path,
      clearStack: replace,
      transition: TransitionType.cupertino,
      routeSettings: RouteSettings(arguments: arguments),
    );
    if (result != null) onResult?.call(result);
    return result;
  }

  static void pop<T>(BuildContext context, [T? result]) {
    unFocus();
    return AppRoutes.router.pop(context, result);
  }

  static Future showBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool scrollController = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: scrollController,
      builder: builder,
    );
  }
}
