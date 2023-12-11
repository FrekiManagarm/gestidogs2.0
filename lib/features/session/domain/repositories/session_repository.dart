import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';

abstract class SessionRepository {
  Future<DataState<List<SessionEntity>>> getSessions(
    String? activityId,
    String? begin,
    String? educatorId,
    String? end,
    String? establishmentId,
    bool? reserved,
  );

  Future<DataState<List<SessionEntity>>> getDailySessions(
      String? dogId, String? date, String? establishmentId);

  Future<DataState<SessionEntity>> getSessionById(String? sessionId);

  Future<DataState<int>> getSessionRemainingPlaces(String? sessionId);

  Future<DataState<SessionEntity>> createSession(SessionRequestEntity request);

  Future<DataState<SessionEntity>> postSessionReport(
      String? report, String? sessionId);

  Future<DataState<SessionEntity>> updateSession(
      String? sessionId, SessionRequestEntity request);
}
