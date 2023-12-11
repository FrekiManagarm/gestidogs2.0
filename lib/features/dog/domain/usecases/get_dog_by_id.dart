import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';

class GetDogByIdUseCase
    implements UseCase<DataState<DogEntity>, String> {
  final DogRepository repository;

  GetDogByIdUseCase(this.repository);

  @override
  Future<DataState<DogEntity>> call({String? params}) {
    return repository.getDogById(
        params);
  }
}
