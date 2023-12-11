import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/activity/domain/repositories/activity_repository.dart';

class GetActivitiesUseCase
    implements
        UseCase<DataState<List<ActivityEntity>>, String> {
  final ActivityRepository repository;

  GetActivitiesUseCase(this.repository);

  @override
  Future<DataState<List<ActivityEntity>>> call(
      {String? params}) {
    return repository.getActivities(
        params);
  }
}
