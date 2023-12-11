import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/activity/domain/repositories/activity_repository.dart';

class CreateActivityUseCase
    implements UseCase<DataState<ActivityEntity>, ActivityRequestEntity> {
  final ActivityRepository repository;

  CreateActivityUseCase(this.repository);

  @override
  Future<DataState<ActivityEntity>> call({ActivityRequestEntity? params}) {
    return repository.createActivity(
        params);
  }
}
