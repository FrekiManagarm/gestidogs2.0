import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/session/data/datasources/remote_session_datasource.dart';
import 'package:clean_architecture_project/features/session/data/models/session.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';
import 'package:dio/dio.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionApiService apiService;

  SessionRepositoryImpl({required this.apiService});

  @override
  Future<DataState<Session>> createSession(SessionRequestEntity request) async {
    try {
      var response = await apiService.createSession(
        body: SessionRequest.fromEntity(request),
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
  Future<DataState<List<Session>>> getDailySessions(
      String? dogId, String? date, String? establishmentId) async {
    try {
      var response = await apiService.getDailySessions(
        date: date,
        dogId: dogId,
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
  Future<DataState<Session>> getSessionById(String? sessionId) async {
    try {
      var response = await apiService.getSessionById(sessionId: sessionId);

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
  Future<DataState<int>> getSessionRemainingPlaces(String? sessionId) async {
    try {
      var response =
          await apiService.getSessionRemainingPlaces(sessionId: sessionId);

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
  Future<DataState<Session>> postSessionReport(
      String? report, String? sessionId) async {
    try {
      var response = await apiService.postSessionReport(
        report: report,
        sessionId: sessionId,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
              requestOptions: response.response.requestOptions,
              error: response.response.statusMessage,
              response: response.response,
              type: DioExceptionType.badResponse),
        );
      }
    } on DioException catch (e) {
      throw DataFailed(e);
    }
  }

  @override
  Future<DataState<Session>> updateSession(
      String? sessionId, SessionRequestEntity request) async {
    try {
      var response =
          await apiService.updateSession(body: SessionRequest.fromEntity(request), sessionId: sessionId);

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
  Future<DataState<List<Session>>> getSessions(
    String? activityId,
    String? begin,
    String? educatorId,
    String? end,
    String? establishmentId,
    bool? reserved,
  ) async {
    try {
      final httpResponse = await apiService.getSessions(
        activityId: activityId,
        begin: begin,
        educatorId: educatorId,
        end: end,
        establishmentId: establishmentId,
        reserved: reserved,
      );

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
