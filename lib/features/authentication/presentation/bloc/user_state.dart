import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:dio/dio.dart';

abstract class UserState {
  final UserEntity? user;
  final List<UserEntity>? users;
  final List<UserEntity>? clients;
  final DioException? error;

  const UserState({
    this.error,
    this.clients,
    this.user,
    this.users,
  });
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoaded extends UserState {
  const UserLoaded(UserEntity user) : super(user: user);
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserError extends UserState {
  const UserError(DioException error) : super(error: error);
}

class UsersLoaded extends UserState {
  const UsersLoaded(List<UserEntity> users) : super(users: users);
}

class UsersLoading extends UserState {
  const UsersLoading();
}

class UsersError extends UserState {
  const UsersError(DioException error) : super(error: error);
}

class ClientsLoading extends UserState {
  const ClientsLoading();
}

class ClientsLoaded extends UserState {
  const ClientsLoaded(List<UserEntity> clients) : super(clients: clients);
}

class ClientsError extends UserState {
  const ClientsError(DioException error) : super(error: error);
}
