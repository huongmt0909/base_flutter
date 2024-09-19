class BaseResponse<T extends Serializable> {
  int code;
  String msg;
  String? errorMsg;
  T? data;

  BaseResponse(
      {required this.code,
      required this.msg,
      required this.errorMsg,
      this.data});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) data) {
    return BaseResponse<T>(
      code: json["code"],
      msg: json["msg"],
      errorMsg: json["error_messages"] as String?,
      data: json["data"] == null ? null : data(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "error_messages": errorMsg,
        "data": data?.toJson(),
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
