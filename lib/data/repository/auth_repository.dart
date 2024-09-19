import 'package:base_flutter/data/models/account.dart';

import '../main_api.dart';

class AuthRepository {
  MainApi api = MainApi();

  Future login({required String userName, required String password}) async {
    final response = await api
        .post("/login", data: {"user_name": userName, "password": password});
    return Account.fromJson(response.data["data"]);
  }
}
