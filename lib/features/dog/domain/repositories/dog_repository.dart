import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';

abstract class DogRepository {
  Future<DataState<List<DogEntity>>> getDogs(
    String? ownerId,
    String? establishmentId,
  );

  Future<DataState<DogEntity>> getDogById(
    String? dogId,
  );

  Future<DataState<DogEntity>> createDog(
    DogRequestEntity? body,
  );

  Future<DataState<DogEntity>> updateDog(
    DogRequestEntity? body,
    String? dogId,
  );
}
