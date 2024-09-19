import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentType {
  dev(
    baseUrl: 'https://localhost.com',
    isDebugMode: false,
  ),
  prod(
    baseUrl: 'https://localhost.com',
    isDebugMode: false,
  );

  const EnvironmentType({
    required this.baseUrl,
    required this.isDebugMode,
  });

  final String baseUrl;
  final bool isDebugMode;
}

class AppConfig {
  static EnvironmentType? _current;

  static EnvironmentType get buildType => _current!;

  static Future<EnvironmentType> current() async {
    if (_current != null) {
      return _current!;
    }
    final packageInfo = await PackageInfo.fromPlatform();
    if (kIsWeb) {
      String flavor = const String.fromEnvironment("flavor");
      switch (flavor) {
        case "prod":
          _current = EnvironmentType.prod;
          break;
        default:
          _current = EnvironmentType.dev;
      }
      return _current!;
    }

    switch (packageInfo.packageName) {
      case "com.base.project":
        _current = EnvironmentType.prod;
        break;
      default:
        _current = EnvironmentType.dev;
    }
    return _current!;
  }
}
