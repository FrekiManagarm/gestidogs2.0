import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/activity/domain/repositories/activity_repository.dart';

class UpdateActivityUseCaseParameters {
  final String? activityId;
  final ActivityRequestEntity? body;

  UpdateActivityUseCaseParameters({
    this.activityId,
    this.body,
  });
}

class UpdateActivityUseCase
    implements UseCase<DataState<ActivityEntity>, UpdateActivityUseCaseParameters> {
  final ActivityRepository repository;

  UpdateActivityUseCase(this.repository);

  @override
  Future<DataState<ActivityEntity>> call({UpdateActivityUseCaseParameters? params}) {
    return repository.updateActivity(
        params!.body, params.activityId);
  }
}
