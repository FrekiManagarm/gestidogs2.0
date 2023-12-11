import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';

class PostSessionReportUseCaseParamaters {
  final String? report;
  final String? sessionId;

  PostSessionReportUseCaseParamaters({
    this.report,
    this.sessionId,
  });
}

class PostSessionReportUseCase
    implements UseCase<DataState<SessionEntity>, PostSessionReportUseCaseParamaters> {
  final SessionRepository sessionRepository;

  PostSessionReportUseCase(this.sessionRepository);

  @override
  Future<DataState<SessionEntity>> call(
      {PostSessionReportUseCaseParamaters? params}) {
    return sessionRepository.postSessionReport(params!.report, params.sessionId);
  }
}
