import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';

class UpdateDogUseCaseParameters {
  final String? dogId;
  final DogRequestEntity? body;

  UpdateDogUseCaseParameters({
    this.body,
    this.dogId,
  });
}

class UpdateDogUseCase
    implements UseCase<DataState<DogEntity>, UpdateDogUseCaseParameters> {
  final DogRepository repository;

  UpdateDogUseCase(this.repository);

  @override
  Future<DataState<DogEntity>> call({UpdateDogUseCaseParameters? params}) {
    return repository.updateDog(
        params!.body, params.dogId);
  }
}
