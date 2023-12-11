import 'package:clean_architecture_project/features/session/domain/entities/session.dart';

abstract class SessionsEvent {
  const SessionsEvent();
}

class GetSessionsEvent extends SessionsEvent {
  final String? activityId;
  final String? begin;
  final String? educatorId;
  final String? end;
  final String? establishmentId;
  final bool? reserved;

  const GetSessionsEvent({
    this.activityId,
    this.begin,
    this.educatorId,
    this.end,
    this.establishmentId,
    this.reserved,
  });
}

class CreateSessionEvent extends SessionsEvent {
  final SessionRequestEntity? body;

  const CreateSessionEvent({
    this.body,
  });
}

class GetSessionByIdEvent extends SessionsEvent {
  final String? sessionId;

  const GetSessionByIdEvent({
    this.sessionId,
  });
}

class GetDailySessionsEvent extends SessionsEvent {
  final String? dogId;
  final String? date;
  final String? establishmentId;

  const GetDailySessionsEvent({
    this.date,
    this.dogId,
    this.establishmentId,
  });
}

class GetSessionsRemainingPlacesEvent extends SessionsEvent {
  final String? sessionId;

  const GetSessionsRemainingPlacesEvent({
    this.sessionId,
  });
}

class CreateSessionReportEvent extends SessionsEvent {
  final String? report;
  final String? sessionId;

  const CreateSessionReportEvent({
    this.report,
    this.sessionId,
  });
}

class UpdateSessionEvent extends SessionsEvent {
  final SessionRequestEntity? body;
  final String? sessionId;

  const UpdateSessionEvent({
    this.body,
    this.sessionId,
  });
}
