import 'package:clean_architecture_project/features/activity/data/models/activity.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends UserEntity {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? avatarUrl;
  final String? role;
  final String? emailAddress;
  final String? phoneNumber;
  final String? birthDate;
  final List<Establishment>? establishments;
  final List<Activity>? activities;
  final String? stripeId;

  const User(
      {this.id,
      this.activities,
      this.avatarUrl,
      this.birthDate,
      this.emailAddress,
      this.establishments,
      this.firstname,
      this.lastname,
      this.phoneNumber,
      this.role,
      this.stripeId})
      : super(
          avatarUrl: avatarUrl,
          birthDate: birthDate,
          emailAddress: emailAddress,
          firstname: firstname,
          id: id,
          lastname: lastname,
          phoneNumber: phoneNumber,
          activities: activities,
          establishments: establishments,
          stripeId: stripeId,
          role: role,
        );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromEntity(UserEntity entity) {
    return User(
      activities:
          entity.activities!.map((e) => Activity.fromEntity(e)).toList(),
      avatarUrl: entity.avatarUrl,
      birthDate: entity.birthDate,
      emailAddress: entity.emailAddress,
      establishments: entity.establishments!
          .map((e) => Establishment.fromEntity(e))
          .toList(),
      firstname: entity.firstname,
      id: entity.id,
      role: entity.role,
      lastname: entity.lastname,
      phoneNumber: entity.phoneNumber,
      stripeId: entity.stripeId,
    );
  }
}

@JsonSerializable()
class UserRequest extends UserRequestEntity {
  final String? lastname;
  final String? firstname;
  final String? avatarUrl;
  final String? role;
  final String? emailAddress;
  final String? phoneNumber;
  final String? birthDate;
  final String? stripeId;

  const UserRequest({
    this.avatarUrl,
    this.birthDate,
    this.emailAddress,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.role,
    this.stripeId,
  }) : super(
          avatarUrl: avatarUrl,
          birthDate: birthDate,
          emailAddress: emailAddress,
          firstname: firstname,
          lastname: lastname,
          phoneNumber: phoneNumber,
          role: role,
          stripeId: stripeId,
        );

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  factory UserRequest.fromEntity(UserRequestEntity entity) {
    return UserRequest(
      avatarUrl: entity.avatarUrl,
      birthDate: entity.birthDate,
      emailAddress: entity.emailAddress,
      firstname: entity.firstname,
      lastname: entity.lastname,
      phoneNumber: entity.phoneNumber,
      role: entity.role,
      stripeId: entity.stripeId,
    );
  }
}

@JsonSerializable()
class RefreshTokensModel extends RefreshTokensEntity {
  final String? accessToken;
  final String? refreshToken;

  const RefreshTokensModel({
    this.accessToken,
    this.refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory RefreshTokensModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokensModelFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokensModelToJson(this);

  factory RefreshTokensModel.fromEntity(RefreshTokensEntity entity) {
    return RefreshTokensModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }
}

@JsonSerializable()
class LoginResponse extends LoginResponseEntity {
  final RefreshTokensModel? tokens;
  final User? user;

  const LoginResponse({
    this.tokens,
    this.user,
  }) : super(
          tokens: tokens,
          user: user,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromEntity(LoginResponseEntity entity) {
    return LoginResponse(
      tokens: RefreshTokensModel.fromEntity(entity.tokens!),
      user: User.fromEntity(entity.user!),
    );
  }
}

@JsonSerializable()
class LoginRequest extends LoginRequestEntity {
  final String? email;
  final String? password;

  const LoginRequest({
    this.email,
    this.password,
  }) : super(
          email: email,
          password: password,
        );

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  factory LoginRequest.fromEntity(LoginRequestEntity entity) {
    return LoginRequest(
      email: entity.email,
      password: entity.password,
    );
  }
}

@JsonSerializable()
class RegisterRequest extends RegisterRequestEntity {
  final String? lastname;
  final String? firstname;
  final String? emailAddress;
  final String? password;

  const RegisterRequest({
    this.emailAddress,
    this.firstname,
    this.lastname,
    this.password,
  }) : super(
          emailAddress: emailAddress,
          firstname: firstname,
          lastname: lastname,
          password: password,
        );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  factory RegisterRequest.fromEntity(RegisterRequestEntity entity) {
    return RegisterRequest(
      emailAddress: entity.emailAddress,
      firstname: entity.firstname,
      lastname: entity.lastname,
      password: entity.password,
    );
  }
}
