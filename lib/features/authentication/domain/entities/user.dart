import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? emailAddress;
  final String? birthDate;
  final String? role;
  final String? avatarUrl;
  final String? phoneNumber;
  final List<EstablishmentEntity>? establishments;
  final List<ActivityEntity>? activities;
  final String? stripeId;

  const UserEntity({
    this.birthDate,
    this.emailAddress,
    this.role,
    this.firstname,
    this.id,
    this.lastname,
    this.avatarUrl,
    this.phoneNumber,
    this.establishments,
    this.activities,
    this.stripeId,
  });

  @override
  List<Object?> get props {
    return [
      birthDate,
      emailAddress,
      firstname,
      id,
      lastname,
      avatarUrl,
      phoneNumber,
      establishments,
      activities,
      stripeId,
      role,
    ];
  }
}

class UserRequestEntity extends Equatable {
  final String? lastname;
  final String? firstname;
  final String? avatarUrl;
  final String? role;
  final String? emailAddress;
  final String? phoneNumber;
  final String? birthDate;
  final String? stripeId;

  const UserRequestEntity({
    this.avatarUrl,
    this.birthDate,
    this.emailAddress,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.role,
    this.stripeId,
  });

  @override
  List<Object?> get props => [
        lastname,
        firstname,
        avatarUrl,
        role,
        emailAddress,
        phoneNumber,
        birthDate,
        stripeId,
      ];
}

class RefreshTokensEntity extends Equatable {
  final String? accessToken;
  final String? refreshToken;

  const RefreshTokensEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}

class LoginResponseEntity extends Equatable {
  final RefreshTokensEntity? tokens;
  final UserEntity? user;

  const LoginResponseEntity({
    this.tokens,
    this.user,
  });

  @override
  List<Object?> get props => [
        tokens,
        user,
      ];
}

class LoginRequestEntity extends Equatable {
  final String? email;
  final String? password;

  const LoginRequestEntity({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}

class RegisterRequestEntity extends Equatable {
  final String? lastname;
  final String? firstname;
  final String? emailAddress;
  final String? password;

  const RegisterRequestEntity({
    this.emailAddress,
    this.firstname,
    this.lastname,
    this.password,
  });

  @override
  List<Object?> get props => [
    emailAddress,
    firstname,
    lastname,
    password,
  ];
}
