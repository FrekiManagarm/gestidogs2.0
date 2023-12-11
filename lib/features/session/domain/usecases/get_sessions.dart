import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';

class GetSessionUseCaseParameters {
  final String? activityId;
  final String? begin;
  final String? educatorId;
  final String? end;
  final String? establishmentId;
  final bool? reserved;

  GetSessionUseCaseParameters({
    this.activityId,
    this.begin,
    this.educatorId,
    this.end,
    this.establishmentId,
    this.reserved,
  });
}

class GetSessionsUseCase
    implements
        UseCase<DataState<List<SessionEntity>>, GetSessionUseCaseParameters> {
  final SessionRepository sessionRepository;

  GetSessionsUseCase(this.sessionRepository);

  @override
  Future<DataState<List<SessionEntity>>> call(
      {GetSessionUseCaseParameters? params}) {
    return sessionRepository.getSessions(
      params!.activityId,
      params.begin,
      params.educatorId,
      params.end,
      params.establishmentId,
      params.reserved,
    );
  }
}
