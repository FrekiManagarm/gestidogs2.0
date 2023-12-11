import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';

class CreateDogUseCaseParameters {
  final String? accept;
  final String? authorization;
  final DogRequestEntity? body;

  CreateDogUseCaseParameters({
    this.accept,
    this.authorization,
    this.body,
  });
}

class CreateDogUseCase
    implements UseCase<DataState<DogEntity>, CreateDogUseCaseParameters> {
  final DogRepository repository;

  CreateDogUseCase(this.repository);

  @override
  Future<DataState<DogEntity>> call({CreateDogUseCaseParameters? params}) {
    return repository.createDog(
        params!.body);
  }
}
