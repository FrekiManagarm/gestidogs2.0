import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';

class UpdateSessionUseCaseParameters {
  final String? sessionId;
  final SessionRequestEntity? request;

  UpdateSessionUseCaseParameters({
    this.request,
    this.sessionId,
  });
}

class UpdateSessionUseCase
    implements
        UseCase<DataState<SessionEntity>, UpdateSessionUseCaseParameters> {
  final SessionRepository sessionRepository;

  UpdateSessionUseCase(this.sessionRepository);

  @override
  Future<DataState<SessionEntity>> call(
      {UpdateSessionUseCaseParameters? params}) {
    return sessionRepository.updateSession(params!.sessionId, params.request!);
  }
}
