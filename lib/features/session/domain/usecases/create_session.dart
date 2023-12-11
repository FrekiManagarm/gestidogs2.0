import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';

class CreateSessionUseCase implements UseCase<DataState<SessionEntity>, SessionRequestEntity> {
  final SessionRepository sessionRepository;

  CreateSessionUseCase(this.sessionRepository);

  @override
  Future<DataState<SessionEntity>> call({SessionRequestEntity? params}) {
    return sessionRepository.createSession(params!);
  }
}
