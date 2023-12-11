import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';

class GetDailySessionUseCaseParameters {
  final String? dogId;
  final String? date;
  final String? establishmentId;

  GetDailySessionUseCaseParameters({
    this.dogId,
    this.date,
    this.establishmentId,
  });
}

class GetDailySessionsUseCase
    implements
        UseCase<DataState<List<SessionEntity>>,
            GetDailySessionUseCaseParameters> {
  final SessionRepository sessionRepository;

  GetDailySessionsUseCase(this.sessionRepository);

  @override
  Future<DataState<List<SessionEntity>>> call(
      {GetDailySessionUseCaseParameters? params}) {
    return sessionRepository.getDailySessions(
      params!.dogId,
      params.date,
      params.establishmentId,
    );
  }
}
