import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';

class GetSessionRemainingPlacesUseCase
    implements UseCase<DataState<int>, String> {
  final SessionRepository sessionRepository;

  GetSessionRemainingPlacesUseCase(this.sessionRepository);

  @override
  Future<DataState<int>> call({String? params}) {
    return sessionRepository.getSessionRemainingPlaces(params);
  }
}
