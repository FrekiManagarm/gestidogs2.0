import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/authentication/data/datasources/remote_user_datasource.dart';
import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;

  const UserRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<User>>> getClientsOfEstablishment(
      {String? establishmentId}) async {
    try {
      final response = await apiService.getClientsOfEstablishment(
        accept: "application/json",
        establishmentId: establishmentId,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<User>> getUserConnected() async {
    try {
      final response = await apiService.getUserConnected();

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<User>>> getUsers(
      {String? establishmentId, String? role}) async {
    try {
      final response = await apiService.getUsers(
        accept: "application/json",
        establishmentId: establishmentId,
        role: role,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<bool>> logOut() async {
    try {
      final response = await apiService.logOut();

      if (response.response.statusCode == 204) {
        return const DataSuccess(true);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<LoginResponse>> login({LoginRequestEntity? body}) async {
    try {
      final response = await apiService.login(
        accept: "application/json",
        contentType: "application/json",
        body: LoginRequest.fromEntity(body!),
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<RefreshTokensModel>> refreshToken(
      {String? refreshToken}) async {
    try {
      final response = await apiService.refreshToken(
        accept: "application/json",
        refreshToken: refreshToken,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<LoginResponse>> register(
      {RegisterRequestEntity? body}) async {
    try {
      final response = await apiService.register(
        accept: "application/json",
        contentType: "application/json",
        body: RegisterRequest.fromEntity(body!),
      );

      if (response.response.statusCode == 201) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
