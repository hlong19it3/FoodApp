// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthEntity _$UserAuthEntityFromJson(Map<String, dynamic> json) =>
    UserAuthEntity(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserAuthEntityToJson(UserAuthEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    LoginResponseEntity(
      msg: json['msg'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseEntityToJson(
        LoginResponseEntity instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
