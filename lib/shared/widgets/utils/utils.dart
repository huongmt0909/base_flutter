import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../routes/app_routes.dart';

part 'toast.dart';
part 'navigators.dart';

void unFocus() => FocusManager.instance.primaryFocus?.unfocus();
final GlobalKey<NavigatorState> globalKey = GlobalKey();
