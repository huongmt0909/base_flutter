import '../config/app_config.dart';
import 'api_client.dart';

class MainApi extends Api {
  MainApi() {
    baseUrl = AppConfig.buildType.baseUrl;
    super.init();
  }

  @override
  getHeaderContent() {
    return {
      'Accept': 'application/json',
      'Authorization': 'Authorization',
    };
  }
}
