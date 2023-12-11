import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class SessionsState extends Equatable {
  final List<SessionEntity>? sessions;
  final SessionEntity? session;
  final DioException? error;
  final int? sessionRemainPlaces;

  const SessionsState({
    this.sessionRemainPlaces,
    this.session,
    this.error,
    this.sessions,
  });

  @override
  List<Object> get props => [
        error!,
        sessions!,
      ];
}

class SessionsLoading extends SessionsState {
  const SessionsLoading();
}

class SessionsLoaded extends SessionsState {
  const SessionsLoaded(List<SessionEntity> sessions)
      : super(sessions: sessions);
}

class SessionsError extends SessionsState {
  const SessionsError(DioException error) : super(error: error);
}

class SessionLoading extends SessionsState {
  const SessionLoading();
}

class SessionLoaded extends SessionsState {
  const SessionLoaded(SessionEntity session) : super(session: session);
}

class SessionError extends SessionsState {
  const SessionError(DioException error) : super(error: error);
}
