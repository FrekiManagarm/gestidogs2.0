import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getUsers({
    String? establishmentId,
    String? role,
  });

  Future<DataState<UserEntity>> getUserConnected();

  Future<DataState<LoginResponseEntity>> login({
    LoginRequestEntity? body,
  });

  Future<DataState<LoginResponseEntity>> register({
    RegisterRequestEntity? body,
  });

  Future<DataState<RefreshTokensEntity>> refreshToken({
    String? refreshToken,
  });

  Future<DataState<List<UserEntity>>> getClientsOfEstablishment({
    String? establishmentId,
  });

  Future<DataState<bool>> logOut();
}
