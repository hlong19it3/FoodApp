import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable()
class LoginEntity {
  String email;
  String password;
  LoginEntity({
    required this.email,
    required this.password,
  });
  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginResponseEntity {
  String? msg;
  LoginResponseTokensEntity tokens;
  LoginResponseEntity({
    this.msg,
    required this.tokens,
  });
  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}

@JsonSerializable()
class LoginResponseTokensEntity {
  String? accessToken;
  String? refreshToken;
  LoginResponseTokensEntity({
    this.accessToken,
    this.refreshToken,
  });
  factory LoginResponseTokensEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseTokensEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseTokensEntityToJson(this);
}

@JsonSerializable()
class RegisterEntity {
  String? email;
  String? firstName;
  String? lastName;
  String? address;
  String? birthday;
  int? gender;
  String? phone;
  String? password;
  String? confirmPassword;
  int? role;
  RegisterEntity({
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.birthday,
    this.gender,
    this.phone,
    this.password,
    this.confirmPassword,
    this.role,
  });
  factory RegisterEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterEntityToJson(this);
}

@JsonSerializable()
class CurrentUserEntity {
  String? lastName;
  String? email;
  String? avatar;
  CurrentUserEntity({
    this.lastName,
    this.email,
    this.avatar,
  });

  factory CurrentUserEntity.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserEntityFromJson(json);
}
