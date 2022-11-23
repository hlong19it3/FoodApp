import 'package:json_annotation/json_annotation.dart';

part './user.entity.g.dart';

@JsonSerializable()
class UserAuthEntity {
  String email;
  String password;
  UserAuthEntity({
    required this.email,
    required this.password,
  });
  factory UserAuthEntity.fromJson(Map<String, dynamic> json) =>
      _$UserAuthEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthEntityToJson(this);
}

// @JsonSerializable()
// class UserRegisterEntity {
//   String email;
//   String password;
//   UserAuthEntity({
//     required this.email,
//     required this.password,
//   });
//   factory UserAuthEntity.fromJson(Map<String, dynamic> json) =>
//       _$UserAuthEntityFromJson(json);

//   Map<String, dynamic> toJson() => _$UserAuthEntityToJson(this);
// }

@JsonSerializable()
class LoginResponseEntity {
  String? msg;
  String? accessToken;
  String? refreshToken;
  LoginResponseEntity({
    this.msg,
    this.accessToken,
    this.refreshToken,
  });
  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}
