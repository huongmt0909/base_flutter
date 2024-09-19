import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';
part 'account.g.dart';

@JsonSerializable()
class Account implements Serializable {
  final String phoneNumber;

  Account({
    this.phoneNumber = '',
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountToJson(this);
  }
}
