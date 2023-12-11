import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/activity/domain/repositories/activity_repository.dart';

class GetActivityByIdUseCase
    implements UseCase<DataState<ActivityEntity>, String> {
  final ActivityRepository repository;

  GetActivityByIdUseCase(this.repository);

  @override
  Future<DataState<ActivityEntity>> call({String? params}) {
    return repository.getActivityById(
        params);
  }
}
