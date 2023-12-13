import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';

class CreateDogUseCase
    implements UseCase<DataState<DogEntity>, DogRequestEntity> {
  final DogRepository repository;

  CreateDogUseCase(this.repository);

  @override
  Future<DataState<DogEntity>> call({DogRequestEntity? params}) {
    return repository.createDog(
        params);
  }
}
