// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    LoginResponseEntity(
      msg: json['msg'] as String?,
      tokens: LoginResponseTokensEntity.fromJson(
          json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseEntityToJson(
        LoginResponseEntity instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'tokens': instance.tokens.toJson(),
    };

LoginResponseTokensEntity _$LoginResponseTokensEntityFromJson(
        Map<String, dynamic> json) =>
    LoginResponseTokensEntity(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseTokensEntityToJson(
        LoginResponseTokensEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

RegisterEntity _$RegisterEntityFromJson(Map<String, dynamic> json) =>
    RegisterEntity(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      address: json['address'] as String?,
      birthday: json['birthday'] as String?,
      gender: json['gender'] as int?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$RegisterEntityToJson(RegisterEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'phone': instance.phone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'role': instance.role,
    };
