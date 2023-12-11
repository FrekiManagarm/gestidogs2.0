import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';

class CreateEstablishmentUseCase
    implements
        UseCase<DataState<EstablishmentEntity>, EstablishmentRequestEntity> {
  final EstablishmentRepository establishmentRepository;

  CreateEstablishmentUseCase(this.establishmentRepository);

  @override
  Future<DataState<EstablishmentEntity>> call(
      {EstablishmentRequestEntity? params}) {
    return establishmentRepository.createEstablishment(params);
  }
}
