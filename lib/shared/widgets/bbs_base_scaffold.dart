part of 'widgets.dart';

class BBSScaffold<T extends BBSBaseController> extends StatefulWidget {
  final T? controller;
  final Function(T controller)? initState;
  final PreferredSizeWidget? appBar;
  final EdgeInsets? padding;
  final bool safeArea;
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Color? background;
  final Future<bool> Function()? onWillPop;
  final Widget Function(T controller)? builder;
  final Widget Function(BuildContext context, T controller)? builderWithContext;
  final Widget? child;

  const BBSScaffold({
    super.key,
    this.controller,
    this.initState,
    this.appBar,
    this.padding,
    this.safeArea = true,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.background,
    this.onWillPop,
    this.builder,
    this.builderWithContext,
    this.child,
  }) : assert(!(builder != null && (controller == null)),
            'Provider controller can not be null');

  @override
  State<BBSScaffold> createState() => _BBSScaffoldState<T>();
}

class _BBSScaffoldState<T extends BBSBaseController>
    extends State<BBSScaffold<T>> {
  bool noNetwork = true;

  @override
  void initState() {
    if (widget.initState != null && widget.controller != null) {
      Future.delayed(Duration.zero, () async {
        widget.initState!(widget.controller!);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop,
      child: Scaffold(
        appBar: widget.appBar,
        backgroundColor: widget.background,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        extendBody: true,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        body: SafeArea(
          top: widget.safeArea,
          bottom: widget.safeArea,
          minimum: widget.padding ?? EdgeInsets.zero,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: widget.controller == null
                ? widget.child
                : ChangeNotifierProvider<T>(
                    create: (context) => widget.controller!..context = context,
                    builder: (context, child) => Consumer<T>(
                      builder: (context, controller, _) {
                        return widget.builderWithContext
                                ?.call(context, controller) ??
                            widget.builder!(controller);
                      },
                    ),
                  ),
          ),
        ),
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }

  Widget buildNoNetwork() {
    return const Scaffold(
      body: Center(),
    );
  }
}
