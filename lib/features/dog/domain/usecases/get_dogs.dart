import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';

class GetDogsUseCaseParameters {
  final String? ownerId;
  final String? establishmentId;

  GetDogsUseCaseParameters({
    this.establishmentId,
    this.ownerId,
  });
}

class GetDogsUseCase
    implements UseCase<DataState<List<DogEntity>>, GetDogsUseCaseParameters> {
  final DogRepository repository;

  GetDogsUseCase(this.repository);

  @override
  Future<DataState<List<DogEntity>>> call({GetDogsUseCaseParameters? params}) {
    return repository.getDogs(params!.ownerId, params.establishmentId);
  }
}
