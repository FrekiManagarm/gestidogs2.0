// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatarUrl: json['avatarUrl'] as String?,
      birthDate: json['birthDate'] as String?,
      emailAddress: json['emailAddress'] as String?,
      establishments: (json['establishments'] as List<dynamic>?)
          ?.map((e) => Establishment.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      role: json['role'] as String?,
      stripeId: json['stripeId'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'avatarUrl': instance.avatarUrl,
      'role': instance.role,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'birthDate': instance.birthDate,
      'establishments': instance.establishments,
      'activities': instance.activities,
      'stripeId': instance.stripeId,
    };

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      avatarUrl: json['avatarUrl'] as String?,
      birthDate: json['birthDate'] as String?,
      emailAddress: json['emailAddress'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      role: json['role'] as String?,
      stripeId: json['stripeId'] as String?,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'avatarUrl': instance.avatarUrl,
      'role': instance.role,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'birthDate': instance.birthDate,
      'stripeId': instance.stripeId,
    };

RefreshTokensModel _$RefreshTokensModelFromJson(Map<String, dynamic> json) =>
    RefreshTokensModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshTokensModelToJson(RefreshTokensModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      tokens: json['tokens'] == null
          ? null
          : RefreshTokensModel.fromJson(json['tokens'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
      'user': instance.user,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      emailAddress: json['emailAddress'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
    };
